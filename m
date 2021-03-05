Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 769A732DF06
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 02:22:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81E5E6E155;
	Fri,  5 Mar 2021 01:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B79EA6E155;
 Fri,  5 Mar 2021 01:21:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KbHm9CfFr3d0vLFGSKOtF0lMmKrjjR4YDQscjNvHvHJMuaQ5HsN4YV59KeaTRK+/+6FfJT82/dCSMbMsvLIYIsvfSKjgZ7ebrsXxlUUzg0Dfa+5zDKtaU2/irZ/0aCwsGVKd44lbJjCIACFrHmMCRFaV8iQcsPqdRg2fWI8GPvxgFGNB5KB1uuHBO4owAQlhCKsXbfhNWiFmQmFSeJwE1uIF53y2AZ1dIbXEPdnZ76k6Xz47F5tXOLH4xsdu75B7r+vBzeljOwlwyBWCDZuWGaZ0vTi/cRkkbxhcWr2WF2cG8Nfo20xVOIomqAdvvnVsoaN0Ga2bGq3oxdbQYhn3ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7JBk0Dnk0HcR8woaCtwrDOkucKgQdaEQ/bOM7JH+4I=;
 b=ELPpIgbCrselu+msqyHa9/5XlmRPOMc4sVFub9BhxiY/IG+0KdMmBhn5Uol8u2OaRPnPu6novlydBv3JLB1/TLN4s3m4B2qbcTr8TrRvssWB6wvN0eLdT7XSbTUBxMN+xehki2MYsRxjyIgUrMBVChytlMojta3BSdH+2L+xbRzvQCgCBkqkCO1FYxEFMv1E6J0UhiY5GO2doAMxQTS6EmX74BU5l+WBOq3OTZMLYV7k695CvI9KuCje7A0FWwFqYyhsXJOvGc0LCErFZqtWIUbPCdtnuAEbmHK4mx2/txJp3jjGXO2lfVcSmO/+lkhl4FxjwI4B/4z+21IH/83ZcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i7JBk0Dnk0HcR8woaCtwrDOkucKgQdaEQ/bOM7JH+4I=;
 b=lWo1FhYJpLOZKjQdGlh+LKkvQgqo8eUAWpOpesGrImrSjBP+RXYk7b8jbZjEvNb/86uBx4AioURnJFtDxLghbpXFmUfjcWjrBHuuU42K52l0Joqfvcy3CtMKLfbMXrA1v/TAzaGUTKAyyAnFt2zIB+9fqZQQhrXVvPQHixVLpNs=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from BL0PR12MB4948.namprd12.prod.outlook.com (2603:10b6:208:1cc::20)
 by MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.20; Fri, 5 Mar
 2021 01:21:54 +0000
Received: from BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab]) by BL0PR12MB4948.namprd12.prod.outlook.com
 ([fe80::ec8d:851e:525d:a6ab%9]) with mapi id 15.20.3784.030; Fri, 5 Mar 2021
 01:21:54 +0000
Subject: Re: [PATCH 1/1] drm/ttm: Ignore signaled move fences
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20210227034524.21763-1-Felix.Kuehling@amd.com>
 <c66e10a6-b5e1-b096-3c59-c107e1e12312@gmail.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <482d3b8f-27dc-6815-b6f6-4987fe5ed21c@amd.com>
