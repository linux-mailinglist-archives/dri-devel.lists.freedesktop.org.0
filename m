Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9B7314EC1
	for <lists+dri-devel@lfdr.de>; Tue,  9 Feb 2021 13:14:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32F16E02B;
	Tue,  9 Feb 2021 12:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5F36E02B
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Feb 2021 12:14:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bxl3YzucxSKPDAu8CAIxPWXLjQa6cqRoi7OhvuIs5gN0bXeDJMWgQMhucSgwUefcQqcKAqfHGKS0L+UPU8rlX2XWPmAwNxLnT+tN+/POViKYk2+gzAwFgfoUbnFZSj5fleZ1bHV/RAV0Da58oeOSZPtrUPk9mK7O46P/xW+PKVne7JKMB80iJg8c4TqjmgRhI5NHdq6cGWnquBC9ObPaNpxX42LUzWFd8wvdgaqNK9O7Wv2kIlfPRrjEcO7xSwHMcmL7LJEpAVXtAqHKSOJWafLIarjYHEKnCI14JGH3x58BVHxqMSrpNHRQt8XRn167/81eGtwVN8CVrHUw5Awipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iH9i17yq2BJEYDOd4FjUTB5cSHS4Z3GVwGPGQUOTkx8=;
 b=N1WQSCoHSGG+L8UXUmtt4Nox0pUMCu4NGl+3e7CQdN7FeJeLuPm9qLiMspy1B4JFfkKpzIjh7/WHKMo9iJwocK1MejPgUw3VUkA1BFUmgncr43ABrQvbqX+P+D4sRUCwf3UfI0EdmFROGGhUJuSObtQdziNsoeWxHso49pfgv0fum6bPHRZGV7AtMrX5wXs6kTUv68kQwoimx/0MDPrdJJ7FhKpbHe8KwV6+qjPD/QgghNy8XNPe48pq6dWM/wI83f8wQ+hfuMs3i8a4zMf4G/6+6lr8htbCzyZF0YrlfvaVQqmDkeP5ZzC6szMoR4whhal9o/7nahHN42VgaXOU6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iH9i17yq2BJEYDOd4FjUTB5cSHS4Z3GVwGPGQUOTkx8=;
 b=kg69qioW6dsepTZwRjoE0tdfqcWC7RBApfYpD9mhqb5VM4Y1Jp7OAjbHRKjS/Q/BCNsZvOAlz3H6+dkLSLs5P0ZPbcIf+230V1Ov67or7y08rLSJvi/XmqnOIzprJYOKFv3xFZMYHgtHhbv04XnfbrKg++dsHGtDHO1NryIjRzY=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4813.namprd12.prod.outlook.com (2603:10b6:208:1bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3825.23; Tue, 9 Feb
 2021 12:14:06 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3825.030; Tue, 9 Feb 2021
 12:14:06 +0000
Subject: Re: [RFC][PATCH v6 3/7] drm: ttm_pool: Rework ttm_pool_free_page to
 allow us to use it as a function pointer
To: John Stultz <john.stultz@linaro.org>
References: <20210205080621.3102035-1-john.stultz@linaro.org>
 <20210205080621.3102035-4-john.stultz@linaro.org>
 <8a4cacb7-3042-53c7-02fe-de18cc49fc0e@amd.com>
 <CALAqxLX7KT8Zqv+qjpbiDzSLubvDgXz6Ayk_U_q5e0veweHcFw@mail.gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <884a5f8f-00e2-5aa6-6dfb-67e86c89e599@amd.com>
Date: Tue, 9 Feb 2021 13:13:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <CALAqxLX7KT8Zqv+qjpbiDzSLubvDgXz6Ayk_U_q5e0veweHcFw@mail.gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:444c:9a67:948b:2493]
X-ClientProxiedBy: AM0PR10CA0122.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:e6::39) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:444c:9a67:948b:2493]
 (2a02:908:1252:fb60:444c:9a67:948b:2493) by
 AM0PR10CA0122.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:e6::39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3825.20 via Frontend Transport; Tue, 9 Feb 2021 12:14:02 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9f3af74b-497c-4f59-a002-08d8ccf4322c
