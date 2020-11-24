Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB182C28F9
	for <lists+dri-devel@lfdr.de>; Tue, 24 Nov 2020 15:06:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8607F6E3EB;
	Tue, 24 Nov 2020 14:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700061.outbound.protection.outlook.com [40.107.70.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3F056E3CE;
 Tue, 24 Nov 2020 14:06:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdKigV6BdmjEL6350G1/ij3LYO65Z4y7/BAULFBR3He0ndlos5jqh7fEED7K55Nd0lSGCcAL3Wt4tkuD0HDXOKyy2yn8WbrekUsHlbpH7tcF9VjSuYBK07MVeAWkc07gmYLLlGSRkly+ai5nobmhwE+60O+S6wr9HstsvAMycVPUzCqEAu+qeMS3WYOUxiLjpFWUkCzw0TD/JHWg9+88zbrpkzdQNEOynFWfO141e+GcM00lEM7sMyAgb4FPUy0s/BGAoDwVbcAZYnTnFy0hjpPFjxHmcqVKLqjMVJvn2HYUi7GfvEpc9VDRDSy28UC1s5FQI3ZU+3WLnFBLucJYBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBu1ynJdY6bH9XYXlqrrjEEVRjZNTkWFGisVypz/yr4=;
 b=RJhKkgwA+AOL2fKr2YxFy/Gh3kElEHLGHkNEMa6hiz04BkYvsnKoJ6N+c7hx6d+bg4I06PB1r2J5gZrgzauuH1XLNl0ltD7kWUxdZQiWdzkHmhxx18Gv1T+4oBwLZx/4BLiZQVZXv6AtY+BW36i7c0hOJ/vWtLqk4k0zUFb8xaOEm/25ra6ftgJiGgsXDsbRCNueZu6X9fHz+O3mYpqprBcHTRCPzTlBFkQpoHVA/7azqG4aatU/ELoFRiIceQSUcniAxxtkDEevGFucfNoyvPF75nYZiY8o0kUVqsd7CsaI8CaI3VX+nXWIitmP9nqj2nIHnFDBt/CHQ3KEx4D0yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CBu1ynJdY6bH9XYXlqrrjEEVRjZNTkWFGisVypz/yr4=;
 b=HPSSWGKtvL16F6+suc1z8mu2pJ0c6QcKub1YzHTjGzTMBe4OFt7encfnpbc2p/725tRKLAzVnnyLDVVDOmR8Lppl+v27wnaeid/7T9m/1verkgKgOacEzP2rRIdmlxcG6liktmckrIdK2617lstgtBGTxIMy55yO08BHZKF6PSI=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB3838.namprd12.prod.outlook.com (2603:10b6:208:16c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3589.22; Tue, 24 Nov
 2020 14:06:27 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::1ccc:8a9a:45d3:dd31%7]) with mapi id 15.20.3589.022; Tue, 24 Nov 2020
 14:06:27 +0000
Subject: Re: [PATCH 4/7] drm/radeon: Pin buffers while they are vmap'ed
To: Thomas Zimmermann <tzimmermann@suse.de>, alexander.deucher@amd.com,
 airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org
References: <20201112132117.27228-1-tzimmermann@suse.de>
 <20201112132117.27228-5-tzimmermann@suse.de>
 <3daf9b24-034a-9791-ce30-9f5eba66e7c1@amd.com>
 <516877c4-3718-1415-9901-62bffdbf26c8@suse.de>
 <f5cfbae9-ba51-dce0-4398-2969971ffc99@amd.com>
 <94fa26eb-d899-8c83-9325-84532639d438@suse.de>
 <6319ba4d-f45f-77ec-8752-33f3cad443fd@amd.com>
 <d1508c4f-df3e-fa3c-3071-d8a58295e674@suse.de>
 <cbfa3e8d-81a3-5620-d4fc-72188cfb42ee@amd.com>
 <6d2ee787-0bf5-de1d-73af-7c87bad63cda@suse.de>
 <2431a0e1-7159-b3e7-e1ca-3e7f55c38d8a@amd.com>
 <b356ee3d-64bd-30c9-23f6-dea3a1b87bea@suse.de>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <df307b3e-e98e-fa18-a171-61f2e3d7f3e9@amd.com>