Date: Thu, 4 Mar 2021 20:21:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <c66e10a6-b5e1-b096-3c59-c107e1e12312@gmail.com>
Content-Language: en-US
X-Originating-IP: [142.117.121.176]
X-ClientProxiedBy: YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2d::12) To BL0PR12MB4948.namprd12.prod.outlook.com
 (2603:10b6:208:1cc::20)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.2.100] (142.117.121.176) by
 YT1PR01CA0073.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2d::12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.23 via Frontend Transport; Fri, 5 Mar 2021 01:21:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 94d0554e-9d33-4cb0-baf3-08d8df751000
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:
X-Microsoft-Antispam-PRVS: <MN2PR12MB399722568743E2AA9784C4B392969@MN2PR12MB3997.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2043;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tN0/UWxvNJ3qHdqcG9o0pJvHmJPucEJVtcEJE/Z5zk3XZ4m5os8KtIZj9oRU6Y0BC/oGsWw3SQiJIqEbkI5PPOYZgWawwpK/gy86yVRTfdVIo038y4BOjLhUyUXq4dLp8GGRLTwIAZ3WhnsvyO4t6DhQm/uUxjkN2eA3wVpdNKb5wBY81YCqTAi5TaxI2HO2SXnp6FFI6uwvFOreD3atT3SxZMcgW6zHpQtFeXOx8JG7f2SmQPh1uIG5m/UjUwejGKng40lsiP9hjnwQ/QFtQq6bzdnuLVKMIoaruCwwfbhpGBRxuXA5QziBv0iN6+UDZGQ7boFHvnuzhEdcPFt5XGTwDY2/V7wQdIFpwEkUEqzj7bprwGx+enuLofsXOlqO2jbHIoe+5MReVbgJHyN0QXgBg9G/8zwZG35/Q8elOg/FmTDtShqdxgbJAeY0f7UXgtWpCi30dcy+/B0jPv25QWkV/4sKd6111wN+AUR5/CYIPbWchf4+xOg693aisfYlde4LLwKaX3JgX7Nn8dE8OqDiDtTdHuuBHgN39vJ4hWOl8QBGa1E9yNMGdRVSGn6XKvKGWAhDU2UucdorGUlK8nUr11Nw6U32Ilu5AtaoA0A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB4948.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(396003)(376002)(39860400002)(136003)(346002)(44832011)(2616005)(66556008)(956004)(83380400001)(478600001)(2906002)(66946007)(8676002)(26005)(66476007)(52116002)(66574015)(16576012)(16526019)(6486002)(8936002)(5660300002)(316002)(31696002)(31686004)(186003)(86362001)(36756003)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?SWpkVGJtVUQxWjVubnA3T0NrbGs3SHdycFR1dUE4OFVXNTNyMk03dys0M2lB?=
 =?utf-8?B?RkgwbmVPSU91czRMZmJVQjRIYS90eVVsdG51aHpXOTdVM2YrUE8vay9tQU9z?=
 =?utf-8?B?TC9BYnRnVS9oRVBmUFNzNnV2QWVnakJ3TitjVE9ENXZRTHNQVkRCNVpDR2sw?=
 =?utf-8?B?Y25kYlByUFBma2greVNlbXA4RGVuc1NaQUlYTHNuc0Q0UERVdTNwRVV6aTd0?=
 =?utf-8?B?WUh1dzNGRFBvMjBwUmJOcFdPN2V3aTNtZ0VsV0h6cTlRMTdMRFlUK1VJSzB6?=
 =?utf-8?B?ZXZpYXR5SEgvNU5HL3ZtODhwS3hqaWQ0SVR1aTVIQTlxUVJSbWJqNTExb0NU?=
 =?utf-8?B?UTNubUNFcmpWL2xiQW42WjVSaWM5SnY5SlVocGtpRVB3VXZpTitMOFBmUmhn?=
 =?utf-8?B?YWN3SU0rTFVwdTRkcnFLZmZ4djN2OTRGY1VMckx1dHI0U0h2RC9QUXROTXJN?=
 =?utf-8?B?OGFMZUZYL3dSR01PMU5vTTNOSkpNeVZNMDdsR3o0MkloaWZGOW1QVDhaVVRU?=
 =?utf-8?B?UWUzbHpLVkxEVm1IeThzSlpzaWJXOHJuejdqV3ZOOW1NVTBqMk5xNk5ycVRL?=
 =?utf-8?B?b0dJa2xxaitCL2ZMY0Zib3JVQ3Fpa3JWSzNFNzRzRWVUMXc0SlpRbEhFd0Qy?=
 =?utf-8?B?REMxOEZwVnRmazZFMjBIeEx6QVo1dUdIYm1XNks2Z29SRmM2Zno4UXgxb0NT?=
 =?utf-8?B?RUxlMXdDMHgzVEJvOHNZZk1TamIrMmx2SnlaQlNFRFU0T0VUcTl4TXpWUklh?=
 =?utf-8?B?clZlMGozQm9pbm83a0tSeE8wcGpYajNEQXJkbDJqeisxbU9MMTRyWHFsSEpl?=
 =?utf-8?B?d0lsRWxLZ1BnckF0M0dCbDlnOU9MZEl4Vy96K3JJaHp4Y1hYeTRreE5oSm1E?=
 =?utf-8?B?VWJOKzVHTXRUaUdDN2w3N3FpYjAwWC9nQnBHNVlWeVErcGZlUUNLY2RJa0xt?=
 =?utf-8?B?ekFoUndFWnp0UzdjSktSVm1FS0lTWmxHNXJ2NUMwcU5hUGErYThLNDFpRWNm?=
 =?utf-8?B?MGdqRDlnekhVU2piTDcwcFdLVHlIcXRjYU9mdDhhaUJwZTF6aW1IRFBEUVBu?=
 =?utf-8?B?Nm9RN1YwVmlJQTl6NE1uSExYdmhIN0hpTWY1cHNDSkxLQ0hYRkswOU0yR3dU?=
 =?utf-8?B?WkNIbVZvMHZCRUxxS1QvSjJ4cldCYzZpNy9LVkJZYlV6Z1VuUlFlVk4rRUtX?=
 =?utf-8?B?ZytqaUt3aUQ2RzQ3NUxoTDQ2dmNYZFpabXR4ODR2d2ozNEVFcGsvMzUxWkto?=
 =?utf-8?B?ajA1aHdWc2FiNmlzdUpiTmdwYkUyNVg3d0RmSFRHeUN3OFRZVUVhQXRwUzQ5?=
 =?utf-8?B?QzBGeXdFZVJOMURiV2hDTjBRR1BZME9BV3V4bUVneGV5b3JKTDFrYzQ0NnJZ?=
 =?utf-8?B?ZHhwaERtTlRFRmIyUVVjWkowcWNQUENrbDd4MTF0S1lwc2lVaWJYeHRseW41?=
 =?utf-8?B?NkIyaFVUeGlibzlqVTJEeG1PcEpycmxCb1JMWWR6Nk0vVGR3bVowRDJmd3lw?=
 =?utf-8?B?b3BBR1Z0SkM4U016ZjNvb0pVc1UxVFlHTEpFSzRpV2p0ZkxweFBUeTM0Z1R0?=
 =?utf-8?B?RDBIejB5dlF1cW9nMXRrT2ExNXdiMzhXNWgvUU83dkVSTzg4dXBJcWdKN0ky?=
 =?utf-8?B?Qkl1R1Bsc3lCU3VYMm5BMHA4R3MyZE1yVFQ0cnhhNzR1NTAzeDRkSCt6eThy?=
 =?utf-8?B?RGdkQnphemQ2RkJlbUdPNXk5S29CNTFDelRiMGdnUnhUUzVLTm5tNVhMRXFs?=
 =?utf-8?B?Q2JNVnppL3E5K0hlZWxVY0RtS1ZiWTJPN2xXMEJPdUdtOTlvdksvekU5Q3Bk?=
 =?utf-8?B?cDRrMVcxSTBQRzlLZlQwdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d0554e-9d33-4cb0-baf3-08d8df751000
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB4948.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2021 01:21:54.7049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WwWLTFPy7IS47AtPs6nUrkNjScoBn4RuNWrGEidHH3Eh48YhnNrNowcjBx+y7z+FI5W/vXDT5jbAhuLUvqKhOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3997
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

