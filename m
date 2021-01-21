Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A58042FFE8E
	for <lists+dri-devel@lfdr.de>; Fri, 22 Jan 2021 09:46:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F3896E9CE;
	Fri, 22 Jan 2021 08:46:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4F0A6E0D0
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 15:05:53 +0000 (UTC)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10LF4jlm087145;
 Thu, 21 Jan 2021 15:05:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=pqzxV5AicE7E6gUjXVufCLJzH9ztZGGcdKlZmeluv0s=;
 b=Q8rNW10eDG99gJ8enj7CJjWmNng1dfM8XfLSZBWPdPcRQmicuaoAakp6ae7sM3tFZyqv
 wPuqH3vm3p6Zmn6BRXHcccHMXRzAHpd/13p69qvEs8SCecBqhJXJZmfBqhYkI+UehqPm
 r6jl9rEL/i5mZ9GdpRJLlvHDdYDCncFwmiYbI+gv4eqtIpDBpuLcujmx/mX2YOQ5Gv5d
 rvP/fAXdT+we9w+PtOHlszzf7qfA7rNhLGqUzQVgcm+Lmro0wP3+S8UnI+z4Nbtr6z8P
 4aVkyEezbiIlwrCN0Zijuc22F/fMhE7UjNQP04BBtTYEvjNU+BWCY9SbGdgbjcRjNWqG 3A== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by aserp2120.oracle.com with ESMTP id 3668qmyqyr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 15:05:52 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 10LF5mts160500;
 Thu, 21 Jan 2021 15:05:51 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
 by userp3030.oracle.com with ESMTP id 3668rf3p4b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 21 Jan 2021 15:05:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WAajY9G21kJjjR+IRtuHrpXTAQLSwy/d+8uYvQPwUXaM64N+g8XDXBWschUoe24bwYFkY74+gNiQPbWwtK1rBgRm2m52iRdmkDqCs6UkQ3d7PA9ly1Kgs5P/FZuXofClIjFR4J/a6/f9u7BiyDNNyo+XVM7vVTJhwFU1axmxRd8g/iFSaNwz620KXYE7MuNV9rsNsBy6/62Mb4HoqLDNdd5a+WEAU2++oV+HPnujFo1Sdcyk/u25oxWJlTiw93foNgtXujngdjaDVAZTEVzUuCy2h1oH/UivZeH+fSpk1Uj0CMnYtg+YFk7yjyzQ8JtpwWX3rEAFTuLGIVdth/VaPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqzxV5AicE7E6gUjXVufCLJzH9ztZGGcdKlZmeluv0s=;
 b=i8xC7ERDr+9hasQNxZJhvXgYclDUALrSaL+Yit+nh/kg3qkZY7weuTg9lQZGSgFNPhntvai2FaareENu7cbeFg+zzsJejnrotlLz/rzHPbI0HfMPpiw71fAr6b+i8I/eo85Uz287RLX5NFdtYdVTToCYIa84JMfMfYTb/iQLs+EJ6SESWHcrHmP00GkFcpZa+/Q42XJDOKqPhUDLx61DHK5BUx1H9Dn5cckGsYwxG1a/pMRYG0ERS5mHhloew4LRzEmDAOD9qqdNs36W5Lm8zJ66LiiQI/PdvibfTQB5+4ZILoxhJlgQKz7mQfGO2Ub4oYaF6ipQpVGq7G8C6hqDSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pqzxV5AicE7E6gUjXVufCLJzH9ztZGGcdKlZmeluv0s=;
 b=M7QLXinzrc5UAkpjO0VfW2+YTodgPD2cm7ljwEA8gLEcEeC2Uq44LSvNZMwLVGGXNvQzDfH/sY4vZeKcLij90s0c3xPm1nGGx40C08vHo6xksPp4mIWz19EhnvOGPjUx0Eo2xYQsccrCBtRBh4vvbZ1ADEzB1VK7aGOwJOLOtA0=
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com (2603:10b6:a03:2db::24)
 by BYAPR10MB3559.namprd10.prod.outlook.com (2603:10b6:a03:11e::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3784.11; Thu, 21 Jan
 2021 15:05:45 +0000
Received: from SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::6da8:6d28:b83:702b]) by SJ0PR10MB4688.namprd10.prod.outlook.com
 ([fe80::6da8:6d28:b83:702b%4]) with mapi id 15.20.3763.014; Thu, 21 Jan 2021
 15:05:45 +0000
