Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDEF2EF3F7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jan 2021 15:33:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA0E56E170;
	Fri,  8 Jan 2021 14:33:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2073.outbound.protection.outlook.com [40.107.244.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07A996E170;
 Fri,  8 Jan 2021 14:33:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jzyhYu0+Gf1y/j+K7jRMmt4HtPvjGeIsmeFvN7Xt9VLzyoZClctzn0XXNFp1jbJfagghu6VKpIBvdybXtZQilcfNiK9UHRJcD874togiR9e9D/+FZj0//EC5QemjoUe4ZcgUMj1cL0UN/DHMZ5S/Or76/Oj+6SWXsoyJNlvGh56yV+/u63whCHqMhitNF8NUorn/UxqAG7HgQJC6YO4wlZO6Fvs/pqm7Wqld1K30KzvmKfA2C2YmAdg3TTpduzJ61l6GxvrQyaJliYXBLBhn2pey/jssDqU4RvpsdoMlF0b7z9BlZlcYXRXn+TzBMwcdiNEQsQ9qnCdVyJqLYPJ0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GvCDviqaJAwP8Ii0bIAm2tAZ4Ru03Jzd5bdMzsm6w0=;
 b=EVE3NvFRR7QU8SgyfDduRcjQDBvNFXe5l5XQQP7w7rMklLvk9mZGQNe+IgJSbju1jljVIIvWWgB5er8Tr3hNiEh0J1ILjui4Vw7a8Fabs4a26VJMoHhDNEOVjbCBDJ+3xLoLc1XLEH0UGQ+6uOb9/E/EiNGRmZlRDgsn4Qm46XPx3H8x0BZJSDeD2MeATFJtS1p9VDlZOA/wwjo2Gjt8clrq+TUC1D9t5UhaW5/rxoC8ON5pEbDJxc4NeMv8gbuQer66W0VLrrE9Xm20qHpHeeIFujqwTMAA7B9f0C9BSMTgzsVnRZHUiDtYM4UXbeFcOqJHaogVDfpT7hpR9eYeIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6GvCDviqaJAwP8Ii0bIAm2tAZ4Ru03Jzd5bdMzsm6w0=;
 b=ZhGp9pZecnX/5YQO+JPDOklu6k2KrdOjmZcxhb4rPxUAyC6EGeOPnuUAnFTFq6/6+fcuj3B8cjr7LleH808WEZIA18NxIzF2LTEcSltPLntHifyOXta204Nx+gwkoT+3Nr0U6Kp5uOM7HDt1vtCi1LgVSulCq2PAQGZfUmfL3Mk=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2482.namprd12.prod.outlook.com (2603:10b6:207:4a::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3742.6; Fri, 8 Jan
 2021 14:33:41 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::44f:9f01:ece7:f0e5%3]) with mapi id 15.20.3742.006; Fri, 8 Jan 2021
 14:33:40 +0000
Subject: Re: [PATCH v3 01/12] drm: Add dummy page per device or GEM object
To: Andrey Grodzovsky <Andrey.Grodzovsky@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <1605936082-3099-1-git-send-email-andrey.grodzovsky@amd.com>
 <1605936082-3099-2-git-send-email-andrey.grodzovsky@amd.com>
 <a510b5c7-1898-f101-1cfd-a037e8fa445d@gmail.com>
 <e6bbd5fa-29b7-c74a-ea70-3979b573901b@amd.com>
 <5a61f76a-0b40-941f-8028-37202f296e74@gmail.com>
 <f374aaa4-4a30-e60c-cd4b-d463443c1137@amd.com>
 <X/c1IXX11chjHyl4@phenom.ffwll.local>
 <75c8a6f3-1e71-3242-6576-c0e661d6a62f@amd.com>
 <X/c3PKL70HXBt3Jk@phenom.ffwll.local>
 <589ece1f-2718-87ab-ec07-4044c3df1c58@amd.com>
 <a140ca34-9cfc-9c2f-39e2-1af156faabfe@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <b73319b2-1723-6650-8d03-d8f775119e53@amd.com>