CkFtIDIwMjEtMDMtMDEgdW0gMTA6MDkgYS5tLiBzY2hyaWViIENocmlzdGlhbiBLw7ZuaWc6Cj4g
QW0gMjcuMDIuMjEgdW0gMDQ6NDUgc2NocmllYiBGZWxpeCBLdWVobGluZzoKPj4gTW92ZSBmZW5j
ZXMgdGhhdCBoYXZlIGFscmVhZHkgc2lnbmFsZWQgc2hvdWxkIG5vdCBwcmV2ZW50IG1lbW9yeQo+
PiBhbGxvY2F0aW9ucyB3aXRoIG5vX3dhaXRfZ3B1Lgo+Pgo+PiBTaWduZWQtb2ZmLWJ5OiBGZWxp
eCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KPgo+IFJldmlld2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+CgpJIHdvcmsgb24gdGhpcyBv
biBBbGV4J3MgcmViYXNlZCBhbWQtc3RhZ2luZy1kcm0tbmV4dC4gU2hvdWxkIHRoaXMgZ28KaW50
byBhbnkgb3RoZXIgYnJhbmNoZXM/CgpUaGFua3MsCsKgIEZlbGl4CgoKPgo+PiAtLS0KPj4gwqAg
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm8uYyB8IDMgKystCj4+IMKgIDEgZmlsZSBjaGFuZ2Vk
LCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+
IGluZGV4IDNhMTBiZWJiNzVkNi4uZGUxZWM4MzhjZjhiIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9iby5jCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX2Jv
LmMKPj4gQEAgLTczMCw4ICs3MzAsOSBAQCBzdGF0aWMgaW50IHR0bV9ib19hZGRfbW92ZV9mZW5j
ZShzdHJ1Y3QKPj4gdHRtX2J1ZmZlcl9vYmplY3QgKmJvLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqAg
cmV0dXJuIDA7Cj4+IMKgIMKgwqDCoMKgwqAgaWYgKG5vX3dhaXRfZ3B1KSB7Cj4+ICvCoMKgwqDC
oMKgwqDCoCByZXQgPSBkbWFfZmVuY2VfaXNfc2lnbmFsZWQoZmVuY2UpID8gMCA6IC1FQlVTWTsK
Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGRtYV9mZW5jZV9wdXQoZmVuY2UpOwo+PiAtwqDCoMKgwqDC
oMKgwqAgcmV0dXJuIC1FQlVTWTsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7Cj4+IMKg
wqDCoMKgwqAgfQo+PiDCoCDCoMKgwqDCoMKgIGRtYV9yZXN2X2FkZF9zaGFyZWRfZmVuY2UoYm8t
PmJhc2UucmVzdiwgZmVuY2UpOwo+Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2RyaS1kZXZlbAo=
