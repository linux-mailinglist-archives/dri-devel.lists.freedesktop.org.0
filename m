Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E36E5347DD0
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 17:38:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2F8D6EA3D;
	Wed, 24 Mar 2021 16:38:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33E256EA3D
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 16:38:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YnX/rgWkx7BAJmNkPxMeDisyRBDS4Fjm9uxOQ+IFHNk7L/9q77uBtSaLl3G5Mm5BD5FKN8oV+1Wu6nQaLdxnm8K5JaKufY5uqO26CJd4eqezIreBEqqA7GhSS9mikCWWGIOedHbaLrjj/g8NLN9oQXopNKOZcRXPCpYN/P+OuSP7wswoULse7ZFO3rBjc/fugENNv0t98phK/VkpqPOYRmHjYcuYkq0yAbqWNEAFlRRlAPOIezrzYw/pHeEIu6FCFxZW880lNmTMg6cWvHoyExrEemMVXr4iXE3Y/yxFIJmxkeEbmHgDlOEX9YUG79r0dGkTQxWRV2MvG0U0f/40Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tv4Qh5ZQzJ3MCjLi9QUo3xoGEY4GJ1GeP29Z22lX6MU=;
 b=OUhEZ5mYTk066X8O5b/dSKyCKm9vGDgcfxEn4XsS1rAJay+ZavJcri0baHcdrsGzRAGAQ5w+IPPvlQZSikq2vUPpo+pEhXaktHc3tQrD1qg6+WRG+zIJyNw53lcGEJ4e28NLpGr7jR5JVpsnDU0PrnrW6Ql4DJ0psFzGChr6ejtZQmceu5vogerLY88DTyDqglxZguA5P/rz/yse/8QhWoq18zt5hfdFu6KGdMgD9DkDvUhvat2bJRfzPEu9CPmWE55S1xMsD5kDiXQYyaFD/dEkjztdNGi/NAIKf0j1ayExs+1DmRE08rWn9GdUbCnWXRaefTiUmbhqNLX+/d50IA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tv4Qh5ZQzJ3MCjLi9QUo3xoGEY4GJ1GeP29Z22lX6MU=;
 b=qYBhngqp7tM16xfdw97gXAsHsJnExwx2jWnFwUtdtYtsadkIjdv9U3BAYO0OMLprfUAQl5gCUiuQeotgRS6lf+Lr7ysf+/iW7etSEpbnVhgHODkiXxhRzfaLI5lF125jrQI4H05wDqenIGZy1GOrtorPoBYXxsEhu0P0EXp3K05b0HRhmYwOoS7/Ewdw3XQu1+Wdq/eGZN3n2Wo4KSbDXSJ3lwIJ9wGfJlVxWwv+2x+wBTWlqwHQazmFVT9F32nehaeB73W4s/ZX0zF0yU+zQGBvqNECNIAITBOXaXnMS9YACbp04ix73f4dRa6cM85LIRs+rFdEYeptjBdg2XdjyA==