Date: Fri, 8 Jan 2021 15:33:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <a140ca34-9cfc-9c2f-39e2-1af156faabfe@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0P190CA0015.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:190::25) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0P190CA0015.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:190::25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3742.6 via Frontend Transport; Fri, 8 Jan 2021 14:33:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 9dd5d0a9-dced-447a-0b20-08d8b3e264d5
X-MS-TrafficTypeDiagnostic: BL0PR12MB2482:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB2482DA3D0022B88A4221D1F683AE0@BL0PR12MB2482.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TlcatOiK76dK+LBRezvtUGHXh4+ROJqw2JUd2UIMLxU0okcFT221rZiMI/tgctgJoHdUfg/4T9WI6Tq3UGOTsiQ/fDhDGO6UYgOqFqYP56UFt6lIzqqz4OBrl2ESWyr4OIxRFQvpIHyGq4cRQg+nwNZ4Jkmacf+GYPa1BR+KMSumZQYlbE67eNe61cc0behZCrTBB1pOBn13CZqH2KJbmOFJtKun9mNZ2D6uDh2/A4++HbuZi+oN/xrH3mGbMz2YNzwUrhIPBoBMSCPQydj9XkhFk1wKRSnB2IfEm/+Eo+vtCJVYf/SsI3CR0YrpN6QkL52Rn5Z/BPxfHu/EybtOgGQkDyjo4VCHhIhEjRdEdsWkQq4vmNsuCfOumCu9RQwOQIIbDDuPYXtyBCatjqZPCBOrTU1SuJJXaQtHXc8jlnYAji9mlIB1jIhVaPYbN31xrBbXGTtiIxFbZVjJWCFSPuscG0NXzngp0aXCIUQGdNY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(366004)(376002)(136003)(39860400002)(396003)(86362001)(316002)(8676002)(6666004)(4326008)(110136005)(16526019)(2616005)(31696002)(66574015)(7416002)(2906002)(478600001)(8936002)(186003)(66946007)(66476007)(66556008)(6486002)(52116002)(5660300002)(31686004)(83380400001)(36756003)(53546011)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?TWhoUGdvV2lvKzEwU0I3M1p5eXVrRHhQUmhMNVpyTFZKZWozcmYxeCsweFEx?=
 =?utf-8?B?QUdVZ0UwYWhUSmxMZHp2MlVoMGRqWGJHZUdEYS9JVkc1akxqYytNemNHYUs3?=
 =?utf-8?B?V2hGclBPQjdCUTU3V1hRRFY2eWpqM0lyQmpCSzNQSzZ5eTZDYmpYbFNWcFVF?=
 =?utf-8?B?dzdab21PdUJMYlpRaE9HTFlVL3dxT1ZVdmJRRmhHRVZmSWNBcFljaW9zUFR5?=
 =?utf-8?B?QWJWcWc4SVkvbkJFdklBSnZXUVlRdWNrejBhcVkrbmo3ZWNzZWRrWVRNQjJm?=
 =?utf-8?B?Wm4zSWdYakNmUUVVQmZYSHpCUHg1TjZBb09xMnBVVVh1ZWUvTS9uNWxwVnBU?=
 =?utf-8?B?U2VYRmdveG5seXJVYm95bFlvNlN4alZkWlZLTzZkLzR1QzJ1T01LUW1BcVVD?=
 =?utf-8?B?YmFUVnJENmQxY2FwWHl1eWIybFREVkEyM3RGYnNjZmpqVXhML1V4TkdmMFJH?=
 =?utf-8?B?OWtvcFVVNEQrRmNtUDBSb1BJTDlTN3c2NXpHS21wMXpaSi8xSndYcWMxY0s0?=
 =?utf-8?B?Um5kU3JvZ0FraitGcDNhemhHcjVqbnRRUktOWEhHSWpQVmVzUTNzQng1djc2?=
 =?utf-8?B?ZUtxVk82R0pRTVd0dWZkUWhuTXptcExkVmFHMWlpMEtSUThLWnlvcmhsY2ov?=
 =?utf-8?B?N0hseTZBNm0zUXl6aDdFSWp5dU51a0dHN0JvQm9WZUN5UGhTNTRvU1E0ZnFL?=
 =?utf-8?B?UHdFWlRCUUx5cVVaMlR6c2dsUjkvbzN3ME5NQlF3WWQ1dEhYVlFMNEs5cVpX?=
 =?utf-8?B?NVhNZTRwckxhOW1PUmJVMm5OdWFYeUhEV0dONTl4ZytLU0N5MFl6dnFsR2VT?=
 =?utf-8?B?UTZYY0l4a3g4Y01NNWVwU25pYlEwRGFZQjhGdVFxTnFkZCtwSU1iSHhzRlRv?=
 =?utf-8?B?YTJ1bkpyNmtIRWtqQkNOWUtMS1g5R1FmdFU3c2pkWmNPNGZUTURGWGxUQWE0?=
 =?utf-8?B?UlhnR2V2U3grZThUbkFRTHNQWXlreWh6bzd1SDUxa08xc2U2NDh0SFQzVDNz?=
 =?utf-8?B?dk1xZ3dDMUpOcEQ2cXpWWlRNSnpwczl2dytua1RON25qb05EODN4RzRmRFhQ?=
 =?utf-8?B?Z05sQmR2TzBmZlZlWHcwcGU1bU5wV1BYbjZFZzF3SVM5elY2cnQvdDZyMk9v?=
 =?utf-8?B?SFRSbm9HeG1xbjYvdzNlWTFkNjIyU1JHbVM2RjBVTysvOHAzekQxcTJaRU9J?=
 =?utf-8?B?d2VWWE5wTktYN0U1dkRqWXp3U1BhekN4VUlWeDBjUmZUQkVuMW5OR1VnU3py?=
 =?utf-8?B?Z1hYUGs5RE4xYUlMQ3R1SVQ1Y1B1TWpPemROVlVTWDh5NE81MVRBb00wTGdv?=
 =?utf-8?B?QVh0U2JLd21EUzUzdlBlM2F2M2N1WjhPbUNDSUlXQ2IrZFJBc3NvMUJmcnJX?=
 =?utf-8?B?ZFJtLzNpVS9rcVg3MXdPZTFNdEY1d1ZXbTV2b3J2bW9RRkNKMmV2YmtPendU?=
 =?utf-8?Q?wP32m0Uv?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2021 14:33:40.7690 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-Network-Message-Id: 9dd5d0a9-dced-447a-0b20-08d8b3e264d5
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tz4z6OkbJ31800+kNmjS/cz4yUgLE3f53+cGvjOPGAyLGsMtujkcEcYUoNI2B6YG
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2482
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
Cc: amd-gfx@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, yuq825@gmail.com, gregkh@linuxfoundation.org,
 Alexander.Deucher@amd.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMDguMDEuMjEgdW0gMTU6MjYgc2NocmllYiBBbmRyZXkgR3JvZHpvdnNreToKPiBIZXkgQ2hy