X-MS-TrafficTypeDiagnostic: MN2PR12MB4813:
X-Microsoft-Antispam-PRVS: <MN2PR12MB481363BDFA3E836DCD13D610838E9@MN2PR12MB4813.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EzyB6QbU6h2X3sCfTxb+bL9XpFV7rreUNgd598hY1I7heBkrKahSoACKGKgRE/DXUPOfluLXqfKdDidzNxeFP4tvc4f51Qf76Q/emXmy5NwOE2h/oBayZmh27vLGMUIGooc6iEhLobv/QR3lGeLpGRPm+c9k1QyKY4Iq1SCSE0olVmTL2CWuz4rXCnZuiViFpK1fibciObKwu5QnhkUg+jBOy8PMmLFeuTE3cU+5LP4e0up+/Sca3whTfbXXQYpb43tt0IUTVr3agVRd/UhdGwtJl03z7TVRmSjWVpkKaeMkBJwQXd+nTUpAUR0anjJmCPRUI6OEEAPcB9R5wOpMBMof8ni5GQWmYuH8OJFsjpnLmuB8dpM7ytPhmwj9ydjRygWEoa2zY28ZqinGG0kVtcIaC456dmXcVBGuHAztHuaDnnSUTlypH/7xNosn3XkZQmo3dzK5IKbiiMHTCHqudGEzun+d6L39xhSZfhCoNRcvQAE6HFvKvodxDzH08fUqA+av3mdgutu792gJK9P2Bk94J96SWZH4y+Cv0mQYrt1vK690cirEVRYlpFd6CBMmDCldz9aaJNEgoxzY1InysbITo9Tthj43KrXuq6++nYw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(136003)(39860400002)(396003)(376002)(346002)(52116002)(478600001)(31696002)(2616005)(16526019)(4326008)(5660300002)(8936002)(66574015)(6916009)(6486002)(36756003)(66946007)(6666004)(54906003)(31686004)(2906002)(8676002)(316002)(66556008)(7416002)(186003)(53546011)(66476007)(86362001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z01CYTA1RUx4d2pXWDRoMDgwOEVjSXNLUkhVcjRyT3lhUEhPT0JUQ1RiVHph?=
 =?utf-8?B?RFVkTDZFQkZVQ09RUVIvV2J2aFgwUjVMVnBOU0FQZ3J2a3M0NndQbC9TbUpt?=
 =?utf-8?B?WStCS2xsZm5pUDF3L1h6VjBjaE5nUWZjTmRFaElSY0ppc3dXaDRrbDZUdk9m?=
 =?utf-8?B?YU05UFgza21wdzh5WUszWHI2S1JPOVZiNytkbU9TZGYwaGR0TVc2TFFTdEpB?=
 =?utf-8?B?SUlSeWg5NnIvZFgwOEIrbm9pZXMzUFR6NDNYVHJITmRXSHM1UU85dVZsa0hm?=
 =?utf-8?B?T01xZmVCYXdZRk82OGRuUG9TUFRubm5ZTUgyOW84ZHBWNmIycXU3bzdBdTY5?=
 =?utf-8?B?V1Qxb20xQTlEU2swb21FaFhWWnpWL3lPNk94ZVBkSEpML0E4M05zVDl4U3NU?=
 =?utf-8?B?Q3kxTGFUZXVKNHh6cXIxRGZKcHBZcjN0Z2U2R0dER0VQRmxBYnFXWEd4VkdP?=
 =?utf-8?B?TXdORnMySzEwWmJ6clBlZ3BGRjQ0WGkrTEVTcmlwdFN6djZZU2M4OFFNZWFw?=
 =?utf-8?B?NjVzajBzQ2xONlhqUDVvYi9VN3p1b3MvbHhVMkdZRWxaVmV6SXJZVEJXUFNG?=
 =?utf-8?B?dWtIbzRvN1h6MUI2cytBUHMvTGtaL1RrT3V3ZG82cFZzcklCdFlJV0UvL1J0?=
 =?utf-8?B?ZDQ5bURoeWtvYUtsTldleWo2S0ZpRndhQ1RySUtJNXp3ZGhHLy9RSVJ5WS8z?=
 =?utf-8?B?ZFYxNTFoTGFpQVNUcEJFMzlxdkdSRjZPd3BDa0xPZFh0SSs4S3lDSWhsNmxj?=
 =?utf-8?B?YmI2U1RRRkVQYnA1eVE2a09SOGkrblRoVmRRSWNMMEErR081SElNWHpPOGxT?=
 =?utf-8?B?QU9tWklTellneTZIWFNTSXNFajlXOW02MytDVVNHWnZzWGRzTFNZdjJ5M0xm?=
 =?utf-8?B?SmlDTVdVaWJLR1lQaUxhbUJOQTJSN3hhUDZIYlpPV2p5elRMd0hZNndVVHBC?=
 =?utf-8?B?TzlPeU5qczc4czVMYmlvYmxnTStmYTVWNUNBODNpZFF3dGwwbUhNTWoydDZt?=
 =?utf-8?B?VEFaSWNjY2huUnpEYjhHOWo5U1FkU0gxSmRCUDhtcmFvTFA5SnNNYWhEZ0o5?=
 =?utf-8?B?OE91TDNVa3BaUlduUHhpWXFrVXJXbVpsMjNmSjBqTnR5SVc3MW1BclRhR1RX?=
 =?utf-8?B?cGNTdzV4N1RaZk5PTUtoVExiTnlTbnNtWk9nVDkzM1J6WTdjckdUalUxOW5R?=
 =?utf-8?B?TmI5NjF6UkUxVlNCNGlwMVhpQUg1S1htbFVrSksvRGJWOFNLN0NXZFJWeHBk?=
 =?utf-8?B?L3FreWN0eG5HZHNvaHdsdDEwdGI1UmNXWHVQRk9VWGEwRzZOSzBKQmxRYldM?=
 =?utf-8?B?Mk54S2NFQ3Q4RFJ5dkw5c0dyZkRsSWRPcFNYQloxTVdSMlZKWmZRVlpVSUdG?=
 =?utf-8?B?RWlwM0VpbFRac2JOY3RRWENPeE9PbVg4T244Y1NCaXJ3d2NLZ05SVWdNN3VR?=
 =?utf-8?B?d3FwcU9TQ2lWNG5ybllmaGRPSnV5ZlBvd1ZxN2FyRmd5VUFQYnVaNi9qOXlv?=
 =?utf-8?B?S21hT3RocDlDelFBR2RyNTdwc09SVm1zZ29oc2UrbnN6SFN6MXlNVzVTaTNF?=
 =?utf-8?B?V0Y2T2t2alk3VUFFMERpcEJmRWUwZlpTQXFmN2ZoUTFPQUFwQmpJM3JhUHV3?=
 =?utf-8?B?Nk1FOThzbTcydjYrVTVkVThsOS9tcTZWOTFEeCtOREx3TGpSdklyWWxtQ0p5?=
 =?utf-8?B?R2xEVUptbjVmWE1WTSt4aVFvbUJPUVJzb0dNcDE5VzdnOXIvQURpK0pHdXdz?=
 =?utf-8?B?MmtoTEJvVWZtcDVZbFV1N1ZjQUg0M0ZjMWNpSUVHSlpuWUNzMkkycmNPQUJX?=
 =?utf-8?B?ejJnL2Zxb3g1NUdCNGsxbldDdEpqeHRLdWxyOHJybXk2enU4RkJTbkVIRlkz?=
 =?utf-8?Q?fvu++OaQ/w1Gq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f3af74b-497c-4f59-a002-08d8ccf4322c
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2021 12:14:06.5583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lxXswcqV65Tm1vDmz56XCaUPm9MYQsKorEYKPWYI0ETUM81AhJsmMQBRzZqamhvQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4813
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
Cc: dri-devel <dri-devel@lists.freedesktop.org>,
 Sandeep Patil <sspatil@google.com>, Ezequiel Garcia <ezequiel@collabora.com>,
 Robin Murphy <robin.murphy@arm.com>, James Jones <jajones@nvidia.com>,
 lkml <linux-kernel@vger.kernel.org>, Liam Mark <lmark@codeaurora.org>,
 Laura Abbott <labbott@kernel.org>, Chris Goldsworthy <cgoldswo@codeaurora.org>,
 Hridya Valsaraju <hridya@google.com>,
 =?UTF-8?Q?=c3=98rjan_Eide?= <orjan.eide@arm.com>,
 linux-media <linux-media@vger.kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Daniel Mentz <danielmentz@google.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CgpBbSAwNS4wMi4yMSB1bSAyMDo0NyBzY2hyaWViIEpvaG4gU3R1bHR6Ogo+IE9uIEZyaSwgRmVi
IDUsIDIwMjEgYXQgMTI6MjggQU0gQ2hyaXN0aWFuIEvDtm5pZwo+IDxjaHJpc3RpYW4ua29lbmln
QGFtZC5jb20+IHdyb3RlOgo+PiBBbSAwNS4wMi4yMSB1bSAwOTowNiBzY2hyaWViIEpvaG4gU3R1
bHR6Ogo+Pj4gVGhpcyByZWZhY3RvcnMgdHRtX3Bvb2xfZnJlZV9wYWdlKCksIGFuZCBieSBhZGRp
bmcgZXh0cmEgZW50cmllcwo+Pj4gdG8gdHRtX3Bvb2xfcGFnZV9kYXQsIHdlIHRoZW4gdXNlIGl0
IGZvciBhbGwgYWxsb2NhdGlvbnMsIHdoaWNoCj4+PiBhbGxvd3MgdXMgdG8gc2ltcGxpZnkgdGhl
IGFyZ3VtZW50cyBuZWVkZWQgdG8gYmUgcGFzc2VkIHRvCj4+PiB0dG1fcG9vbF9mcmVlX3BhZ2Uo
KS4KPj4gVGhpcyBpcyBhIGNsZWFyIE5BSyBzaW5jZSB0aGUgcGVlciBwYWdlIGRhdGEgaXMganVz
dCBhIHdvcmthcm91bmQgZm9yCj4+IHRoZSBETUEtQVBJIGhhY2sgdG8gZ3JhYiBwYWdlcyBmcm9t
IHRoZXJlLgo+Pgo+PiBBZGRpbmcgdGhpcyB0byBhbGwgcGFnZXMgd291bGQgaW5jcmVhc2UgdGhl
IG1lbW9yeSBmb290cHJpbnQgZHJhc3RpY2FsbHkuCj4gWWVhLCB0aGF0J3MgYSBnb29kIHBvaW50
ISAgSHJtLi4uIGJ1bW1lci4gSSdsbCBoYXZlIHRvIHNlZSBpZiB0aGVyZSdzCj4gc29tZSBvdGhl
ciB3YXkgSSBjYW4gZ2V0IHRoZSBuZWVkZWQgY29udGV4dCBmb3IgdGhlIGZyZWUgZnJvbSB0aGUK
PiBnZW5lcmljIHBhZ2UtcG9vbCBzaWRlLgoKV2hhdCBleGFjdGx5IGlzIHRoZSBwcm9ibGVtIGhl
cmU/IEFzIGZhciBhcyBJIGNhbiBzZWUgd2UganVzdCBoYXZlIHRoZSAKbHJ1IGVudHJ5IChsaXN0
X2hlYWQpIGFuZCB0aGUgcG9vbC4KCkhvdyB0aGUgbHJ1IGlzIGNhc3QgdG8gdGhlIHBhZ2UgY2Fu
IGJlIGNvbXBsZXRlbHkgcG9vbCBpbXBsZW1lbnRhdGlvbiAKc3BlY2lmaWMuCgpSZWdhcmRzLApD
aHJpc3RpYW4uCgo+Cj4gVGhhbmtzIHNvIG11Y2ggZm9yIHRoZSByZXZpZXchCj4gLWpvaG4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