Authentication-Results: shipmail.org; dkim=none (message not signed)
 header.d=none;shipmail.org; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3402.namprd12.prod.outlook.com (2603:10b6:5:3b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.24; Wed, 24 Mar
 2021 16:38:13 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3955.027; Wed, 24 Mar 2021
 16:38:13 +0000
Date: Wed, 24 Mar 2021 13:38:12 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>
Subject: Re: [RFC PATCH 1/2] mm,drm/ttm: Block fast GUP to TTM huge pages
Message-ID: <20210324163812.GJ2356281@nvidia.com>
References: <314fc020-d243-dbf0-acb3-ecfcc9c2443c@shipmail.org>
 <20210323163715.GJ2356281@nvidia.com>
 <5824b731-ca6a-92fd-e314-d986b6a7b101@shipmail.org>
 <YFsM23t2niJwhpM/@phenom.ffwll.local>
 <20210324122430.GW2356281@nvidia.com>
 <e12e2c49-afaf-dbac-b18c-272c93c83e06@shipmail.org>
 <20210324124127.GY2356281@nvidia.com>
 <6c9acb90-8e91-d8af-7abd-e762d9a901aa@shipmail.org>
 <20210324134833.GE2356281@nvidia.com>
 <0b984f96-00fb-5410-bb16-02e12b2cc024@shipmail.org>
Content-Disposition: inline
In-Reply-To: <0b984f96-00fb-5410-bb16-02e12b2cc024@shipmail.org>
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: CH0PR04CA0112.namprd04.prod.outlook.com
 (2603:10b6:610:75::27) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH0PR04CA0112.namprd04.prod.outlook.com (2603:10b6:610:75::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3977.25 via Frontend Transport; Wed, 24 Mar 2021 16:38:13 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lP6WK-0024cG-6e; Wed, 24 Mar 2021 13:38:12 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bb4422af-cfb5-423b-a4da-08d8eee337b9
X-MS-TrafficTypeDiagnostic: DM6PR12MB3402:
X-Microsoft-Antispam-PRVS: <DM6PR12MB3402771B43E65E0A279B18AFC2639@DM6PR12MB3402.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wLZtLYndhfUbFPikQzNJMH9JvbVO9lDDO6sU7fJ6QPQvOIlknDa4W4/wOeAvSAerkfdEMek+4TO3OYaDc6mNGlvbXnYKnpkwQsscPNSFnd0/SWLJF7fOul075UEz+S4AKvh98QdJBSOlVNb9sBpanu/VSOpGnEfZ2bD8/IiXOPccTyfxxOX1UGiwCYwOn/vdZiueBb84cv5uWkWcim0AH8WVUMdkLtLT+rHU+ZVFPtERPCAJ7EwRmKeThMFZpRpKirlsP3DUspRgLEq72rYn1mLJCiKWF1AQc7faQeDt/Ks8kpLeEWbhnP5129E0KnuxA5sPq/Qrzjo79rScbY7/NbcsQuvPtFXFUGpuO112N4T2firKj0XHTvHZ0V/mlLrvi15r/HB4gsCdJV7UziKH5O4pB6y5DVHR85lJXq/DehMYaeJXjb+Xc7z0E8wb0RWkEIftBjdk8kQ4Qs8SLmOG20f/Ma74qT+9QVnqD0POkl6eDasyAb+cP+DSi4x/seyIQEc9PE8qtNoam4wv6UEb89rzeVVkYnc9zxt8LDMQp1R4nwSVH3ceCvd0vYEuVIGHl+SiFIGRAo8vFizxrzaK3E9qsNGib0StW5be6qsLoTfGFZwzQskQCQAJyt79XVvHib/JqMht+wr6A1ay6pmwxEeNpwO5+mzjxH+1imIW8s6GOn9jSUk1rxAhQ2l30EfG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(366004)(376002)(39860400002)(346002)(136003)(54906003)(86362001)(5660300002)(186003)(26005)(2906002)(4326008)(36756003)(83380400001)(478600001)(316002)(38100700001)(1076003)(8676002)(2616005)(9746002)(426003)(9786002)(66476007)(8936002)(33656002)(66556008)(53546011)(66946007)(6916009)(14583001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?Z1NrNHVFRmxscnFpTGg5alMwZ01LSU8wRW5wV0daWEc2NC9ta3R5bXBVaUU3?=
 =?utf-8?B?RVM5UysyeTZxVTFDbEZCUFdqNnVsc0pSSWdxamtTMUtuVjFWV1N2S05MMkpL?=
 =?utf-8?B?NHVrV2VEb1JBVDhkdzhEUHBTekRwSEl3N3UwU2Q5SllSWU5JUnRWWlFpVmtS?=
 =?utf-8?B?elhHZGxKYzlsRG1DV3VRUG5JLy9xRlorOGpnellEeDR5TDdWelRpNVgzekda?=
 =?utf-8?B?ZVFSVVFoOGFab3BFUmUwOXlDSnJmV050M0UzczdoZVdpem9sUFRCazB0WDR1?=
 =?utf-8?B?M0tPNWp6WHo5dmxLVHdIZUhYTnJhaHZiQk5Ob2g4dUZLclVHODUwQkZLcXNW?=
 =?utf-8?B?NWVzNTk1RHJBaUVZZHRId1RhN3RRVVp1VENwclJBc1hsQjl4anN0SzlqaGhW?=
 =?utf-8?B?NlRIMUE0MXV5SXByZmVzNkRBV3ZhZTczeTEwUHJKVERyT2hPWVZtTFlIejV4?=
 =?utf-8?B?QVRxd3p0bzk4MFA1TFFpMmYxN2lNSVpkTGkvTnI4UkpGdGY4ZGxTenI4eTJG?=
 =?utf-8?B?YTNUWkhYS1lsSWxlQjFhemswNnZhOHNEcUNwbWY0Um9tMG0yV3N4S1VyMk8w?=
 =?utf-8?B?WEVXWG85TmYzenVKQjIwcG1FQTFLSCthTHJwSkxXWVAyeVdVd3NMZFdhcU9n?=
 =?utf-8?B?UVc5SzlvSkdSMHBHZWhXMEtKUnYxU1grUlZkME1DWHRHMXQ5N1BydzFoS1d1?=
 =?utf-8?B?Nmc3RGQrZWVjbnJTUEFaRUlob0R6b0JBeVZhUVNTaUovR1JlQUlrVjl2SFl3?=
 =?utf-8?B?U2czdUlHbWFEdDhTMWt3VDlmTmxjS3U0NkJHaFF5ZElGcFRSb3ZRSVVKQ2tl?=
 =?utf-8?B?NzJlcHlZdExqK0ZFWkJnc0F6RTdPOVltZ2F2VE9GdXdHSEVFdjkrQm9ZN2Vp?=
 =?utf-8?B?aHk2a2FYQlQ3eGx1ZEQyVnZIT2R5ZHA3d2dyYm1NeWpwQkhpdTk5YkhXSG9Y?=
 =?utf-8?B?dUQ1ZVRTa3NDLzhGRy9UMTYwMkV2Wnk2RWoxMlJjUDRiY1pZY055Wm5tU0xr?=
 =?utf-8?B?Mnc4WEliQjV1RVNINFBXd3IyUG9WMU40VWt4VC9aVEZrQkpsWjhycW9NWTF3?=
 =?utf-8?B?SWJKWFk1ajRiMnlmaWVTRE1OREowT3NrejdzUlJJdDkvdmJCaGtGVkk4NkQv?=
 =?utf-8?B?bTZVbEJMUXd4WHdLU2M2aDA5R2M1citiWFhmVGpFVVlZZGZVWlFLNDhCc0xL?=
 =?utf-8?B?U2sxM2Npc3RMcDhQbkVoNFhUWGFtazhkMHdKdVFuOHFwdnFackdwZ3VTYURo?=
 =?utf-8?B?SDlGdlJ3Y2lOWWRibXRkTkNuSE96WE11ZUZKQ2U3djEyTk9DQytNd0VaSEcr?=
 =?utf-8?B?ODlMaXRGd1lTUXJRRGh4aWxSVTZnVjRubEpXNUMvUmRMa0hTVVhHbForM2hr?=
 =?utf-8?B?WmtldDUxNHpJZGU5RzVTU0JuSnN3L2RMdzhtZDdsMFlMMTlMZmNFTDVEZlh6?=
 =?utf-8?B?blNkb1Z3blRhVmNrb28zM3BtMHlHYzJvL2FNcDFtQkxIQ0ptdG1qYSt1STQ2?=
 =?utf-8?B?QW1yM2hPaERlMCs5blpxVWhlVGwwY0JxRVE4dDBCL3hmREswQ21Ra0E4Z2lE?=
 =?utf-8?B?WjEzMEZBWUlEeUkxY2VDbllmeWV0aG1DTVNRUWdmUXVVTXR3RDlZdFFqV3Jl?=
 =?utf-8?B?ZGhqN0pqekdlSUFHdGd3cEFuWGFseUFFd2JYZTZLZFgxVDJYcU1QU2ltbExQ?=
 =?utf-8?B?SXhzZDN1dDVNRFZDL3hRWTUxcjZCM2pFSk5YRHlXWmJCaGFNbHNpWXYyMStQ?=
 =?utf-8?Q?+LVpujs5/TLNOFZfQCEAn7uN62miR5QiezC23CI?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bb4422af-cfb5-423b-a4da-08d8eee337b9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 16:38:13.4894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+bV9ZaeUjZBO4Jfw3hY6kQp5N8f6hUVfRt+JPRWjZGMy0zwG4j4qMSwPr55g97L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3402
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXIgMjQsIDIwMjEgYXQgMDQ6NTA6MTRQTSArMDEwMCwgVGhvbWFzIEhlbGxzdHLD
tm0gKEludGVsKSB3cm90ZToKPiAKPiBPbiAzLzI0LzIxIDI6NDggUE0sIEphc29uIEd1bnRob3Jw
ZSB3cm90ZToKPiA+IE9uIFdlZCwgTWFyIDI0LCAyMDIxIGF0IDAyOjM1OjM4UE0gKzAxMDAsIFRo
b21hcyBIZWxsc3Ryw7ZtIChJbnRlbCkgd3JvdGU6Cj4gPiAKPiA+ID4gPiBJbiBhbiBpZGVhbCB3
b3JsZCB0aGUgY3JlYXRpb24vZGVzdHJ1Y3Rpb24gb2YgcGFnZSB0YWJsZSBsZXZlbHMgd291bGQK
PiA+ID4gPiBieSBkeW5hbWljIGF0IHRoaXMgcG9pbnQsIGxpa2UgVEhQLgo+ID4gPiBIbW0sIGJ1
dCBJJ20gbm90IHN1cmUgd2hhdCBwcm9ibGVtIHdlJ3JlIHRyeWluZyB0byBzb2x2ZSBieSBjaGFu
Z2luZyB0aGUKPiA+ID4gaW50ZXJmYWNlIGluIHRoaXMgd2F5Pwo+ID4gV2UgYXJlIHRyeWluZyB0
byBtYWtlIGEgc2Vuc2libGUgZHJpdmVyIEFQSSB0byBkZWFsIHdpdGggaHVnZSBwYWdlcy4KPiA+
ID4gQ3VycmVudGx5IGlmIHRoZSBjb3JlIHZtIHJlcXVlc3RzIGEgaHVnZSBwdWQsIHdlIGdpdmUg
aXQgb25lLCBhbmQgaWYgd2UKPiA+ID4gY2FuJ3Qgb3IgZG9uJ3Qgd2FudCB0byAoYmVjYXVzZSBv
ZiBkaXJ0eS10cmFja2luZywgZm9yIGV4YW1wbGUsIHdoaWNoIGlzCj4gPiA+IGFsd2F5cyBkb25l
IG9uIDRLIHBhZ2UtbGV2ZWwpIHdlIGp1c3QgcmV0dXJuIFZNX0ZBVUxUX0ZBTExCQUNLLCBhbmQg
dGhlCj4gPiA+IGZhdWx0IGlzIHJldHJpZWQgYXQgYSBsb3dlciBsZXZlbC4KPiA+IFdlbGwsIG15
IHRob3VnaHQgd291bGQgYmUgdG8gbW92ZSB0aGUgcHRlIHJlbGF0ZWQgc3R1ZmYgaW50bwo+ID4g
dm1mX2luc2VydF9yYW5nZSBpbnN0ZWFkIG9mIHJlY3Vyc2luZyBiYWNrIHZpYSBWTV9GQVVMVF9G
QUxMQkFDSy4KPiA+IAo+ID4gSSBkb24ndCBrbm93IGlmIHRoZSBsb2NraW5nIHdvcmtzIG91dCwg
YnV0IGl0IGZlZWxzIGNsZWFuZXIgdGhhdCB0aGUKPiA+IGRyaXZlciB0ZWxscyB0aGUgdm1mIGhv
dyBiaWcgYSBwYWdlIGl0IGNhbiBzdHVmZiBpbiwgbm90IHRoZSB2bQo+ID4gdGVsbGluZyB0aGUg
ZHJpdmVyIHRvIHN0dWZmIGluIGEgY2VydGFpbiBzaXplIHBhZ2Ugd2hpY2ggaXQgbWlnaHQgbm90
Cj4gPiB3YW50IHRvIGRvLgo+ID4gCj4gPiBTb21lIGRldmljZXMgd2FudCB0byB3b3JrIG9uIGEg
aW4tYmV0d2VlbiBwYWdlIHNpemUgbGlrZSA2NGsgc28gdGhleQo+ID4gY2FuJ3QgZm9ybSAyTSBw
YWdlcyBidXQgdGhleSBjYW4gc3R1ZmYgNjRrIG9mIDRLIHBhZ2VzIGluIGEgYmF0Y2ggb24KPiA+
IGV2ZXJ5IGZhdWx0Lgo+IAo+IEhtbSwgeWVzLCBidXQgd2Ugd291bGQgaW4gdGhhdCBjYXNlIGJl
IGxpbWl0ZWQgYW55d2F5IHRvIGluc2VydCByYW5nZXMKPiBzbWFsbGVyIHRoYW4gYW5kIGVxdWFs
IHRvIHRoZSBmYXVsdCBzaXplIHRvIGF2b2lkIGV4dGVuc2l2ZSBhbmQgcG9zc2libHkKPiB1bm5l
Y2Vzc2FyeSBjaGVja3MgZm9yIGNvbnRpZ291cyBtZW1vcnkuIAoKV2h5PyBUaGUgaW5zZXJ0IGZ1
bmN0aW9uIGlzIHdhbGtpbmcgdGhlIHBhZ2UgdGFibGVzLCBpdCBqdXN0IHVwZGF0ZXMKdGhpbmdz
IGFzIHRoZXkgYXJlLiBJdCBsZWFybnMgdGhlIGFycmFnZW1lbnQgZm9yIGZyZWUgd2hpbGUgZG9p
bmcgdGhlCndhbGsuCgpUaGUgZGV2aWNlIGhhcyB0byBhbHdheXMgcHJvdmlkZSBjb25zaXN0ZW50
IGRhdGEsIGlmIGl0IG92ZXJsYXBzIGludG8KcGFnZXMgdGhhdCBhcmUgYWxyZWFkeSBwb3B1bGF0
ZWQgdGhhdCBpcyBmaW5lIHNvIGxvbmcgYXMgaXQgaXNuJ3QKY2hhbmdpbmcgdGhlaXIgYWRkcmVz
c2VzLgoKPiBBbmQgdGhlbiBpZiB3ZSBjYW4ndCBzdXBwb3J0IHRoZSBmdWxsIGZhdWx0IHNpemUs
IHdlJ2QgbmVlZCB0bwo+IGVpdGhlciBwcmVzdW1lIGEgc2l6ZSBhbmQgYWxpZ25tZW50IG9mIHRo
ZSBuZXh0IGxldmVsIG9yIHNlYXJjaCBmb3IKPiBjb250aWdvdXMgbWVtb3J5IGluIGJvdGggZGly
ZWN0aW9ucyBhcm91bmQgdGhlIGZhdWx0IGFkZHJlc3MsCj4gcGVyaGFwcyB1bm5lY2Vzc2FyaWx5
IGFzIHdlbGwuCgpZb3UgZG9uJ3QgcmVhbGx5IG5lZWQgdG8gY2FyZSBhYm91dCBsZXZlbHMsIHRo
ZSBkZXZpY2Ugc2hvdWxkIGJlCmZhdWx0aW5nIGluIHRoZSBsYXJnZXN0IG1lbW9yeSByZWdpb25z
IGl0IGNhbiB3aXRoaW4gaXRzIGVmZmljaWVuY3kuCgpJZiBpdCB3b3JrcyBvbiA0TSBwYWdlcyB0
aGVuIGl0IHNob3VsZCBiZSBmYXVsdGluZyA0TSBwYWdlcy4gVGhlIHBhZ2UKc2l6ZSBvZiB0aGUg
dW5kZXJseWluZyBDUFUgZG9lc24ndCByZWFsbHkgbWF0dGVyIG11Y2ggb3RoZXIgdGhhbiBzb21l
CnR1bmluZyB0byBpbXBhY3QgaG93IHRoZSBkZXZpY2UncyBhbGxvY2F0b3Igd29ya3MuCgpKYXNv
bgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