From: Chuck Lever <chuck.lever@oracle.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: possible IO map leak in drm/gem
Thread-Topic: possible IO map leak in drm/gem
Thread-Index: AQHW8AK5GbeC5YWAi0OD1HsTLRIw3qoyKM2AgAAE9QA=
Date: Thu, 21 Jan 2021 15:05:45 +0000
Message-ID: <357F7DBD-B7E3-4AEF-ABD4-7E7234F7DF1E@oracle.com>
References: <632F0FCB-8719-4E8B-B35A-DC0A2DF49369@oracle.com>
 <86bd5aff-ca8a-517f-1474-1be1d26255ae@suse.de>
In-Reply-To: <86bd5aff-ca8a-517f-1474-1be1d26255ae@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [68.61.232.219]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 541678ad-f682-472b-163c-08d8be1e0763
x-ms-traffictypediagnostic: BYAPR10MB3559:
x-microsoft-antispam-prvs: <BYAPR10MB355979DCB30C300DFD970D4B93A19@BYAPR10MB3559.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: IdfkeOHPLIcKomQf09QMS3m7YQYbSugZE9Gf1CaPKxqvqxKJjr9tIQ1wpBXBO1sK/i8Z1d9fAwyKqAok9z+4B9C2u4B6ynQxJ+/bHaZ0R9+f+YeYe+KbCZEQBPZeSgNngQvwM5h9zc6wVBOvUzYu4EtnMTWesMjZNEt1Cdi6xHsZdwggLwtXWsE52HdrmPDyG3/Wblxpk3zolBI9Tq6NQufr0Z6olaIyXWD8ZUSB16RwA4lZWlNCVbCxGKl2voCtAK4SA59twHGrxqzUDua8RgzMnUu92uNSadd3IzTs713rZrRfmVwuAEPqW+UMgQ6HSk9p7qbQ7es2JoBHCaz+qdqdh5cdbBtHGWqR51tqTyOfYUIWRsN2Zc4bj+vOw4E3lmpZprOBEBrbXuLi03npnXLMm2CqA4wHF7jUgy/kOol2JNs6IdPj79isWIrcw1ehZeQ/v/e2RrmYgYV8+Mz95EZw8OGC/wQIFFw6LU9CcvflU5HtoBG1rqXh3ipS5SxaQbpA60sE5AuJir8ZwEULkw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR10MB4688.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(366004)(136003)(346002)(39860400002)(376002)(83380400001)(186003)(76116006)(966005)(91956017)(86362001)(2616005)(36756003)(44832011)(8936002)(6916009)(66556008)(8676002)(53546011)(508600001)(2906002)(71200400001)(66446008)(6486002)(5660300002)(6512007)(316002)(66946007)(66476007)(33656002)(4326008)(26005)(6506007)(64756008)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?RjBNV2x3VjhNZ3d1SWdIVmJlK1pGYThwdEVPME13L2Q4ZTJNZzljYVR6OVEy?=
 =?utf-8?B?bldhNFZZdEU0N0JLRCtUYnRJWXRVckVvVzVvMnVmVXFoQjVlZS9xWEdsWWZx?=
 =?utf-8?B?Nk5OU1FYV3VmSm15dGRoYzlsWmN1T2QrRk1Ib2VSczFUdWUzRGdOZkFVcEdL?=
 =?utf-8?B?MVNCMmFnVTFIWEVJTDZWYUxVOTN6bU9RbDNsVUFlTkdEQTFYWUN6RU52SVMr?=
 =?utf-8?B?NXNRYkpuVi9IRi93Z3hhNERKZHY2T1RHeFN2Z3p3VVFBTFlDWHNNSkJrKy8r?=
 =?utf-8?B?dXVlVG4wazR6NkN6ZTA2cktzSzBUaVFNUkJjcXdJa3BROERZMlpJKzArQVhI?=
 =?utf-8?B?aisxWkRpY0lXbTJzbS96ajVPMVVXVVJTOWM5UllBN3dFemk5TlNjWEdYYmFR?=
 =?utf-8?B?SEtYZUZYdk54eGJyN09IcExrOFRONTRCN29IYWNacFFqeXd0VUhrNHdKTmZt?=
 =?utf-8?B?SXBBclljQ090NURkQmIxeXJNR3lzWExxV3VENHFnRXhDeG0rQllVcGw4K0x4?=
 =?utf-8?B?MjNEYWJuZWtoSHI5VnZiN0pxd1VEV0pINTYvNVRLVWZ3OUQyY1BiTTAzckNp?=
 =?utf-8?B?czJrU3hrQnQvd1RUTzc4MUpwcjUrMHhINzYrcXZqMWhZVDhmNHY0ZzlIR28y?=
 =?utf-8?B?K0l1Q29pOXZVUkMvc3FwUDA5STMvaC9TWk54NGdrSnhFWk5LWDRTTHcrUlVp?=
 =?utf-8?B?VVJIbWYzQ0JnbTJySUxwZHdCSVV0YVhRbkllL1RKbUxNbEE0bDVsbC9UbTda?=
 =?utf-8?B?OVREajRXQUR4Vjlkcmlxd2toaTcrS25lRGpWcDllVVA1ZnFob1BiRFpZMS9Q?=
 =?utf-8?B?TjRpOFhGK0ErZ2hSb0I4SVIvU1k2MXZyUElFMmQ5cGdrd0RYQWNyQ2FWYyt6?=
 =?utf-8?B?N2Q4encrVXBQQjJpNkVPU0xiV0hkWXpOM3BvbVJycG5xVzVBMEpyaTZwZElh?=
 =?utf-8?B?K1JVL0NRSjVZeStrbUpjVVF4WVd6Uk9HM0ZNbmdPRlNhYWJRL2o2bWkra09Q?=
 =?utf-8?B?RUs3LzBSTUpjZDcxMXUyQ2FUK2tveFUxbzJwbXJyZm8wczJOcHQ4MTFjRjBU?=
 =?utf-8?B?YnZKNCt3QzAxWXpWNkxJQVpYeTJqMmh3K0t3SGUwN3p5ZTRvVE9raGxJN3ps?=
 =?utf-8?B?V2VEd09nYzYrMXhwNXlqbWlwZ1dCQXBlTXAzcE9oUHZTLzd3b3VvaHZSbEpj?=
 =?utf-8?B?aDI0amptdjBYNzA2bjl1eGdRdmtZT09vOVBhM1RMSjFXUHpRSTkxSVpLMWlW?=
 =?utf-8?B?ZnNBYVp4eG9lWXpjbFZYK096dUNoa09QSDl4MzR1MVlMSnJKMnVWNTVYM002?=
 =?utf-8?Q?gZiuD8AWFNDylB/B0G5lHNvGYXb8dMXyez?=
