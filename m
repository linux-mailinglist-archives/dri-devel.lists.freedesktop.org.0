Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47C342DC3E1
	for <lists+dri-devel@lfdr.de>; Wed, 16 Dec 2020 17:18:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E68746E1A7;
	Wed, 16 Dec 2020 16:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760081.outbound.protection.outlook.com [40.107.76.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE9AF6E1A7;
 Wed, 16 Dec 2020 16:18:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N7/fQ1g1mCopN6OewcESVGbWHkAF/UqANYUGUoCgBBZ020H4UY/+DxkCuW7G46+wQxl627gfTPqMmSwbFWQX2XK5QZT6gAr+sLe+hA5WKYogVXV6FQNn++cQNKrJXQKNVVaf90NPCVip1Kk1gY9ajTtsUmVxir1oMSWPaA5RLaCKma3MINn0NHTHVDwV+jRXQVcLA6Mm1lEo/mWO0zMEozUj1rylDlPfYR889gYdyO23Ax/rFY1Qrl7bS5AIVw8OmZilnGTJT6KpFfY0b7owV3PMHQW97vGgu52kOPrCG3m2zrZjeTjMw0eei7NPyp92ZfPCFin/6Hiv6c4hdJ4kJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdxdtU5cwSslsqrGSZkOe1lCvDk87CtImqIRtowznwo=;
 b=edJDaKtW8Q4zxZXdLSYlV9x1rPC0Aa1rkx/KIECdXgH+WjQPYgvEtp7IxCR9G33ypbQzHU2kKSKHkC3XdxwKvJ2EONNlENg4Yw5xoZ+DgTLJ4heudAvrL+Ijm0H2T1wrKFDeHjE3QRR4rlRx6p8WBINJ8SLW2ybBOXT7bHQmtzR66N807FWSyi/zcsLsdCoLS+GQlaYqdtGjBtIkTnii5WWwRjdcFBFNs22FTEjIdJHpJQLLhnqk8MPWVPyubNBUTpP5DzJwxEs9Rw/d5cJYvQ4z+hrNzDQZ7FJ3IdlSTrbOlkeL9ewtPlR6vRcYShwfabexhJRTsm6iyMHRI7vm+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdxdtU5cwSslsqrGSZkOe1lCvDk87CtImqIRtowznwo=;
 b=z1hn7cgjWjjBJFDWr/3EHj+v10kF7GWA4D8rb/rCvHWpcmyyXRqZMbU1yBy+2TQPMbbGN34fNDzFC2dI9Ul9dGGX9etPCBV6Q1J7Z5iWhR+E1/0uDZv0yZKIhq38aDsJtxmC5pC7acq0lWOLw6U8qL538XZmrc26XLmB0+NOV78=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4470.namprd12.prod.outlook.com (2603:10b6:208:260::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.20; Wed, 16 Dec
 2020 16:18:41 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3654.025; Wed, 16 Dec 2020
 16:18:40 +0000
Subject: Re: [PATCH v3 05/12] drm/ttm: Expose ttm_tt_unpopulate for driver use
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-6-git-send-email-andrey.grodzovsky@amd.com>
 <28332cf0-612c-10bd-c64e-fff6e1f18653@gmail.com>
 <320ff94c-78f4-b9a5-4c6f-40f7ce162bd3@amd.com>
 <41b35672-2dd6-13e2-8383-c65279fdb648@gmail.com>
 <e2f4f1dc-2a2a-face-87b2-6d61ed7d3305@amd.com>
 <01280cba-56b8-77c6-b40f-d7e69a5ad4c6@amd.com>
 <0ceca974-80f8-feb3-d5e9-5182f35bb2c4@amd.com>
 <20288c45-270c-3ed7-2ac4-eeb6e5c50776@amd.com>
 <2df98c1a-8ed4-fb87-f8f7-e3962e8d9c52@amd.com>
 <041210e5-e237-b72e-dcbc-17027d057c55@gmail.com>
 <1fa4dd77-deec-aa7b-7499-0537e9a01919@amd.com>
 <a818be68-518c-754d-f63b-3754ce882fdc@gmail.com>
 <CAKMK7uEx631E1NB1=NYh7V2_+X=pK0WhA_sBwpxCGOhFaYw9wQ@mail.gmail.com>
 <e389b7d7-196c-ee03-ff94-ffd110c1013f@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <77cdb5bf-a418-bafd-2360-163e428c7394@amd.com>
Date: Wed, 16 Dec 2020 17:18:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <e389b7d7-196c-ee03-ff94-ffd110c1013f@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0093.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::46) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0093.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::46) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3654.12 via Frontend Transport; Wed, 16 Dec 2020 16:18:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 6aa3a3b6-72b3-4716-617f-08d8a1de4067
X-MS-TrafficTypeDiagnostic: MN2PR12MB4470:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB4470EB0132AB41E11E2A408A83C50@MN2PR12MB4470.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K60AnU4gPXDPU9ikb5cZZWFJPJnei8F+sDKhy9M1sSoRzxeSz6N+z8x+zSj4ydGkPTFQ0cVtVLshLzN1NVV3bqKNUN2vfjn2qlny0NumL521cwy44T6LKAEP/4fBrLRIDEnfhq2Y/cP3U8u8HgFAs8q9bmw99OJ4mRAT2CBYeC+Hp58blmW0Y8ho/4Ci83poYFid4DVdJ2R7SLPWo3eMp3sfZppUhG5vSBFhCwvKbpcnSmOvQr6EmyFQHhb2qAGWEew9+Hvs3f+RikR3pofybRtjCEeIEDw6aSwQJpcnwi+67B0U+iJy+8kAEjWKIbrIJyBYcMTDwyE+ytkPSdRutqg9M3kY552Ixex6YCoSaAVMedyE/v5GUIMADDbSPUXzMpYSqBhDkTddFsa10z9OjZjEwVF6cr5n+JJbQjBYGWD8z7Tbo0nEKqX2SCmwNVNyUPqQqcnqt1GwL4z4RS6E3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(39860400002)(366004)(396003)(136003)(66574015)(966005)(5660300002)(110136005)(52116002)(86362001)(8936002)(2906002)(45080400002)(83380400001)(6666004)(8676002)(16526019)(478600001)(36756003)(186003)(316002)(31686004)(6486002)(31696002)(4326008)(2616005)(54906003)(66946007)(66476007)(53546011)(66556008)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?OXljNVFiTkRWL1JsR3pPM1JUNFVtWmFzbTd3WWk5blZrd2lqcWhncHRKT0pO?=
 =?utf-8?B?VFUvMk83SEViL1lXdU5XdHhkUjFmd0U1MjRMVVJRckk5M2xJclhwaWRjUk9z?=
 =?utf-8?B?dTRUcDROMEIrTTJIY2dwbDJSekxxaElCR1dpZlFGQ04vazVvOUtTQVRGelds?=
 =?utf-8?B?OWcwZ1RHK3pFRElOM0I5NWRpVU5QTTRLREIxZU9OcVp3VkhjMW1hay9KWnpB?=
 =?utf-8?B?ay9xY3l5S2ttYVJEU29PZDIwbkhvNWVOVElON2lBM1R2U2tOZ1FLeWw3Zlhz?=
 =?utf-8?B?cG9HU0hkWVRlRWdmTFUvbzYrUTBNZysvNlNkZFB4YjFuV2gvbWtRZVNPenhJ?=
 =?utf-8?B?TElRaVU4WUFHUXY5V2Z4NisrZU0waHl4NlRoZnl3SHRhMEhoYlo3QXJoUkxI?=
 =?utf-8?B?YW9QMndJVEdybEwwWUhab2tISVozTDhZWWVKZmxHQ1JyMDFYZ3A4RVBFcnUw?=
 =?utf-8?B?UU9OMEhsbUlNS2tkMVJGdXlXdW82SXBsMjcrS1p5ZDdwOFdvNHdlSDcydzQ0?=
 =?utf-8?B?b1dFSW1uWWdJRVBvVEIxOGhYZGxScTQ5RTVHS1NsRi8vSWp0TU1WcHh3MTZF?=
 =?utf-8?B?NzRFblVrdWJ0OUtQNytyelF4aGszUi9wUjAvNzZ5S2ltMFRBKzhuL3ExaWYx?=
 =?utf-8?B?VzJ6VHdBY1NTS09RenBsYS9GakFiUWVEaU95TklyNzY5OEJsMzZDbmVjMTFI?=
 =?utf-8?B?bmc3bVl6Ym13amt0NTFwSld3Q1JMOHJHQ0NHc3dXZ2xJUFJNN1VPVGdWdXhZ?=
 =?utf-8?B?WjJINTRmMjJMTCtGUHUvWlYrR2x4OFc2NGdlRnVOSDRETkpLS256Mi9OR2xP?=
 =?utf-8?B?UGQyK3BDRkQ1cnVVTTRhK0R4amEra1AzcXVSRGtJNkdxd0tMM0VKWmpVc2gr?=
 =?utf-8?B?WXlzYk9iWTVIV0JVTHQzdWF6M0x1cmdtWUhoazh0SkFCOWV1ZTR0VWNZOURV?=
 =?utf-8?B?eHZ6YnpWVGc0cDVHZXcwSklxd3ZZZk9MQXNrUVJPeVJkMDhFY2drRFdWWDRX?=
 =?utf-8?B?Sk5ha3pabVh3dHFWblRISE5xcGwwTlFZLzJjaHo3L0hZcTFHdFZTYnp4ZVVk?=
 =?utf-8?B?RWRCZ0FUN0M4Y3RzT3FNYVk5WXJDSi9FRE1kVWNVR2ZVN2lTQnFVeC9SM0VY?=
 =?utf-8?B?a2NXMUEza0FXdmUvRnJwS2xSN2F1R3hUS1YwVWVNRWgyNkF1QzFlMHpnWEhk?=
 =?utf-8?B?d1JqUDNuMnZHOWpPUXdlbHZZREkzUzh2eENvbFJQbGhySlFmV09hRkRTZVBz?=
 =?utf-8?B?R3BUQlRneTYwZnVEd0lXVDZWanV1dlNTQVEvby9JdWZnZFFQY3prRFlIa3V2?=
 =?utf-8?B?cG9aVHlpMUx4ZzBVVWlVOEYzZ1R2aUJYcGMrbEhuNG5IL3QzUE82K0FFQXhC?=
 =?utf-8?B?bzNyQ2EycEd2UFEyNmVUTUxQREVSNDREVE9xc1lIcTZZSzg4bExlU2V6UFB0?=
 =?utf-8?Q?yBCzsNlS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2020 16:18:40.6894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 6aa3a3b6-72b3-4716-617f-08d8a1de4067
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1nKT8FchakiR2RmVm8XT/h+ezOqhZ//aAOO1ba9QWAHixrMkJQFE7/uK8vqmdki2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4470
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
Cc: amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Greg KH <gregkh@linuxfoundation.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Qiang Yu <yuq825@gmail.com>,
 Alex Deucher <Alexander.Deucher@amd.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTYuMTIuMjAgdW0gMTc6MTMgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPgo+IE9uIDEy