aXN0aWFuLCBqdXN0IGEgcGluZy4KCldhcyB0aGVyZSBhbnkgcXVlc3Rpb24gZm9yIG1lIGhlcmU/
CgpBcyBmYXIgYXMgSSBjYW4gc2VlIHRoZSBiZXN0IGFwcHJvYWNoIHdvdWxkIHN0aWxsIGJlIHRv
IGZpbGwgdGhlIFZNQSAKd2l0aCBhIHNpbmdsZSBkdW1teSBwYWdlIGFuZCBhdm9pZCBwb2ludGVy
cyBpbiB0aGUgR0VNIG9iamVjdC4KCkNocmlzdGlhbi4KCj4KPiBBbmRyZXkKPgo+IE9uIDEvNy8y
MSAxMTozNyBBTSwgQW5kcmV5IEdyb2R6b3Zza3kgd3JvdGU6Cj4+Cj4+IE9uIDEvNy8yMSAxMToz
MCBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4+IE9uIFRodSwgSmFuIDA3LCAyMDIxIGF0IDEx
OjI2OjUyQU0gLTA1MDAsIEFuZHJleSBHcm9kem92c2t5IHdyb3RlOgo+Pj4+IE9uIDEvNy8yMSAx
MToyMSBBTSwgRGFuaWVsIFZldHRlciB3cm90ZToKPj4+Pj4gT24gVHVlLCBKYW4gMDUsIDIwMjEg
YXQgMDQ6MDQ6MTZQTSAtMDUwMCwgQW5kcmV5IEdyb2R6b3Zza3kgd3JvdGU6Cj4+Pj4+PiBPbiAx
MS8yMy8yMCAzOjAxIEFNLCBDaHJpc3RpYW4gS8O2bmlnIHdyb3RlOgo+Pj4+Pj4+IEFtIDIzLjEx
LjIwIHVtIDA1OjU0IHNjaHJpZWIgQW5kcmV5IEdyb2R6b3Zza3k6Cj4+Pj4+Pj4+IE9uIDExLzIx
LzIwIDk6MTUgQU0sIENocmlzdGlhbiBLw7ZuaWcgd3JvdGU6Cj4+Pj4+Pj4+PiBBbSAyMS4xMS4y
MCB1bSAwNjoyMSBzY2hyaWViIEFuZHJleSBHcm9kem92c2t5Ogo+Pj4+Pj4+Pj4+IFdpbGwgYmUg
dXNlZCB0byByZXJvdXRlIENQVSBtYXBwZWQgQk8ncyBwYWdlIGZhdWx0cyBvbmNlCj4+Pj4+Pj4+
Pj4gZGV2aWNlIGlzIHJlbW92ZWQuCj4+Pj4+Pj4+PiBVZmYsIG9uZSBwYWdlIGZvciBlYWNoIGV4
cG9ydGVkIERNQS1idWY/IFRoYXQncyBub3Qgc29tZXRoaW5nIAo+Pj4+Pj4+Pj4gd2UgY2FuIGRv
Lgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IFdlIG5lZWQgdG8gZmluZCBhIGRpZmZlcmVudCBhcHByb2Fj
aCBoZXJlLgo+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+IENhbid0IHdlIGNhbGwgYWxsb2NfcGFnZSgpIG9u
IGVhY2ggZmF1bHQgYW5kIGxpbmsgdGhlbSB0b2dldGhlcgo+Pj4+Pj4+Pj4gc28gdGhleSBhcmUg
ZnJlZWQgd2hlbiB0aGUgZGV2aWNlIGlzIGZpbmFsbHkgcmVhcGVkPwo+Pj4+Pj4+PiBGb3Igc3Vy
ZSBiZXR0ZXIgdG8gb3B0aW1pemUgYW5kIGFsbG9jYXRlIG9uIGRlbWFuZCB3aGVuIHdlIHJlYWNo
Cj4+Pj4+Pj4+IHRoaXMgY29ybmVyIGNhc2UsIGJ1dCB3aHkgdGhlIGxpbmtpbmcgPwo+Pj4+Pj4+
PiBTaG91bGRuJ3QgZHJtX3ByaW1lX2dlbV9kZXN0cm95IGJlIGdvb2QgZW5vdWdoIHBsYWNlIHRv
IGZyZWUgPwo+Pj4+Pj4+IEkgd2FudCB0byBhdm9pZCBrZWVwaW5nIHRoZSBwYWdlIGluIHRoZSBH
RU0gb2JqZWN0Lgo+Pj4+Pj4+Cj4+Pj4+Pj4gV2hhdCB3ZSBjYW4gZG8gaXMgdG8gYWxsb2NhdGUg
YSBwYWdlIG9uIGRlbWFuZCBmb3IgZWFjaCBmYXVsdCAKPj4+Pj4+PiBhbmQgbGluawo+Pj4+Pj4+
IHRoZSB0b2dldGhlciBpbiB0aGUgYmRldiBpbnN0ZWFkLgo+Pj4+Pj4+Cj4+Pj4+Pj4gQW5kIHdo
ZW4gdGhlIGJkZXYgaXMgdGhlbiBmaW5hbGx5IGRlc3Ryb3llZCBhZnRlciB0aGUgbGFzdCAKPj4+
Pj4+PiBhcHBsaWNhdGlvbgo+Pj4+Pj4+IGNsb3NlZCB3ZSBjYW4gZmluYWxseSByZWxlYXNlIGFs
bCBvZiB0aGVtLgo+Pj4+Pj4+Cj4+Pj4+Pj4gQ2hyaXN0aWFuLgo+Pj4+Pj4gSGV5LCBzdGFydGVk
IHRvIGltcGxlbWVudCB0aGlzIGFuZCB0aGVuIHJlYWxpemVkIHRoYXQgYnkgCj4+Pj4+PiBhbGxv
Y2F0aW5nIGEgcGFnZQo+Pj4+Pj4gZm9yIGVhY2ggZmF1bHQgaW5kaXNjcmltaW5hdGVseQo+Pj4+
Pj4gd2Ugd2lsbCBiZSBhbGxvY2F0aW5nIGEgbmV3IHBhZ2UgZm9yIGVhY2ggZmF1bHRpbmcgdmly
dHVhbCAKPj4+Pj4+IGFkZHJlc3Mgd2l0aGluIGEKPj4+Pj4+IFZBIHJhbmdlIGJlbG9uZ2luZyB0
aGUgc2FtZSBCTwo+Pj4+Pj4gYW5kIHRoaXMgaXMgb2J2aW91c2x5IHRvbyBtdWNoIGFuZCBub3Qg
dGhlIGludGVudGlvbi4gU2hvdWxkIEkgCj4+Pj4+PiBpbnN0ZWFkIHVzZQo+Pj4+Pj4gbGV0J3Mg
c2F5IGEgaGFzaHRhYmxlIHdpdGggdGhlIGhhc2gKPj4+Pj4+IGtleSBiZWluZyBmYXVsdGluZyBC
TyBhZGRyZXNzIHRvIGFjdHVhbGx5IGtlZXAgYWxsb2NhdGluZyBhbmQgCj4+Pj4+PiByZXVzaW5n
IHNhbWUKPj4+Pj4+IGR1bW15IHplcm8gcGFnZSBwZXIgR0VNIEJPCj4+Pj4+PiAob3IgZm9yIHRo
YXQgbWF0dGVyIERSTSBmaWxlIG9iamVjdCBhZGRyZXNzIGZvciBub24gaW1wb3J0ZWQgQk9zKSA/
Cj4+Pj4+IFdoeSBkbyB3ZSBuZWVkIGEgaGFzaHRhYmxlPyBBbGwgdGhlIHN3IHN0cnVjdHVyZXMg
dG8gdHJhY2sgdGhpcyAKPj4+Pj4gc2hvdWxkCj4+Pj4+IHN0aWxsIGJlIGFyb3VuZDoKPj4+Pj4g
LSBpZiBnZW1fYm8tPmRtYV9idWYgaXMgc2V0IHRoZSBidWZmZXIgaXMgY3VycmVudGx5IGV4cG9y
dGVkIGFzIGEgCj4+Pj4+IGRtYS1idWYsCj4+Pj4+IMKgwqDCoCBzbyBkZWZlbnNpdmVseSBhbGxv
Y2F0ZSBhIHBlci1ibyBwYWdlCj4+Pj4+IC0gb3RoZXJ3aXNlIGFsbG9jYXRlIGEgcGVyLWZpbGUg
cGFnZQo+Pj4+Cj4+Pj4gVGhhdCBleGFjdGx5IHdoYXQgd2UgaGF2ZSBpbiBjdXJyZW50IGltcGxl
bWVudGF0aW9uCj4+Pj4KPj4+Pgo+Pj4+PiBPciBpcyB0aGUgaWRlYSB0byBzYXZlIHRoZSBzdHJ1
Y3QgcGFnZSAqIHBvaW50ZXI/IFRoYXQgZmVlbHMgYSBiaXQgCj4+Pj4+IGxpa2UKPj4+Pj4gb3Zl
ci1vcHRpbWl6aW5nIHN0dWZmLiBCZXR0ZXIgdG8gaGF2ZSBhIHNpbXBsZSBpbXBsZW1lbnRhdGlv
biAKPj4+Pj4gZmlyc3QgYW5kCj4+Pj4+IHRoZW4gdHVuZSBpdCBpZiAoYW5kIG9ubHkgaWYpIGFu
eSBwYXJ0IG9mIGl0IGJlY29tZXMgYSBwcm9ibGVtIGZvciAKPj4+Pj4gbm9ybWFsCj4+Pj4+IHVz
YWdlLgo+Pj4+Cj4+Pj4gRXhhY3RseSAtIHRoZSBpZGVhIGlzIHRvIGF2b2lkIGFkZGluZyBleHRy
YSBwb2ludGVyIHRvIGRybV9nZW1fb2JqZWN0LAo+Pj4+IENocmlzdGlhbiBzdWdnZXN0ZWQgdG8g
aW5zdGVhZCBrZWVwIGEgbGlua2VkIGxpc3Qgb2YgZHVtbXkgcGFnZXMgdG8gYmUKPj4+PiBhbGxv
Y2F0ZWQgb24gZGVtYW5kIG9uY2Ugd2UgaGl0IGEgdm1fZmF1bHQuIEkgd2lsbCB0aGVuIGFsc28g
Cj4+Pj4gcHJlZmF1bHQgdGhlIGVudGlyZQo+Pj4+IFZBIHJhbmdlIGZyb20gdm1hLT52bV9lbmQg
LSB2bWEtPnZtX3N0YXJ0IHRvIHZtYS0+dm1fZW5kIGFuZCBtYXAgdGhlbQo+Pj4+IHRvIHRoYXQg
c2luZ2xlIGR1bW15IHBhZ2UuCj4+PiBUaGlzIHN0cm9uZ2x5IGZlZWxzIGxpa2UgcHJlbWF0dXJl
IG9wdGltaXphdGlvbi4gSWYgeW91J3JlIHdvcnJpZWQgCj4+PiBhYm91dAo+Pj4gdGhlIG92ZXJo
ZWFkIG9uIGFtZGdwdSwgcGF5IGRvd24gdGhlIGRlYnQgYnkgcmVtb3Zpbmcgb25lIG9mIHRoZSAK
Pj4+IHJlZHVuZGFudAo+Pj4gcG9pbnRlcnMgYmV0d2VlbiBnZW0gYW5kIHR0bSBibyBzdHJ1Y3Rz
IChJIHRoaW5rIHdlIHN0aWxsIGhhdmUgc29tZSkgCj4+PiA6LSkKPj4+Cj4+PiBVbnRpbCB3ZSd2
ZSBudWtlZCB0aGVzZSBlYXN5Jm9idmlvdXMgb25lcyB3ZSBzaG91bGRuJ3QgcGxheSAiYXZvaWQg
MQo+Pj4gcG9pbnRlciBqdXN0IGJlY2F1c2UiIGdhbWVzIHdpdGggaGFzaHRhYmxlcy4KPj4+IC1E
YW5pZWwKPj4KPj4KPj4gV2VsbCwgaWYgeW91IGFuZCBDaHJpc3RpYW4gY2FuIGFncmVlIG9uIHRo
aXMgYXBwcm9hY2ggYW5kIHN1Z2dlc3QgCj4+IG1heWJlIHdoYXQgcG9pbnRlciBpcwo+PiByZWR1
bmRhbnQgYW5kIGNhbiBiZSByZW1vdmVkIGZyb20gR0VNIHN0cnVjdCBzbyB3ZSBjYW4gdXNlIHRo
ZSAKPj4gJ2NyZWRpdCcgdG8gYWRkIHRoZSBkdW1teSBwYWdlCj4+IHRvIEdFTSBJIHdpbGwgYmUg
aGFwcHkgdG8gZm9sbG93IHRocm91Z2guCj4+Cj4+IFAuUyBIYXNoIHRhYmxlIGlzIG9mZiB0aGUg
dGFibGUgYW55d2F5IGFuZCB3ZSBhcmUgdGFsa2luZyBvbmx5IGFib3V0IAo+PiBsaW5rZWQgbGlz
dCBoZXJlIHNpbmNlIGJ5IHByZWZhdWx0aW5nCj4+IHRoZSBlbnRpcmUgVkEgcmFuZ2UgZm9yIGEg
dm1mLT52bWEgaSB3aWxsIGJlIGF2b2lkaW5nIHJlZHVuZGFudCBwYWdlIAo+PiBmYXVsdHMgdG8g
c2FtZSBWTUEgVkEgcmFuZ2UgYW5kIHNvCj4+IGRvbid0IG5lZWQgdG8gc2VhcmNoIGFuZCByZXVz
ZSBhbiBleGlzdGluZyBkdW1teSBwYWdlIGJ1dCBzaW1wbHkgCj4+IGNyZWF0ZSBhIG5ldyBvbmUg
Zm9yIGVhY2ggbmV4dCBmYXVsdC4KPj4KPj4gQW5kcmV5CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