x-ms-exchange-transport-forked: True
Content-ID: <5CAA35CEFE3B7D45B5A09211042D36C5@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR10MB4688.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 541678ad-f682-472b-163c-08d8be1e0763
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Jan 2021 15:05:45.3702 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Qk2vPldUrzhUSwFN5OgiJeWRcxRIwN/lPIq0WdQq1m48IqeW0ISwDTsJ4m/0IBw7rJf1osqPXA+neZtasLDTWA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB3559
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101210085
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9870
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 priorityscore=1501
 adultscore=0 impostorscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 phishscore=0 clxscore=1011 bulkscore=0 mlxscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101210085
X-Mailman-Approved-At: Fri, 22 Jan 2021 08:45:43 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gT24gSmFuIDIxLCAyMDIxLCBhdCA5OjQ3IEFNLCBUaG9tYXMgWmltbWVybWFubiA8dHpp
bW1lcm1hbm5Ac3VzZS5kZT4gd3JvdGU6DQo+IA0KPiAoY2MnaW5nIGRyaS1kZXZlbCkNCj4gDQo+
IEhpLA0KPiANCj4gdGhhbmtzIGZvciByZXBvcnRpbmcgdGhlIGJ1Zy4NCj4gDQo+IEFtIDIxLjAx
LjIxIHVtIDE1OjM1IHNjaHJpZWIgQ2h1Y2sgTGV2ZXI6DQo+PiBIaSBUaG9tYXMtDQo+PiBJIHdh
cyBub3QgYWJsZSB0byBmaW5kIGFuIGFwcHJvcHJpYXRlIG1haWxpbmcgbGlzdCBlbnRyeSBpbiBN
QUlOVEFJTkVSUywNCj4gDQo+IFRoYXQgd291bGQgYmUgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZw0KPiANCj4+IHNvIEknbSBtYWlsaW5nIHlvdSBkaXJlY3RseSBhcyBjb21taXR0ZXIg
b2YgcmVjb3JkIGZvcjoNCj4+IDQzNjc2NjA1Zjg5MCAoImRybS90dG06IEFkZCB2bWFwL3Z1bm1h
cCB0byBUVE0gYW5kIFRUTSBHRU0gaGVscGVycyIpDQo+PiBJJ3ZlIG5vdGljZWQgdGhhdCBzaW5j
ZSBwdXR0aW5nIHY1LjExLXJjIG9uIG15IHRlc3Qgc3lzdGVtcywgb3Zlcm5pZ2h0DQo+PiBvbiBh
biBvdGhlcndpc2UgaWRsZSBzeXN0ZW0gdGhlIGxvYWQgYXZlcmFnZSBzZWVtcyB0byBncm93IGFz
IHRoZSByZXN1bHQNCj4+IG9mIGEga2VybmVsIHdvcmtlciB0aHJlYWQuDQo+IA0KPiBFYXJsaWVy
IHRoaXMgd2VlayBJIGZpeGVkIGEgY291cGxlIG9mIGxlYWtzIGluIHRoYXQgY29kZS4gQ291bGQg
eW91IHBsZWFzZSBhcHBseSB0aGUgcGF0Y2ggYXQgWzFdIGFuZCByZXBvcnQgYmFjayBpZiBpdCBm
aXhlcyB0aGUgaXNzdWUuDQo+IA0KPiBJZiBpdCdzIGEgc2VwYXJhdGUgcHJvYmxlbSwgSSdsbCB0
YWtlIGEgY2xvc2VyIGxvb2suDQoNClRob21hcywgdGhhbmsgeW91IGZvciB5b3VyIHF1aWNrIHJl
c3BvbnNlLiBJJ3ZlIGluc3RhbGxlZCB5b3VyIHBhdGNoDQpvbiBvbmUgc3lzdGVtIGFuZCBpdCBs
b29rcyBwcm9taXNpbmcgYWxyZWFkeS4gSSdsbCBsZXQgaXQgc29hayBvdmVybmlnaHQuDQoNCg0K
PiBCZXN0IHJlZ2FyZHMNCj4gVGhvbWFzDQo+IA0KPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvZHJpLWRldmVsLzIwMjEwMTE4MTQ0NjM5LjI3MzA3LTEtdHppbW1lcm1hbm5Ac3VzZS5kZS8N
Cj4gDQo+PiBJIHVzZWQgInBlcmYgdG9wIiB0byBzZWUgd2hhdCBpdCBoYWQgZ290dGVuIHVwIHRv
LCBhbmQgaXQgYXBwZWFycyB0aGF0DQo+PiBpdCB3YXMgc3BlbmRpbmcgbG90cyBvZiB0aW1lIHdh
bGtpbmcgYW4gaW50ZXJ2YWwgdHJlZSBvbiBiZWhhbGYgb2YNCj4+IG1lbXR5cGVfcmVzZXJ2ZSgp
Lg0KPj4gVGhlIG1vc3QgZnJlcXVlbnRseS1vYnNlcnZlZCBzdGFjayB0cmFjZSBzZWVtcyB0byBi
ZToNCj4+ICAgICAga3dvcmtlci8zOjEtMjM1NSAgWzAwM10gNjA5NTAuMTUwOTI4OiBmdW5jdGlv
bjogICAgICAgICAgICAgbWVtdHlwZV9yZXNlcnZlDQo+PiAgICAgIGt3b3JrZXIvMzoxLTIzNTUg
IFswMDNdIDYwOTUwLjE1MDk0Mjoga2VybmVsX3N0YWNrOiAgICAgICAgIDxzdGFjayB0cmFjZT4N
Cj4+ID0+IGZmZmZmZmZmYzBjNjYwODMNCj4+ID0+IG1lbXR5cGVfcmVzZXJ2ZSAoZmZmZmZmZmZh
MDA1ZjlkNSkNCj4+ID0+IF9faW9yZW1hcF9jYWxsZXIgKGZmZmZmZmZmYTAwNWFhYzEpDQo+PiA9
PiB0dG1fYm9fdm1hcCAoZmZmZmZmZmZjMDQwZjI2NikNCj4+ID0+IGRybV9nZW1fdnJhbV92bWFw
IChmZmZmZmZmZmMwNDJjNWNkKQ0KPj4gPT4gZHJtX2dlbV92bWFwIChmZmZmZmZmZmMwNTA2YTdm
KQ0KPj4gPT4gZHJtX2NsaWVudF9idWZmZXJfdm1hcCAoZmZmZmZmZmZjMDUyMzc0MSkNCj4+ID0+
IGRybV9mYl9oZWxwZXJfZGFtYWdlX3dvcmsgKGZmZmZmZmZmYzA0OWEzNGEpDQo+PiA9PiBwcm9j
ZXNzX29uZV93b3JrIChmZmZmZmZmZmEwMGRkOTJlKQ0KPj4gPT4gd29ya2VyX3RocmVhZCAoZmZm
ZmZmZmZhMDBkZGU0NikNCj4+ID0+IGt0aHJlYWQgKGZmZmZmZmZmYTAwZTIyYzQpDQo+PiA9PiBy
ZXRfZnJvbV9mb3JrIChmZmZmZmZmZmEwMDA0MTkyKQ0KPj4gSSBzZWUgYSByZWd1bGFyIGNhbGwg
dG8gbWVtdHlwZV9yZXNlcnZlKCksIGJ1dCBuZXZlciBhIG1hdGNoaW5nIGNhbGwgdG8NCj4+IG1l
bXR5cGVfZnJlZSgpLCB0aHVzIEkgc3VzcGVjdCBhIGxlYWsgb2YgSS9PIG1hcHMgaW4gdGhpcyBj
b2RlLg0KPj4gLS0NCj4+IENodWNrIExldmVyDQo+IA0KPiAtLSANCj4gVGhvbWFzIFppbW1lcm1h
bm4NCj4gR3JhcGhpY3MgRHJpdmVyIERldmVsb3Blcg0KPiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9u
cyBHZXJtYW55IEdtYkgNCj4gTWF4ZmVsZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55
DQo+IChIUkIgMzY4MDksIEFHIE7DvHJuYmVyZykNCj4gR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4
IEltZW5kw7ZyZmZlcg0KDQotLQ0KQ2h1Y2sgTGV2ZXINCg0KDQoNCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
