Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DFC2D7262
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 09:57:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DC36ECC2;
	Fri, 11 Dec 2020 08:57:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690049.outbound.protection.outlook.com [40.107.69.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 775716ECC2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 08:57:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TtdpKBl2iBHnmAtQBEjSI95PFWGoLWB6QVDerbIs4rvTKRLjorPKFg3nswGDP0ym7eN6Y6/VGZbKnlA675jlAVjF10qGZ6PfVJSohSnYiSf8fGclSiLer2kqEvxdUb+8Ur8JW7VxWgJNP+bXEVcusLh2oW1sLo5c4AT9AoA9mmdnT3Ax155sZ+8ZoajwINoOySNAXzbTyuCRNWCOrLCX6dMKuadY51pjU0bUI7OkFb97DjnZS+E2TGPrN8HwhsCaXTynfHYbsA5C+kdTJ+PVuvsEoY7HAcH59+tLulENPmUKuAJLVr3P9j0emal/OtA/dmoMh8dLHqXdcMfIQE4qpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+k+5OHb/xaqqaDub2zkMDfWuQA3O5yNUOMLei0XEve4=;
 b=J4rE5bo3HD8lxTNMntjF5P+Ozte8tkvuGL9b9/ZIu1h+c+w1f3y/iHkWtmTkSOKaq+ASoCQxDrvq2i2Q/LXHMHM2L/mjh3z+7vm82q2stAltmZ8NNNaz4SDvKv+7BAjzawu2adPHO1q3rJaUkl8OwuQ1ARHo6znKkIQZtIBXg0iI1N+dbOM4o4IH4UD8eAMyXkYti4NWk74kALJthZ4b7MxYxNISBSrvL52VuR4TrBpiZv35E/1nVrn92CAM+avPGsOSCJfaO6yfzKpsIZiXEaMD9/zAi6GLRDMGZ8jlT2edJXc8G9KhY47qzfKRaf8U2XhbiHxoVKUILZqcg7IbBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+k+5OHb/xaqqaDub2zkMDfWuQA3O5yNUOMLei0XEve4=;
 b=tjRt7y0DZcq7gDaPM72WKIhL5s2EG4qA9zfYWjINuYg4JSvGt8xoF53moI68/U427P9IfpQdUsHmxlmtuOjIvhPN8qa4uH+QXk7blPuMd+h4cN/EbH5HHLncU1u35MTzMUYBzlbRM30gDS9Fsp1nVKddY10wYUCHVDzjfccpU9Q=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB4753.namprd12.prod.outlook.com (2603:10b6:208:89::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.17; Fri, 11 Dec
 2020 08:57:46 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.016; Fri, 11 Dec 2020
 08:57:46 +0000
Subject: Re: Fence wait in mmu_interval_notifier_ops::invalidate
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>,
 Jason Gunthorpe <jgg@nvidia.com>
References: <912c29f1-4e17-8b66-419b-1854d03845fd@shipmail.org>
 <20201209163731.GU552508@nvidia.com>
 <b4018af1-998f-dc79-c83a-8eac95cb1ceb@shipmail.org>
 <1b52322f-569e-f523-3baa-ffb822cb72c2@amd.com>
 <7be4d61e-c82f-6acf-a618-9db29d05094a@shipmail.org>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <806af8e8-7dfb-bdbb-0d68-c2229dd88b40@amd.com>
Date: Fri, 11 Dec 2020 09:57:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <7be4d61e-c82f-6acf-a618-9db29d05094a@shipmail.org>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM8P191CA0013.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::18) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM8P191CA0013.EURP191.PROD.OUTLOOK.COM (2603:10a6:20b:21a::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Fri, 11 Dec 2020 08:57:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1c4fadd0-ca07-4c06-1fa0-08d89db2d43d
X-MS-TrafficTypeDiagnostic: BL0PR12MB4753:
X-Microsoft-Antispam-PRVS: <BL0PR12MB475360A27F251171BA84564783CA0@BL0PR12MB4753.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kYXnwpk1/cEV0CeARcF+4CCN6FQzAOpRULE807l08Ce3ujJA6Z9x4TRW9Bfe9ZmPcAz/mibJbpJWh2GlZgGv2HxVrukPIjAuvzqH3cCXhUV4MTjgMik7R+JrSvWK1FjF5jCSRoeEFoS94s8Zh4aP6/Jg6NhGlN5KVLsIrL4j74rvihaOtsm3CzTYxEAU1ma5pkkHtT17vNn9xtiacDk5H3+bpvkzwebX9xZseTb1O8knr5CD+FcBqZCUvBOUP0nBjFXqSNHI68I2292Lyqge3KhiEkYZxVxOTrVNoz5C5j78eOrt2OjnbJ2A+Y2qZ9l8yWkvyntYpnvSO3oqI1RmTcBMrKoF/qAhJvbmYYh18rOg/4utj4+SQTBqxq5s91+fh2Q8NNUjQog0h0neY+K7Tnpktql5tsqx7/Yq1Kdo/OP1YmIatB5VOZAvcsWQ74sd
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(346002)(83380400001)(53546011)(5660300002)(66476007)(2906002)(2616005)(8676002)(4326008)(6666004)(186003)(66574015)(36756003)(52116002)(34490700003)(8936002)(110136005)(86362001)(16526019)(31686004)(31696002)(6486002)(66946007)(66556008)(508600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?NUFEVTNlZ2FiQTUyWWo3VzIwZkxNU0FUTk5UVHFEUXU3RXFVaXpkTUhuV09o?=
 =?utf-8?B?eGltb1RGNDdIbXJFSEMvZWlaWHM3UnBjUGp2WXBzbmh1clpnS0MvV1JmVlF3?=
 =?utf-8?B?ZFNud1lvYzNkd2diaTR1MUl0RkpUT0pjWTJ2ZzdqNnlpYithdkgySk9JaXRP?=
 =?utf-8?B?VUhVdVBRZHg5VUVhaFNaSDNlclpib1B2eHRhZzE1TE9uUUlsSzNZSkhTUENX?=
 =?utf-8?B?UUdaaENCbGo2MHl5RXZQSDQxcjVJazRKVGdOTy9ZUUFJbnM3bHJYby9YYVl0?=
 =?utf-8?B?VTFTOU9JZGdxZUxBV3hSTG55eEJvY2Y1cTVHVVZQSGJ5amtwS3ZsQ2ZwdFFK?=
 =?utf-8?B?Mms3SmRlU2h0bDhlclQ3SWFNLzlJUXJRVVJ0WUdiQUx3TVd1cnZ1Tjc4WFdq?=
 =?utf-8?B?QTF2UnRWQVhINlFjZ0lUYnpUM0lRcnFqdHVHTUEzdnZhVlVHQXcySDIxZ0dS?=
 =?utf-8?B?Q0VpbUptdUl2UkowQ0ZPKys0OVhXYTlWS1pQeDNzTlZoSFptSXFzYWxwYUUx?=
 =?utf-8?B?aHI4NFdQLzYyamdpeTJpbEQyUDQ2WUlrZGswNlFHR25vM2wrZG96blJrdGRo?=
 =?utf-8?B?bTFNZHpscmdtdDRHRkRqc3FaUXJacTJXd2ZnRVBkY0VqVitRU1pKNEE5WEdx?=
 =?utf-8?B?Znh0VnU3ZzVTbmsvOWZOalMvU2tFUHczU0hUMjRxa1NzRjljaTJKTjU2SlY4?=
 =?utf-8?B?UE95bG5qRFl3UnlBcHB3blJxa0o3S2xKQjNPczBTMWdMRmRONnhmbk1ReUtE?=
 =?utf-8?B?Qm9VSGtJdjVuaDc4MXYzdlJlclcyNkVSWlNETUFHZUVSaE95c2lVM1FvQ01U?=
 =?utf-8?B?QnNwQk80ZENZRU9MMFJkQjMyNDZuT0lobmQ5NVBBNEkzcHQyaldhTmpuTGtQ?=
 =?utf-8?B?dytFdTdCc2JHOW9Jb2swMVNPdm1Wcm9RNDd1ZTl1c3FYdjZRN3NzRjc4VmxB?=
 =?utf-8?B?TCtFVzIwQ1IveGp2QXEwZ0xUQ0hMcCtLTkJMV1JmdVdzTWlOWFRRSGNibm5n?=
 =?utf-8?B?YUk4S21EUkREVnlsSmhKQUs2aHhtbk5MSHQrWDR0TFUwaXl0OXhlbmR1RWtH?=
 =?utf-8?B?M2NKYTZEbURJeFYrNWJNQ1o5alFybFc3cjJRd2dUSXo0VXlhbUtFR1dGVDF6?=
 =?utf-8?B?TG9rNGludGE1R0s4VHdRRDZrU2VYdXRJcWJQZHpZY29Fa1pXeFhsSGZDNUZi?=
 =?utf-8?B?alZ2R2QvZGt6UU00MDV6MEQ4TnZwWktVck1TTXpCTXlCdnZqM3dWSFcrN1du?=
 =?utf-8?B?Y1MzWnlsUmduUUxaY21FQXViS3lRSzNLUWhtMGpRVldqbEFaR1R0ZGpjajRD?=
 =?utf-8?B?ajB3TjdzUlhDQ2ViRmR5dlBnSmZIVjh4dTVuSDhWMU5WK1dFYVlGS1BxcUxT?=
 =?utf-8?B?dHNDYTZCR051c1k3ZE5QdjJPeHIyanpEQ2JtMTBBT0pEcE1HdHhEMnlwb1ZK?=
 =?utf-8?Q?BGjLqfrT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2020 08:57:46.2890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c4fadd0-ca07-4c06-1fa0-08d89db2d43d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EC0GfBcnLiTvkk/sNcwMmjKTHujSJPMi0LA67KrE3h6pUNDYxoMZReb0uldZM4XU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB4753
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTEuMTIuMjAgdW0gMDg6NTAgc2NocmllYiBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpOgo+
IEhpLCBDaHJpc3RpYW4KPgo+IFRoYW5rcyBmb3IgdGhlIHJlcGx5Lgo+Cj4gT24gMTIvMTAvMjAg
MTE6NTMgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+IEFtIDA5LjEyLjIwIHVtIDE3OjQ2
IHNjaHJpZWIgVGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKToKPj4+Cj4+PiBPbiAxMi85LzIwIDU6
MzcgUE0sIEphc29uIEd1bnRob3JwZSB3cm90ZToKPj4+PiBPbiBXZWQsIERlYyAwOSwgMjAyMCBh
dCAwNTozNjoxNlBNICswMTAwLCBUaG9tYXMgSGVsbHN0csO2bSAoSW50ZWwpIAo+Pj4+IHdyb3Rl
Ogo+Pj4+PiBKYXNvbiwgQ2hyaXN0aWFuCj4+Pj4+Cj4+Pj4+IEluIG1vc3QgaW1wbGVtZW50YXRp
b25zIG9mIHRoZSBjYWxsYmFjayBtZW50aW9uZWQgaW4gdGhlIHN1YmplY3QgCj4+Pj4+IHRoZXJl
J3MgYQo+Pj4+PiBmZW5jZSB3YWl0Lgo+Pj4+PiBXaGF0IGV4YWN0bHkgaXMgaXQgbmVlZGVkIGZv
cj8KPj4+PiBJbnZhbGlkYXRlIG11c3Qgc3RvcCBETUEgYmVmb3JlIHJldHVybmluZywgc28gcHJl
c3VtYWJseSBkcml2ZXJzIHVzaW5nCj4+Pj4gYSBkbWEgZmVuY2UgYXJlIHJlbHlpbmcgb24gYSBk
bWEgZmVuY2UgbWVjaGFuaXNtIHRvIHN0b3AgRE1BLgo+Pj4KPj4+IFllcywgc28gZmFyIEkgZm9s
bG93LCBidXQgd2hhdCdzIHRoZSByZWFzb24gZHJpdmVycyBuZWVkIHRvIHN0b3AgRE1BPwo+Pgo+
PiBXZWxsIGluIGdlbmVyYWwgYW4gaW52YWxpZGF0aW9uIG1lYW5zIHRoYXQgdGhlIHNwZWNpZmll
ZCBwYXJ0IG9mIHRoZSAKPj4gcGFnZSB0YWJsZXMgYXJlIHVwZGF0ZWQsIGVpdGhlciB3aXRoIG5l
dyBhZGRyZXNzZXMgb3IgbmV3IGFjY2VzcyBmbGFncy4KPj4KPj4gSW4gYm90aCBjYXNlcyB5b3Ug
bmVlZCB0byBzdG9wIHRoZSBETUEgYmVjYXVzZSB5b3UgY291bGQgb3RoZXJ3aXNlIAo+PiB3b3Jr
IHdpdGggc3RhbGUgZGF0YSwgZS5nLiByZWFkL3dyaXRlIHdpdGggdGhlIHdyb25nIGFkZHJlc3Nl
cyBvciAKPj4gd3JpdGUgdG8gYSByZWFkIG9ubHkgcmVnaW9uIGV0Yy4uLgo+Cj4gWWVzLiBUaGF0
J3MgY2xlYXIuIEknbSBqdXN0IHRyeWluZyB0byB1bmRlcnN0YW5kIHRoZSBjb21wbGV0ZSAKPiBp
bXBsaWNhdGlvbnMgb2YgZG9pbmcgdGhhdC4KPgo+Pgo+Pj4gSXMgaXQgZm9yIGludmxpZGF0aW9u
IGJlZm9yZSBicmVha2luZyBDT1cgYWZ0ZXIgZm9yayBvciBzb21ldGhpbmcgCj4+PiByZWxhdGVk
Pwo+Pgo+PiBUaGlzIGlzIGp1c3Qgb25lIG9mIG1hbnkgdXNlIGNhc2VzIHdoaWNoIGNvdWxkIGlu
dmFsaWRhdGUgYSByYW5nZS4gCj4+IEJ1dCB0aGVyZSBhcmUgbWFueSBtb3JlLCBib3RoIGZyb20g
dGhlIGtlcm5lbCBhcyB3ZWxsIGFzIHVzZXJzcGFjZS4KPj4KPj4gSnVzdCBpbWFnaW5nIHRoYXQg
dXNlcnNwYWNlIGZpcnN0IG1tYXBzKCkgc29tZSBhbm9ueW1vdXMgbWVtb3J5IHIvdywgCj4+IHN0
YXJ0cyBhIERNQSB0byBpdCBhbmQgd2hpbGUgdGhlIERNQSBpcyBvbmdvaW5nIGRvZXMgYSByZWFk
b25seSAKPj4gbW1hcCgpIG9mIGxpYmMgdG8gdGhlIHNhbWUgbG9jYXRpb24uCj4KPiBNeSB1bmRl
cnN0YW5kaW5nIG9mIHRoaXMgcGFydGljdWxhciBjYXNlIGlzIHRoYXQgaGFyZHdhcmUgd291bGQg
Cj4gY29udGludWUgdG8gRE1BIHRvIG9ycGhhbmVkIHBhZ2VzIHRoYXQgYXJlIHBpbm5lZCB1bnRp
bCB0aGUgZHJpdmVyIGlzIAo+IGRvbmUgd2l0aCBETUEsIHVubGVzcyBoYXJkd2FyZSB3b3VsZCBz
b21laG93IGluLWZsaWdodCBwaWNrIHVwIHRoZSBuZXcgCj4gUFRFIGFkZHJlc3NlcyBwb2ludGlu
ZyB0byBsaWJjIGJ1dCBub3QgdGhlIHByb3RlY3Rpb24/CgpFeGFjdGx5IHRoYXQgaXMgbm90IGd1
YXJhbnRlZWQgdW5kZXIgYWxsIGNpcmN1bXN0YW5jZXMuIEVzcGVjaWFsbHkgc2luY2UgCkhNTSB0
cmllcyB0byBhdm9pZCBncmFiYmluZyBhIHJlZmVyZW5jZSB0byB0aGUgdW5kZXJseWluZyBwYWdl
cy4gQW5kIGl0IApkZXBlbmRzIHdoZW4gdGhlIGRlc3RpbmF0aW9uIGFkZHJlc3NlcyBvZiB0aGUg
RE1BIGFyZSByZWFkIGFuZCB3aGVuIHRoZSAKYWNjZXNzIGZsYWdzIGFyZSBldmFsdWF0ZWQuCgpC
dXQgZXZlbiB3aGVuIGl0IGNhdXNlcyBubyBzZWN1cml0eSBwcm9ibGVtIHRoZSByZXF1aXJlbWVu
dCB3ZSBoYXZlIHRvIApmdWxmaWxsIGhlcmUgaXMgdGhhdCB0aGUgRE1BIGlzIGNvaGVyZW50LiBJ
biBvdGhlciB3b3JkcyB3ZSBlaXRoZXIgaGF2ZSAKdG8gZGVsYXkgdXBkYXRlcyB0byB0aGUgcGFn
ZSB0YWJsZXMgdW50aWwgdGhlIERNQSBvcGVyYXRpb24gaXMgY29tcGxldGVkIApvciBhcHBseSBi
b3RoIGFkZHJlc3MgYW5kIGFjY2VzcyBmbGFnIGNoYW5nZXMgaW4gYSB3YXkgdGhlIERNQSBvcGVy
YXRpb24gCmltbWVkaWF0ZWx5IHNlZXMgaXQgYXMgd2VsbC4KClJlZ2FyZHMsCkNocmlzdGlhbi4K
Cj4KPiBUaGFua3MsCj4KPiBUaG9tYXMKPgo+Cj4+Cj4+IFNpbmNlIG1vc3QgaGFyZHdhcmUgZG9l
c24ndCBoYXZlIHJlY292ZXJhYmxlIHBhZ2UgZmF1bHRzIGd1ZXNzIHdoYXQgCj4+IHdvdWxkIGhh
cHBlbiBpZiB3ZSBkb24ndCB3YWl0IGZvciB0aGUgRE1BIHRvIGZpbmlzaD8gVGhhdCB3b3VsZCBi
ZSBhIAo+PiBzZWN1cml0eSBob2xlIHlvdSBjYW4gcHVzaCBhbiBlbGVwaGFudCB0aHJvdWdoIDop
Cj4+Cj4+IENoZWVycywKPj4gQ2hyaXN0aWFuLgo+Pgo+Pj4KPj4+IFRoYW5rcywKPj4+Cj4+PiBU
aG9tYXMKPj4+Cj4+Pj4KPj4+PiBKYXNvbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