Date: Tue, 24 Nov 2020 15:06:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <b356ee3d-64bd-30c9-23f6-dea3a1b87bea@suse.de>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR01CA0118.eurprd01.prod.exchangelabs.com
 (2603:10a6:208:168::23) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR01CA0118.eurprd01.prod.exchangelabs.com (2603:10a6:208:168::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3611.20 via Frontend
 Transport; Tue, 24 Nov 2020 14:06:25 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 1b2c9c93-3f00-4a32-5ee4-08d890822266
X-MS-TrafficTypeDiagnostic: MN2PR12MB3838:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB383817E646DA609B87F0545483FB0@MN2PR12MB3838.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OxIpH/xy7dKR/1QAdEVH9Fk7q/ZPjusiNGRE9juCdZMBmM6yHVfCYP+tPGDXZaDw5aTeMw6QKbsD5DwLaCXqdL5TbfS6KcWyCGmtbKi/i8z344ptLVBXB2Nkk7moLLwwrzfe/lsLga85RtP91qgAmZLjzQ9VC83DrluCBA2jZruk4looOUev4x4ZKNva8tM+xjvIIycpmPdytrTN+UOc9LRG18EwTI098MN/rIuzmRde9VrBFrmWUVWgRKLXya/A6BolNv0+HC4nJwRcvCV/HuyxBnZfIw3wFzsmT2FxtgP2G4coZDaDFkK1fQKM0/pFEzCtgrZkFR7Bv8N0sjPbCasPajZViQJ7jpxj1s+NHLuBEyrOan3J5wzsuBpBzorllkqx1OYfUgZTV494AdeY96HCEG6hsvhC+b6w8c4LrSw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(376002)(136003)(366004)(39860400002)(396003)(86362001)(66574015)(52116002)(8676002)(36756003)(4326008)(83380400001)(8936002)(6666004)(316002)(186003)(16526019)(31686004)(5660300002)(2906002)(66556008)(31696002)(2616005)(66476007)(478600001)(66946007)(966005)(6486002)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?RStRclV6Q1hSalBFdGJ2dHBkMjZCWFNQNnQwV1gxTWMzWmlIRGYvZ1lLZkpN?=
 =?utf-8?B?akZjeVN3b1ZVMjdjU3lZR3ZaV2NtbmI5WEdLb2JWYW44NDkrb0dYVWt3ZWhO?=
 =?utf-8?B?SGtIYVE0eFBaNjZBMlExNHZhY2dJYkFFcEF1bVFTYjBjUFZnaHBRTFRVMjYv?=
 =?utf-8?B?QWVZOFhTM0FWSFE0Sld0dGxwNEFVdmNJdnNGdklNbHpDQVdxbFlUT2Y2U0Qy?=
 =?utf-8?B?elVIZlBQdDc5aUgzTW1IemZpNmVDQjdPaE9HR2JTQ3lGNXhoMHFlc1RjMWVW?=
 =?utf-8?B?ZGFXSWljMjJlNVhVKzdsb1hZTE1td2VMYjQxTW9VWEdVN2Qvd1U1Y2xzYk9s?=
 =?utf-8?B?N2ZnSEcrSE5WNUtJc2N2R3VRd3IyTnlDNHlmMHFFM0VkVVM1cllvR1p1bm5F?=
 =?utf-8?B?bllabGJhOWw5dTN3UzZ1QVltM2dwemlOcXhxT1lyWkhjQ0l2YnRacFlmY2Nz?=
 =?utf-8?B?NFkvSzJLRWVDT0Vsb2JjNEpTYjFlRUFwYUppaGZ4dm00KzdnWU1KM1FtUTlR?=
 =?utf-8?B?S2JyQ1NZQ2FBVWEycUM5QU9WNFN0OURQMW15NDB1anZYdnBtNHUvOWJWQzdN?=
 =?utf-8?B?YnBEM0NhRG83blJhQWFyQXdJeTJtMi81a1NxZFZEelRDU1RINERqaFc1d0kv?=
 =?utf-8?B?VjRZUTM4dG9aSDduYkZXZFhmbkREVk5lZjc5RUJtWlVvYUpmbXVxM3ZCMS9N?=
 =?utf-8?B?M0ZjZE5XUS82RVV6QVlyYzBaTlMzaDUydEg0akFLTkpwamRTVUxuNTlTUTls?=
 =?utf-8?B?MURxNTNQaXkyZ3BvY291VjhOdDkrbnNYR3MyMVZ3aTl5dXgwdjQ2T2JGM3lY?=
 =?utf-8?B?OER2dEg0WldHbDBNaVV3MWpXY1N0SE0xVy9xRG45cEVyVnl3S2JTNmIvRk14?=
 =?utf-8?B?bkxVd3pMdG8wMWpoUGo0Zk1kQ29tOTVNRjJMOHRwUTJqNEV5ZFpqbnA4M1dn?=
 =?utf-8?B?RWpXSjlUQ2NsZHJ0dW8yUFpubHdlSjBXQUxrTEJKN21rQWFuUlB3ZXptWmlD?=
 =?utf-8?B?bnQ2T2lkM2k5OHVYcUdUZjZrbWVlVE5XaGhhK21tV1dhUE0yYmY2cE41TFhE?=
 =?utf-8?B?ODA5b3JtakxHTHBsUmJnYmtLeHV5RXhTZms3RVlOL0JnZlNWOXpZbjZkTkda?=
 =?utf-8?B?SWRycTJWbUdZMlMwYnBoeElXQkdiUnNYT1ZoV3cyamE5Q3Q4UmxDWVJTZmdv?=
 =?utf-8?B?ak1KbDQ4UnJUeTA2dnlpcy9zY0lsZTZMVm0rTG5ubGl1Y2NSZlh6V3JzSVha?=
 =?utf-8?B?Mm9hWi9iaEdNUmk5UnVMYVBybDFqRWtCRTBoT09HdVlNYzVwNVVIOXlJSmth?=
 =?utf-8?B?cWJ5OU1PR3JNemVuN0JZN1Z1V09WdzRhOTdGZHdQYk9yNHh5bWlyUXdKUTg0?=
 =?utf-8?B?UEpJeHlXTXA2bDM0ZVZNaGZ3dDVHa3ppSjFYQk5GUWVhWURSZXdsYUU2cWlQ?=
 =?utf-8?Q?Gc86AQmz?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b2c9c93-3f00-4a32-5ee4-08d890822266
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2020 14:06:27.2656 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FG/4nXfUMYpr3MkAABLEGQO81Tuk5ozo/1j8jBS/6VBFBDOyawKTUz5gf+MomhgN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3838
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
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMTEuMjAgdW0gMTQ6NTYgc2NocmllYiBUaG9tYXMgWmltbWVybWFubjoKPiBIaQo+Cj4g
QW0gMjQuMTEuMjAgdW0gMTQ6MzYgc2NocmllYiBDaHJpc3RpYW4gS8O2bmlnOgo+PiBBbSAyNC4x
MS4yMCB1bSAxMzoxNSBzY2hyaWViIFRob21hcyBaaW1tZXJtYW5uOgo+Pj4gW1NOSVBdCj4+Pj4+
Pj4gRmlyc3QgSSB3YW50ZWQgdG8gcHV0IHRoaXMgaW50byBkcm1fZ2VtX3R0bV92bWFwL3Z1bm1h
cCgpLCBidXQgCj4+Pj4+Pj4gdGhlbiB3b25kZXJlZCB3aHkgdHRtX2JvX3ZtYXAoKSBkb2Ugbm90
IGFjcXVpcmUgdGhlIGxvY2sgCj4+Pj4+Pj4gaW50ZXJuYWxseT8gSSdkIGV4cGVjdCB0aGF0IHZt
YXAvdnVubWFwIGFyZSBjbG9zZSB0b2dldGhlciBhbmQgCj4+Pj4+Pj4gZG8gbm90IG92ZXJsYXAg
Zm9yIHRoZSBzYW1lIEJPLiAKPj4+Pj4+Cj4+Pj4+PiBXZSBoYXZlIHVzZSBjYXNlcyBsaWtlIHRo
ZSBmb2xsb3dpbmcgZHVyaW5nIGNvbW1hbmQgc3VibWlzc2lvbjoKPj4+Pj4+Cj4+Pj4+PiAxLiBs
b2NrCj4+Pj4+PiAyLiBtYXAKPj4+Pj4+IDMuIGNvcHkgcGFydHMgb2YgdGhlIEJPIGNvbnRlbnQg
c29tZXdoZXJlIGVsc2Ugb3IgcGF0Y2ggaXQgd2l0aCAKPj4+Pj4+IGFkZGl0aW9uYWwgaW5mb3Jt
YXRpb24KPj4+Pj4+IDQuIHVubWFwCj4+Pj4+PiA1LiBzdWJtaXQgQk8gdG8gdGhlIGhhcmR3YXJl
Cj4+Pj4+PiA2LiBhZGQgaGFyZHdhcmUgZmVuY2UgdG8gdGhlIEJPIHRvIG1ha2Ugc3VyZSBpdCBk
b2Vzbid0IG1vdmUKPj4+Pj4+IDcuIHVubG9jawo+Pj4+Pj4KPj4+Pj4+IFRoYXQgdXNlIGNhc2Ug
d29uJ3QgYmUgcG9zc2libGUgd2l0aCB2bWFwL3Z1bm1hcCBpZiB3ZSBtb3ZlIHRoZSAKPj4+Pj4+
IGxvY2svdW5sb2NrIGludG8gaXQgYW5kIEkgaG9wZSB0byByZXBsYWNlIHRoZSBrbWFwL2t1bm1h
cCAKPj4+Pj4+IGZ1bmN0aW9ucyB3aXRoIHRoZW0gaW4gdGhlIG5lYXIgdGVybS4KPj4+Pj4+Cj4+
Pj4+Pj4gT3RoZXJ3aXNlLCBhY3F1aXJpbmcgdGhlIHJlc2VydmF0aW9uIGxvY2sgd291bGQgcmVx
dWlyZSBhbm90aGVyIAo+Pj4+Pj4+IHJlZi1jb3VudGluZyB2YXJpYWJsZSBvciBwZXItZHJpdmVy
IGNvZGUuCj4+Pj4+Pgo+Pj4+Pj4gSHVpLCB3aHkgdGhhdD8gSnVzdCBwdXQgdGhpcyBpbnRvIGRy
bV9nZW1fdHRtX3ZtYXAvdnVubWFwKCkgCj4+Pj4+PiBoZWxwZXIgYXMgeW91IGluaXRpYWxseSBw
bGFubmVkLgo+Pj4+Pgo+Pj4+PiBHaXZlbiB5b3VyIGV4YW1wbGUgYWJvdmUsIHN0ZXAgb25lIHdv
dWxkIGFjcXVpcmUgdGhlIGxvY2ssIGFuZCAKPj4+Pj4gc3RlcCB0d28gd291bGQgYWxzbyBhY3F1
aXJlIHRoZSBsb2NrIGFzIHBhcnQgb2YgdGhlIHZtYXAgCj4+Pj4+IGltcGxlbWVudGF0aW9uLiBX
b3VsZG4ndCB0aGlzIGZhaWwgKEF0IGxlYXN0IGR1cmluZyB1bm1hcCBvciAKPj4+Pj4gdW5sb2Nr
IHN0ZXBzKSA/Cj4+Pj4KPj4+PiBPaCwgc28geW91IHdhbnQgdG8gbmVzdCB0aGVtPyBObywgdGhh
dCBpcyBhIHJhdGhlciBiYWQgbm8tZ28uCj4+Pgo+Pj4gSSBkb24ndCB3YW50IHRvIG5lc3Qvb3Zl
cmxhcCB0aGVtLiBNeSBxdWVzdGlvbiB3YXMgd2hldGhlciB0aGF0IAo+Pj4gd291bGQgYmUgcmVx
dWlyZWQuIEFwcGFyZW50bHkgbm90Lgo+Pj4KPj4+IFdoaWxlIHRoZSBjb25zb2xlJ3MgQk8gaXMg
YmVpbmcgc2V0IGZvciBzY2Fub3V0LCBpdCdzIHByb3RlY3RlZCBmcm9tIAo+Pj4gbW92ZW1lbnQg
dmlhIHRoZSBwaW4vdW5waW4gaW1wbGVtZW50YXRpb24sIHJpZ2h0Pwo+Pgo+PiBZZXMsIGNvcnJl
Y3QuCj4+Cj4+PiBUaGUgZHJpdmVyIGRvZXMgbm90IGFjcXVpcmUgdGhlIHJlc3YgbG9jayBmb3Ig
bG9uZ2VyIHBlcmlvZHMuIEknbSAKPj4+IGFza2luZyBiZWNhdXNlIHRoaXMgd291bGQgcHJldmVu
dCBhbnkgY29uc29sZS1idWZmZXIgdXBkYXRlcyB3aGlsZSAKPj4+IHRoZSBjb25zb2xlIGlzIGJl
aW5nIGRpc3BsYXllZC4KPj4KPj4gQ29ycmVjdCBhcyB3ZWxsLCB3ZSBvbmx5IGhvbGQgdGhlIGxv
Y2sgZm9yIHRoaW5ncyBsaWtlIGNvbW1hbmQgCj4+IHN1Ym1pc3Npb24sIHBpbm5pbmcsIHVucGlu
bmluZyBldGMgZXRjLi4uLgo+Pgo+Cj4gVGhhbmtzIGZvciBhbnN3ZXJpbmcgbXkgcXVlc3Rpb25z
Lgo+Cj4+Pgo+Pj4+Cj4+Pj4gWW91IG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQgdGhlIGxvY2sgaXMg
b25seSB0YWtlbiBmcm9tIHRoZSBGQiBwYXRoIAo+Pj4+IHdoaWNoIHdhbnRzIHRvIHZtYXAgdGhl
IG9iamVjdC4KPj4+Pgo+Pj4+IFdoeSBkb24ndCB5b3UgbG9jayB0aGUgR0VNIG9iamVjdCBmcm9t
IHRoZSBjYWxsZXIgaW4gdGhlIGdlbmVyaWMgRkIgCj4+Pj4gaW1wbGVtZW50YXRpb24/Cj4+Pgo+
Pj4gV2l0aCB0aGUgY3VycmVudCBibGl0dGVyIGNvZGUsIGl0IGJyZWFrcyBhYnN0cmFjdGlvbi4g
aWYgdm1hcC92dW5tYXAgCj4+PiBob2xkIHRoZSBsb2NrIGltcGxpY2l0bHksIHRoaW5ncyB3b3Vs
ZCBiZSBlYXNpZXIuCj4+Cj4+IERvIHlvdSBoYXZlIGEgbGluayB0byB0aGUgY29kZT8KPgo+IEl0
J3MgdGhlIGRhbWFnZSBibGl0dGVyIGluIHRoZSBmYmRldiBjb2RlLiBbMV0gV2hpbGUgaXQgZmx1
c2hlcyB0aGUgCj4gc2hhZG93IGJ1ZmZlciBpbnRvIHRoZSBCTywgdGhlIEJPIGhhcyB0byBiZSBr
ZXB0IGluIHBsYWNlLiBJIGFscmVhZHkgCj4gY2hhbmdlZCBpdCB0byBsb2NrIHN0cnVjdCBkcm1f
ZmJfaGVscGVyLmxvY2ssIGJ1dCBJIGRvbid0IHRoaW5rIHRoaXMgCj4gaXMgZW5vdWdoLiBUVE0g
Y291bGQgc3RpbGwgZXZpY3QgdGhlIEJPIGNvbmN1cnJlbnRseS4KClllYWgsIHRoYXQncyBjb3Jy
ZWN0LgoKQnV0IEkgc3RpbGwgZG9uJ3QgZnVsbHkgdW5kZXJzdGFuZCB0aGUgcHJvYmxlbS4gWW91
IGp1c3QgbmVlZCB0byBjaGFuZ2UgCnRoZSBjb2RlIGxpa2UgdGhpczoKCiDCoMKgwqAgbXV0ZXhf
bG9jaygmZmJfaGVscGVyLT5sb2NrKTsKIMKgwqDCoCBkbWFfcmVzdl9sb2NrKGJ1ZmZlci0+Z2Vt
LT5yZXN2LCBOVUxMKTsKCiDCoMKgwqAgcmV0ID0gZHJtX2NsaWVudF9idWZmZXJfdm1hcChidWZm
ZXIsICZtYXApOwogwqDCoMKgIGlmIChyZXQpCiDCoMKgwqDCoMKgwqDCoCBnb3RvIG91dDsKCiDC
oMKgwqAgZHN0ID0gbWFwOwogwqDCoMKgIGRybV9mYl9oZWxwZXJfZGFtYWdlX2JsaXRfcmVhbChm
Yl9oZWxwZXIsIGNsaXAsICZkc3QpOwoKIMKgwqDCoCBkcm1fY2xpZW50X2J1ZmZlcl92dW5tYXAo
YnVmZmVyKTsKCm91dDoKIMKgwqDCoCBkbWFfcmVzdl91bmxvY2soYnVmZmVyLT5nZW0tPnJlc3Yp
OwogwqDCoMKgIG11dGV4X3VubG9jaygmZmJfaGVscGVyLT5sb2NrKTsKCgpZb3UgY291bGQgYWJz
dHJhY3QgdGhhdCBpbiBkcm1fY2xpZW50IGZ1bmN0aW9ucyBhcyB3ZWxsLCBidXQgSSBkb24ndCAK
cmVhbGx5IHNlZSB0aGUgdmFsdWUgaW4gdGhhdC4KClJlZ2FyZHMsCkNocmlzdGlhbi4KCj4gVGhl
cmUncyBubyByZWN1cnNpb24gdGFraW5nIHBsYWNlLCBzbyBJIGd1ZXNzIHRoZSByZXNlcnZhdGlv
biBsb2NrIAo+IGNvdWxkIGJlIGFjcXVpcmVkL3JlbGVhc2UgaW4gZHJtX2NsaWVudF9idWZmZXJf
dm1hcC92dW5tYXAoKSwgb3IgYSAKPiBzZXBhcmF0ZSBwYWlyIG9mIERSTSBjbGllbnQgZnVuY3Rp
b25zIGNvdWxkIGRvIHRoZSBsb2NraW5nLgo+Cj4gQmVzdCByZWdhcmRzCj4gVGhvbWFzCj4KPiBb
MV0gCj4gaHR0cHM6Ly9jZ2l0LmZyZWVkZXNrdG9wLm9yZy9kcm0vZHJtLXRpcC90cmVlL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmM/aWQ9YWM2MGYzZjMwOTAxMTVkMjFmMDI4YmZmYTJk
Y2ZiNjdmNjk1YzRmMiNuMzk0Cj4KPj4KPj4gUGxlYXNlIG5vdGUgdGhhdCB0aGUgcmVzZXJ2YXRp
b24gbG9jayB5b3UgbmVlZCB0byB0YWtlIGhlcmUgaXMgcGFydCAKPj4gb2YgdGhlIEdFTSBvYmpl
Y3QuCj4+Cj4+IFVzdWFsbHkgd2UgZGVzaWduIHRoaW5ncyBpbiB0aGUgd2F5IHRoYXQgdGhlIGNv
ZGUgbmVlZHMgdG8gdGFrZSBhIAo+PiBsb2NrIHdoaWNoIHByb3RlY3RzIGFuIG9iamVjdCwgdGhl
biBkbyBzb21lIG9wZXJhdGlvbnMgd2l0aCB0aGUgCj4+IG9iamVjdCBhbmQgdGhlbiByZWxlYXNl
IHRoZSBsb2NrIGFnYWluLgo+Pgo+PiBIYXZpbmcgaW4gdGhlIGxvY2sgaW5zaWRlIHRoZSBvcGVy
YXRpb24gY2FuIGJlIGRvbmUgYXMgd2VsbCwgYnV0IAo+PiByZXR1cm5pbmcgd2l0aCBpdCBpcyBr
aW5kIG9mIHVudXN1YWwgZGVzaWduLgo+Pgo+Pj4gU29ycnkgZm9yIHRoZSBub29iIHF1ZXN0aW9u
cy4gSSdtIHN0aWxsIHRyeWluZyB0byB1bmRlcnN0YW5kIHRoZSAKPj4+IGltcGxpY2F0aW9ucyBv
ZiBhY3F1aXJpbmcgdGhlc2UgbG9ja3MuCj4+Cj4+IFdlbGwgdGhpcyBpcyB0aGUgcmVzZXJ2YXRp
b24gbG9jayBvZiB0aGUgR0VNIG9iamVjdCB3ZSBhcmUgdGFsa2luZyAKPj4gYWJvdXQgaGVyZS4g
V2UgbmVlZCB0byB0YWtlIHRoYXQgZm9yIGEgY291cGxlIG9mIGRpZmZlcmVudCAKPj4gb3BlcmF0
aW9ucywgdm1hcC92dW5tYXAgZG9lc24ndCBzb3VuZCBsaWtlIGEgc3BlY2lhbCBjYXNlIHRvIG1l
Lgo+Pgo+PiBSZWdhcmRzLAo+PiBDaHJpc3RpYW4uCj4+Cj4+Pgo+Pj4gQmVzdCByZWdhcmRzCj4+
PiBUaG9tYXMKPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPj4gZHJpLWRldmVsIG1haWxpbmcgbGlzdAo+PiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVsCj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1k
ZXZlbAo=