LzE2LzIwIDk6MjEgQU0sIERhbmllbCBWZXR0ZXIgd3JvdGU6Cj4+IE9uIFdlZCwgRGVjIDE2LCAy
MDIwIGF0IDk6MDQgQU0gQ2hyaXN0aWFuIEvDtm5pZwo+PiA8Y2tvZW5pZy5sZWljaHR6dW1lcmtl
bkBnbWFpbC5jb20+IHdyb3RlOgo+Pj4gQW0gMTUuMTIuMjAgdW0gMjE6MTggc2NocmllYiBBbmRy
ZXkgR3JvZHpvdnNreToKPj4+PiBbU05JUF0KPj4+Pj4+IFdoaWxlIHdlIGNhbid0IGNvbnRyb2wg
dXNlciBhcHBsaWNhdGlvbiBhY2Nlc3NlcyB0byB0aGUgbWFwcGVkCj4+Pj4+PiBidWZmZXJzIGV4
cGxpY2l0bHkgYW5kIGhlbmNlIHdlIHVzZSBwYWdlIGZhdWx0IHJlcm91dGluZwo+Pj4+Pj4gSSBh
bSB0aGlua2luZyB0aGF0IGluIHRoaXPCoCBjYXNlIHdlIG1heSBiZSBhYmxlIHRvIHNwcmlua2xl
Cj4+Pj4+PiBkcm1fZGV2X2VudGVyL2V4aXQgaW4gYW55IHN1Y2ggc2Vuc2l0aXZlIHBsYWNlIHdl
cmUgd2UgbWlnaHQKPj4+Pj4+IENQVSBhY2Nlc3MgYSBETUEgYnVmZmVyIGZyb20gdGhlIGtlcm5l
bCA/Cj4+Pj4+IFllcywgSSBmZWFyIHdlIGFyZSBnb2luZyB0byBuZWVkIHRoYXQuCj4+Pj4+Cj4+
Pj4+PiBUaGluZ3MgbGlrZSBDUFUgcGFnZSB0YWJsZSB1cGRhdGVzLCByaW5nIGJ1ZmZlciBhY2Nl
c3NlcyBhbmQgRlcKPj4+Pj4+IG1lbWNweSA/IElzIHRoZXJlIG90aGVyIHBsYWNlcyA/Cj4+Pj4+
IFB1aCwgZ29vZCBxdWVzdGlvbi4gSSBoYXZlIG5vIGlkZWEuCj4+Pj4+Cj4+Pj4+PiBBbm90aGVy
IHBvaW50IGlzIHRoYXQgYXQgdGhpcyBwb2ludCB0aGUgZHJpdmVyIHNob3VsZG4ndCBhY2Nlc3Mg
YW55Cj4+Pj4+PiBzdWNoIGJ1ZmZlcnMgYXMgd2UgYXJlIGF0IHRoZSBwcm9jZXNzIGZpbmlzaGlu
ZyB0aGUgZGV2aWNlLgo+Pj4+Pj4gQUZBSUsgdGhlcmUgaXMgbm8gcGFnZSBmYXVsdCBtZWNoYW5p
c20gZm9yIGtlcm5lbCBtYXBwaW5ncyBzbyBJCj4+Pj4+PiBkb24ndCB0aGluayB0aGVyZSBpcyBh
bnl0aGluZyBlbHNlIHRvIGRvID8KPj4+Pj4gV2VsbCB0aGVyZSBpcyBhIHBhZ2UgZmF1bHQgaGFu
ZGxlciBmb3Iga2VybmVsIG1hcHBpbmdzLCBidXQgdGhhdCBvbmUKPj4+Pj4ganVzdCBwcmludHMg
dGhlIHN0YWNrIHRyYWNlIGludG8gdGhlIHN5c3RlbSBsb2cgYW5kIGNhbGxzIEJVRygpOyA6KQo+
Pj4+Pgo+Pj4+PiBMb25nIHN0b3J5IHNob3J0IHdlIG5lZWQgdG8gYXZvaWQgYW55IGFjY2VzcyB0
byByZWxlYXNlZCBwYWdlcyBhZnRlcgo+Pj4+PiB1bnBsdWcuIE5vIG1hdHRlciBpZiBpdCdzIGZy
b20gdGhlIGtlcm5lbCBvciB1c2Vyc3BhY2UuCj4+Pj4KPj4+PiBJIHdhcyBqdXN0IGFib3V0IHRv
IHN0YXJ0IGd1YXJkaW5nIHdpdGggZHJtX2Rldl9lbnRlci9leGl0IENQVQo+Pj4+IGFjY2Vzc2Vz
IGZyb20ga2VybmVsIHRvIEdUVCBvdCBWUkFNIGJ1ZmZlcnMgYnV0IHRoZW4gaSBsb29rZWQgbW9y
ZSBpbgo+Pj4+IHRoZSBjb2RlCj4+Pj4gYW5kIHNlZW1zIGxpa2UgdHRtX3R0X3VucG9wdWxhdGUg
anVzdCBkZWxldGVzIERNQSBtYXBwaW5ncyAoZm9yIHRoZQo+Pj4+IHNha2Ugb2YgZGV2aWNlIHRv
IG1haW4gbWVtb3J5IGFjY2VzcykuIEtlcm5lbCBwYWdlIHRhYmxlIGlzIG5vdCAKPj4+PiB0b3Vj
aGVkCj4+Pj4gdW50aWwgbGFzdCBibyByZWZjb3VudCBpcyBkcm9wcGVkIGFuZCB0aGUgYm8gaXMg
cmVsZWFzZWQKPj4+PiAodHRtX2JvX3JlbGVhc2UtPmRlc3Ryb3ktPmFtZGdwdV9ib19kZXN0cm95
LT5hbWRncHVfYm9fa3VubWFwKS4gVGhpcwo+Pj4+IGlzIGJvdGgKPj4+PiBmb3IgR1RUIEJPcyBt
YXBlZCB0byBrZXJuZWwgYnkga21hcCAob3Igdm1hcCkgYW5kIGZvciBWUkFNIEJPcyBtYXBwZWQK
Pj4+PiBieSBpb3JlbWFwLiBTbyBhcyBpIHNlZSBpdCwgbm90aGluZyB3aWxsIGJhZCB3aWxsIGhh
cHBlbiBhZnRlciB3ZQo+Pj4+IHVucG9wdWxhdGUgYSBCTyB3aGlsZSB3ZSBzdGlsbCB0cnkgdG8g
dXNlIGEga2VybmVsIG1hcHBpbmcgZm9yIGl0LAo+Pj4+IHN5c3RlbSBtZW1vcnkgcGFnZXMgYmFj
a2luZyBHVFQgQk9zIGFyZSBzdGlsbCBtYXBwZWQgYW5kIG5vdCBmcmVlZCBhbmQKPj4+PiBmb3IK
Pj4+PiBWUkFNIEJPcyBzYW1lIGlzIGZvciB0aGUgSU8gcGh5c2ljYWwgcmFuZ2VzIG1hcHBlZCBp
bnRvIHRoZSBrZXJuZWwKPj4+PiBwYWdlIHRhYmxlIHNpbmNlIGlvdW5tYXAgd2Fzbid0IGNhbGxl
ZCB5ZXQuCj4+PiBUaGUgcHJvYmxlbSBpcyB0aGUgc3lzdGVtIHBhZ2VzIHdvdWxkIGJlIGZyZWVk
IGFuZCBpZiB3ZSBrZXJuZWwgZHJpdmVyCj4+PiBzdGlsbCBoYXBwaWx5IHdyaXRlIHRvIHRoZW0g
d2UgYXJlIHByZXR0eSBtdWNoIGJ1c3RlZCBiZWNhdXNlIHdlIHdyaXRlCj4+PiB0byBmcmVlZCB1
cCBtZW1vcnkuCj4KPgo+IE9LLCBpIHNlZSBpIG1pc3NlZCB0dG1fdHRfdW5wb3B1bGF0ZS0+Li4t
PnR0bV9wb29sX2ZyZWUgd2hpY2ggd2lsbCAKPiByZWxlYXNlCj4gdGhlIEdUVCBCTyBwYWdlcy4g
QnV0IHRoZW4gaXNuJ3QgdGhlcmUgYSBwcm9ibGVtIGluIHR0bV9ib19yZWxlYXNlIHNpbmNlCj4g
dHRtX2JvX2NsZWFudXBfbWVtdHlwZV91c2Ugd2hpY2ggYWxzbyBsZWFkcyB0byBwYWdlcyByZWxl
YXNlIGNvbWVzCj4gYmVmb3JlIGJvLT5kZXN0cm95IHdoaWNoIHVubWFwcyB0aGUgcGFnZXMgZnJv
bSBrZXJuZWwgcGFnZSB0YWJsZSA/IFdvbid0Cj4gd2UgaGF2ZSBlbmQgdXAgd3JpdGluZyB0byBm
cmVlZCBtZW1vcnkgaW4gdGhpcyB0aW1lIGludGVydmFsID8gRG9uJ3Qgd2UKPiBuZWVkIHRvIHBv
c3Rwb25lIHBhZ2VzIGZyZWVpbmcgdG8gYWZ0ZXIga2VybmVsIHBhZ2UgdGFibGUgdW5tYXBwaW5n
ID8KCkJPcyBhcmUgb25seSBkZXN0cm95ZWQgd2hlbiB0aGVyZSBpcyBhIGd1YXJhbnRlZSB0aGF0
IG5vYm9keSBpcyAKYWNjZXNzaW5nIHRoZW0gYW55IG1vcmUuCgpUaGUgcHJvYmxlbSBoZXJlIGlz
IHRoYXQgdGhlIHBhZ2VzIGFzIHdlbGwgYXMgdGhlIFZSQU0gY2FuIGJlIAppbW1lZGlhdGVseSBy
ZXVzZWQgYWZ0ZXIgdGhlIGhvdHBsdWcgZXZlbnQuCgo+Cj4KPj4gU2ltaWxhciBmb3IgdnJhbSwg
aWYgdGhpcyBpcyBhY3R1YWwgaG90dW5wbHVnIGFuZCB0aGVuIHJlcGx1ZywgdGhlcmUncwo+PiBn
b2luZyB0byBiZSBhIGRpZmZlcmVudCBkZXZpY2UgYmVoaW5kIHRoZSBzYW1lIG1taW8gYmFyIHJh
bmdlIG1vc3QKPj4gbGlrZWx5ICh0aGUgaGlnaGVyIGJyaWRnZXMgYWxsIHRoaXMgaGF2ZSB0aGUg
c2FtZSB3aW5kb3dzIGFzc2lnbmVkKSwKPgo+Cj4gTm8gaWRlYSBob3cgdGhpcyBhY3R1YWxseSB3
b3JrcyBidXQgaWYgd2UgaGF2ZW4ndCBjYWxsZWQgaW91bm1hcCB5ZXQKPiBkb2Vzbid0IGl0IG1l
YW4gdGhhdCB0aG9zZSBwaHlzaWNhbCByYW5nZXMgdGhhdCBhcmUgc3RpbGwgbWFwcGVkIGludG8g
Cj4gcGFnZQo+IHRhYmxlIHNob3VsZCBiZSByZXNlcnZlZCBhbmQgY2Fubm90IGJlIHJldXNlZCBm
b3IgYW5vdGhlcgo+IGRldmljZSA/IEFzIGEgZ3Vlc3MsIG1heWJlIGFub3RoZXIgc3VicmFuZ2Ug
ZnJvbSB0aGUgaGlnaGVyIGJyaWRnZSdzIAo+IHRvdGFsCj4gcmFuZ2Ugd2lsbCBiZSBhbGxvY2F0
ZWQuCgpOb3BlLCB0aGUgUENJZSBzdWJzeXN0ZW0gZG9lc24ndCBjYXJlIGFib3V0IGFueSBpb3Jl
bWFwIHN0aWxsIGFjdGl2ZSBmb3IgCmEgcmFuZ2Ugd2hlbiBpdCBpcyBob3RwbHVnZ2VkLgoKPgo+
PiBhbmQgdGhhdCdzIGJhZCBuZXdzIGlmIHdlIGtlZXAgdXNpbmcgaXQgZm9yIGN1cnJlbnQgZHJp
dmVycy4gU28gd2UKPj4gcmVhbGx5IGhhdmUgdG8gcG9pbnQgYWxsIHRoZXNlIGNwdSBwdGVzIHRv
IHNvbWUgb3RoZXIgcGxhY2UuCj4KPgo+IFdlIGNhbid0IGp1c3QgdW5tYXAgaXQgd2l0aG91dCBz
eW5jaW5nIGFnYWluc3QgYW55IGluIGtlcm5lbCBhY2Nlc3NlcyAKPiB0byB0aG9zZSBidWZmZXJz
Cj4gYW5kIHNpbmNlIHBhZ2UgZmF1bHRpbmcgdGVjaG5pcXVlIHdlIHVzZSBmb3IgdXNlciBtYXBw
ZWQgYnVmZmVycyBzZWVtcyAKPiB0byBub3QgYmUgcG9zc2libGUKPiBmb3Iga2VybmVsIG1hcHBl
ZCBidWZmZXJzIEkgYW0gbm90IHN1cmUgaG93IHRvIGRvIGl0IGdyYWNlZnVsbHkuLi4KCldlIGNv
dWxkIHRyeSB0byByZXBsYWNlIHRoZSBrbWFwIHdpdGggYSBkdW1teSBwYWdlIHVuZGVyIHRoZSBo
b29kLCBidXQgCnRoYXQgaXMgZXh0cmVtZWx5IHRyaWNreS4KCkVzcGVjaWFsbHkgc2luY2UgQk9z
IHdoaWNoIGFyZSBqdXN0IDEgcGFnZSBpbiBzaXplIGNvdWxkIHBvaW50IHRvIHRoZSAKbGluZWFy
IG1hcHBpbmcgZGlyZWN0bHkuCgpDaHJpc3RpYW4uCgo+Cj4gQW5kcmV5Cj4KPgo+PiAtRGFuaWVs
Cj4+Cj4+PiBDaHJpc3RpYW4uCj4+Pgo+Pj4+IEkgbG9hZGVkIHRoZSBkcml2ZXIgd2l0aCB2bV91
cGRhdGVfbW9kZT0zCj4+Pj4gbWVhbmluZyBhbGwgVk0gdXBkYXRlcyBkb25lIHVzaW5nIENQVSBh
bmQgaGFzbid0IHNlZW4gYW55IE9PUHMgYWZ0ZXIKPj4+PiByZW1vdmluZyB0aGUgZGV2aWNlLiBJ
IGd1ZXNzIGkgY2FuIHRlc3QgaXQgbW9yZSBieSBhbGxvY2F0aW5nIEdUVCBhbmQKPj4+PiBWUkFN
IEJPcwo+Pj4+IGFuZCB0cnlpbmcgdG8gcmVhZC93cml0ZSB0byB0aGVtIGFmdGVyIGRldmljZSBp
cyByZW1vdmVkLgo+Pj4+Cj4+Pj4gQW5kcmV5Cj4+Pj4KPj4+Pgo+Pj4+PiBSZWdhcmRzLAo+Pj4+
PiBDaHJpc3RpYW4uCj4+Pj4+Cj4+Pj4+PiBBbmRyZXkKPj4+Pj4KPj4+PiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+Pj4+IGFtZC1nZnggbWFpbGluZyBs
aXN0Cj4+Pj4gYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPj4+PiBodHRwczovL25hbTEx
LnNhZmVsaW5rcy5wcm90ZWN0aW9uLm91dGxvb2suY29tLz91cmw9aHR0cHMlM0ElMkYlMkZsaXN0
cy5mcmVlZGVza3RvcC5vcmclMkZtYWlsbWFuJTJGbGlzdGluZm8lMkZhbWQtZ2Z4JmFtcDtkYXRh
PTA0JTdDMDElN0NBbmRyZXkuR3JvZHpvdnNreSU0MGFtZC5jb20lN0M2ZWUyYTQyOGQ4OGE0NzQy
ZjQ1YTA4ZDhhMWNkZTljNyU3QzNkZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3
QzAlN0M2Mzc0MzcyNTMwNjc2NTQ1MDYlN0NVbmtub3duJTdDVFdGcGJHWnNiM2Q4ZXlKV0lqb2lN
QzR3TGpBd01EQWlMQ0pRSWpvaVYybHVNeklpTENKQlRpSTZJazFoYVd3aUxDSlhWQ0k2TW4wJTNE
JTdDMTAwMCZhbXA7c2RhdGE9V1JMMnNtWTdpZW1nWmRsSDN0YVVaQ29hOGglMkJ1YUtEMUh2MHRi
SFVjbEFRJTNEJmFtcDtyZXNlcnZlZD0wIAo+Pj4+Cj4+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
