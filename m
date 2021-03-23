Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7333460C5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 15:00:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379296E113;
	Tue, 23 Mar 2021 14:00:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2087.outbound.protection.outlook.com [40.107.93.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 400476E114
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 14:00:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JVJXkx7jgB0ja4yC4A4Ik4tOlmD5L8fBaBiJGNgXrPxw4gDsCYZ+IMwr5ee/PVUFLH8Y/52gqJpZRkz6t4+pN2n5ydOr4b7EY2AgZu8bFZvIurYnzgltZJGaGKWHM4w/UCKng7jOj2CeRAzNEyFiWq3bHNkA2R5ei5AjiqWwudsfj31lTZ9QmQwpy08398tZtHWmpDubkNK5001L/ZQuOgFgbs+PpM4X5pFftclDMQWuL6WLzUziVtnuBNQfZKjkNe8dPwAOksKvNlj/PFNzlWMzZrR9P6i9wT5PiOegDvTcK03XQeSy+hjg3+QqZMsbcWUX5woR6fqWR4cF71vdRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHycayn9ix6vUCMv1LnAgZz4RkGDoqE1skPzhC1JoHM=;
 b=cUXARedwwJCQ6saWtC2j9//f1DwFJXbTuppo1ZUIVkUD9alUygKG64Fv0Y5iHZUCAQ0GW0wCsT+AGRXXLJNjbpvd/wtifclnY/9+98+9LbPvuLSNLzD5fw7IyR5UoL2M28wFkLphk3D/olTwbBVk8a1+3am7XD5WYRuK/ltD8o4ZTsoFQiGOLDz5mo4DkoyXn820ytuslbEd2dAuNXpyh4sS0wzw23X4ytqabMCM+pdXzuEcNZ0+WUTMwteAgexvepTY+tyzb80CSp34a84wWyGt5r3440JNvDFziv3xAIZzH2Sf3JHixcEyJDCh3DCqy76RAMlWr8ileqAXc+A9Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHycayn9ix6vUCMv1LnAgZz4RkGDoqE1skPzhC1JoHM=;
 b=AJFePgLhGb+hoJ6m/IJMH4Nqh+EI1qBn4Y6VbSDTwVeU/vT7CNiPZZ+Xg8mPWoWLq3xWDmh/2HjezcJfIaG3ZrF7aCTIz/jdnHK6lsHF3hAYP5PY6ZZ7N1/yHH0Zw8Ve1ClRHQRNlRYH8hTclaBMofB9JA9T6V9chLq8pBeG+IWyIoNJjaaIhky8O8DirRRtXA5M2+Xg6wXem1GZr4nOgbxvzfxMCJGsB76R7qe+t8wCNiG66KlXK0njWcAos/QWBUuKOJcEPtVKzMsO+rTbdYVCj1yXG09okAuN+fMJieTfh2AqWr1+Dtw0DKN+FZJb13flI3TVz1iUWJRY7qB1jQ==
Authentication-Results: shipmail.org; dkim=none (message not signed)
 header.d=none;shipmail.org; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3116.namprd12.prod.outlook.com (2603:10b6:5:38::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 14:00:33 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 14:00:33 +0000
Date: Tue, 23 Mar 2021 11:00:30 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?B?SGVsbHN0csO2bSAoSW50ZWwp?= <thomas_os@shipmail.org>
Subject: Re: [RFC PATCH 2/2] mm,drm/ttm: Use VM_PFNMAP for TTM vmas
Message-ID: <20210323140030.GE2356281@nvidia.com>
References: <20210321184529.59006-1-thomas_os@shipmail.org>
 <20210321184529.59006-3-thomas_os@shipmail.org>
Content-Disposition: inline
In-Reply-To: <20210321184529.59006-3-thomas_os@shipmail.org>
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: BY3PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::17) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 BY3PR03CA0012.namprd03.prod.outlook.com (2603:10b6:a03:39a::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Tue, 23 Mar 2021 14:00:32 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lOhaA-001Wl7-7n; Tue, 23 Mar 2021 11:00:30 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7af1a308-2e62-4254-3e73-08d8ee04067d
X-MS-TrafficTypeDiagnostic: DM6PR12MB3116:
X-Microsoft-Antispam-PRVS: <DM6PR12MB311620F3A993021D00512461C2649@DM6PR12MB3116.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sunbpQdh1t3+nHq3Fcr45x/60D8C8GSx1zvJsBDNAwZTe663cPYvY7g9b55S2YeF5OarhRQZdsHPKV5OHRRZpXrFcywXLJi+BdpZxxQpl4SoGZjBITcpp5AUX2hE3yR7A0kJHpdP7eafHQLfXr9A4dQWaBIq475TLenVWZvseeaku71l6v+nqekVcmpypLOTSkobG10ui+4mz6da2v6LD0jKaseJ57aLE8HXW4buWW8OL00BDlNUDj86LNNiR+J/6OVMizum1Fc7cdcOX9NX817u0NgpFpuB3cG4RAljBArd3fNf4DfftsZkEt+UMgHRQ8/NiO+gZsCN3VqbT/qWglTYHqIKJCgIg41mJPO1s7N+hg6CLX4bI92ZIxL1IbFS4nAH1LDwkO9PsDso//aDVxMHl5UioPRbpU6IAkXysbKIDx4+jRsUqqbcjwX8tQ4nn58DhhKPAsXzkMEvVQ/CGCbTXKZ8fh0Odwiyay7ippePjsGKhhiOhvnJPxZ8jylnrXDmKT0lqJtZn/4X9hyXckeW8eHUoumbEiRaUz4U+txtz1rovFXIo9bbwls+WE9Pgjcp4O6vNpNDgiYZ/DiPCREN8HS6WJ5WhpEP0efuhkz4U/N/2pDw1DbfKgNuM+k1H8hMS7ea06m08tUDgQo+jF22lT8Dfj3X9MQFcRqPqQ0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(136003)(366004)(39860400002)(396003)(376002)(83380400001)(4326008)(2906002)(6916009)(66476007)(33656002)(426003)(66946007)(8676002)(8936002)(478600001)(2616005)(66556008)(54906003)(9746002)(38100700001)(26005)(186003)(86362001)(5660300002)(66574015)(1076003)(36756003)(316002)(9786002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?VTVKdElVRVVuNENCWFpaZHhlWERsUk9TZHg3VkJXSm5jdUQraEh4bG1KZGdF?=
 =?utf-8?B?UzVJRUdCUHM3bVZhdTdBbE5xNXY5dkNIQ1paVU9iYVFpUTBCaGpEanU5Uk5S?=
 =?utf-8?B?TE9WbkZsSUdrTVNaTlJORWxzQXUzcFJyVTF2TDRackFTU0tQenpGeEEyU3ps?=
 =?utf-8?B?MTVKUHhZUE5Cczh0RDJMMVFWOEc0ZWFEd0QyMHZPT0Ewd3FCQTBJU0syVi85?=
 =?utf-8?B?UkhqWGw5OEpaaU1TM1luYUhGR0xQbXVKVmEzYmZpMnVnUTR0RlFtNGJGZVlu?=
 =?utf-8?B?U1ZFakUzUVZCeEY0N2JZSUhUVlNmK0tZQXNJbjhLQUtVUmE3ZzVxbTBjMVJh?=
 =?utf-8?B?TUZpZ0RKOGJJc2x5dlBHL25zVGNaaFVMZERXbVNmVllYOVhMaWVWYnRvb1Y0?=
 =?utf-8?B?MDlvelA2cVVKdjNkdGlweGEramJyMVc3QWIzRWRPVVNZS1ZraVE4azllb0JY?=
 =?utf-8?B?cGRSYUJxdFZleGhHZFNaQnpzb3A2dDJJUmN4eStYYVVJWE9mQU1QN3FFMVF6?=
 =?utf-8?B?QjdBN05ZNytBdDhXZVlycFNWZXdoNmdEd2NPVlZreTdoNGFwbmNaT0ZJbnFv?=
 =?utf-8?B?Y09jNEsreitrWUFBY1FGZm4wUFBjbHA3YlJ2Q3Iwdmh3MTZ3Y3dBd01VVzNB?=
 =?utf-8?B?WmpjMmpndFZCWks5Q1BzcnMzVndOWXB6RWxxdTlhYmJiVlpnbkw1R0hIMzRU?=
 =?utf-8?B?TnFYOGFEdHY1QTJKblJObURMZlJGZGpDRi9IY3NYRjIwdnhIc3RGR0phQTBR?=
 =?utf-8?B?YmNqVHZrdWdIa2RsbEdSL2RxYkJXVTU4QVcwVmQ1OWpRREtOeEF4L2FxS2JT?=
 =?utf-8?B?NVhsMVJMRDR6WVdHSVJEclhKdTlhMDlNWkh1bjljcGxqNWp3QmdvZkNKMEc0?=
 =?utf-8?B?S2M1V0hub09yWkVvZWd2cDhvWHlhMDVjbEY4NzBPbjU5eWhmUUJLUXg2b1ZE?=
 =?utf-8?B?bEZwS3lndVlrY1B2MTV1b3dxbHJrb25kT2h3NkZLNlFlb1p5OUhycThqMGUz?=
 =?utf-8?B?NDBnaU1jbXkzaExaTys0dkgzK25WTkhRRS9oSWxVL2dWWlZWTFBHMnlCMGU5?=
 =?utf-8?B?cGh1OFRBVldaRklhVUFnVmI1UFIvWTNqVTI2Rm5vQVRvWHl1TW5rRlYwbmVT?=
 =?utf-8?B?RXpSdHZ2TFM2eGpUcC9VQVdmTmd2SjNITzF4RnJGdXkzOGV2NzhmQkZXeGRO?=
 =?utf-8?B?OUFSc3F4MHZCbzdvZWxQTWdBTTJRY2Z5VFRwa29EMCtyOWpxQWQvUEMrclFW?=
 =?utf-8?B?bENRTGN0MkVTL1JGOVJTd1ZtUkUyclZ5TnFpV2R6QzlSbUtYSDZmclZOVEFP?=
 =?utf-8?B?UFBrWnlFQnpucmhXZWNzNTVleVB5ZmpVNDA3eGlOa3hyamtURm16VGN1MkFn?=
 =?utf-8?B?QXVpOWsvVW93NGppZkhKbkMxTmxzdUZncDlWS01VUWRDdEVPU0s5ZG1xdXk2?=
 =?utf-8?B?MjNCRjBGYmJQT29kQmdQRVJoamZXajFZQm1WK1Y5ZkVBRnR3ckFrbFhzK1lv?=
 =?utf-8?B?SWM4U1ZEa3NRQk0rUXRpN2FKQzZjOXhuS1lDc2lYTG5BbU1mclEvcmsxSHZ0?=
 =?utf-8?B?ck5jWEtCSm9DNG04TzhUY25uWm1KQVhRVjJLNXZVazVMY09Ed1dmV0NvYmh5?=
 =?utf-8?B?akVkZlpZWWVuUWhvcTg5dWZsNnIzcnVCWVQ2cXJ6VDBFUE93NmxKWXl3Tmxy?=
 =?utf-8?B?ZjdPdUVraDV6NlRFeEM0cy9IQ2pTQVJNYXNCRmVFS2JSRTlOejFBa2FLeGVT?=
 =?utf-8?Q?tPYt1GgV0r+Hdqz7Oawwjwnq8rXyslJpEEmkhDD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7af1a308-2e62-4254-3e73-08d8ee04067d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 14:00:33.0645 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QLRmUBpe0rLKwJVHgUZvumkd9lKevPqQEyxSVA7aTFTKesNxLwVo1+zCHq5apG/Q
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3116
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

T24gU3VuLCBNYXIgMjEsIDIwMjEgYXQgMDc6NDU6MjlQTSArMDEwMCwgVGhvbWFzIEhlbGxzdHLD
tm0gKEludGVsKSB3cm90ZToKPiBUbyBibG9jayBmYXN0IGd1cCB3ZSBuZWVkIHRvIG1ha2Ugc3Vy
ZSBUVE0gcHRlcyBhcmUgYWx3YXlzIHNwZWNpYWwuCj4gV2l0aCBNSVhFRE1BUCB3ZSwgb24gYXJj
aGl0ZWN0dXJlcyB0aGF0IGRvbid0IHN1cHBvcnQgcHRlX3NwZWNpYWwsCj4gaW5zZXJ0IG5vcm1h
bCBwdGVzLCBidXQgT1RPSCBvbiB0aG9zZSBhcmNoaXRlY3R1cmVzLCBmYXN0IGlzIG5vdAo+IHN1
cHBvcnRlZC4KPiBBdCB0aGUgc2FtZSB0aW1lLCB0aGUgZnVuY3Rpb24gZG9jdW1lbnRhdGlvbiB0
byB2bV9ub3JtYWxfcGFnZSgpIHN1Z2dlc3RzCj4gdGhhdCBwdGVzIHBvaW50aW5nIHRvIHN5c3Rl
bSBtZW1vcnkgcGFnZXMgb2YgTUlYRURNQVAgdm1hcyBhcmUgYWx3YXlzCj4gbm9ybWFsLCBidXQg
dGhhdCBkb2Vzbid0IHNlZW0gY29uc2lzdGVudCB3aXRoIHdoYXQncyBpbXBsZW1lbnRlZCBpbgo+
IHZtZl9pbnNlcnRfbWl4ZWQoKS4gSSdtIHRodXMgbm90IGVudGlyZWx5IHN1cmUgdGhpcyBwYXRj
aCBpcyBhY3R1YWxseQo+IG5lZWRlZC4KPiAKPiBCdXQgdG8gbWFrZSBzdXJlIGFuZCB0byBhdm9p
ZCBhbHNvIG5vcm1hbCAobm9uLWZhc3QpIGd1cCwgbWFrZSBhbGwKPiBUVE0gdm1hcyBQRk5NQVAu
IFdpdGggUEZOTUFQIHdlIGNhbid0IGFsbG93IENPVyBtYXBwaW5ncwo+IGFueW1vcmUgc28gbWFr
ZSBpc19jb3dfbWFwcGluZygpIGF2YWlsYWJsZSBhbmQgdXNlIGl0IHRvIHJlamVjdAo+IENPVyBt
YXBwaWdzIGF0IG1tYXAgdGltZS4KPiAKPiBUaGVyZSB3YXMgcHJldmlvdXNseSBhIGNvbW1lbnQg
aW4gdGhlIGNvZGUgdGhhdCBXQyBtYXBwaW5ncyB0b2dldGhlcgo+IHdpdGggeDg2IFBBVCArIFBG
Tk1BUCB3YXMgYmFkIGZvciBwZXJmb3JtYW5jZS4gSG93ZXZlciBmcm9tIGxvb2tpbmcgYXQKPiB2
bWZfaW5zZXJ0X21peGVkKCkgaXQgbG9va3MgbGlrZSBpbiB0aGUgY3VycmVudCBjb2RlIFBGTk1B
UCBhbmQgTUlYRURNQVAKPiBhcmUgaGFuZGxlZCB0aGUgc2FtZSBmb3IgYXJjaGl0ZWN0dXJlcyB0
aGF0IHN1cHBvcnQgcHRlX3NwZWNpYWwuIFRoaXMKPiBtZWFucyB0aGVyZSBzaG91bGQgbm90IGJl
IGEgcGVyZm9ybWFuY2UgZGlmZmVyZW5jZSBhbnltb3JlLCBidXQgdGhpcwo+IG5lZWRzIHRvIGJl
IHZlcmlmaWVkLgo+IAo+IENjOiBDaHJpc3RpYW4gS29lbmlnIDxjaHJpc3RpYW4ua29lbmlnQGFt
ZC5jb20+Cj4gQ2M6IERhdmlkIEFpcmxpZSA8YWlybGllZEBsaW51eC5pZT4KPiBDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgo+IENjOiBBbmRyZXcgTW9ydG9uIDxha3BtQGxpbnV4
LWZvdW5kYXRpb24ub3JnPgo+IENjOiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BudmlkaWEuY29tPgo+
IENjOiBsaW51eC1tbUBrdmFjay5vcmcKPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IENjOiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnCj4gU2lnbmVkLW9mZi1ieTog
VGhvbWFzIEhlbGxzdHLDtm0gKEludGVsKSA8dGhvbWFzX29zQHNoaXBtYWlsLm9yZz4KPiAgZHJp
dmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0uYyB8IDIyICsrKysrKysrLS0tLS0tLS0tLS0tLS0K
PiAgaW5jbHVkZS9saW51eC9tbS5oICAgICAgICAgICAgICB8ICA1ICsrKysrCj4gIG1tL2ludGVy
bmFsLmggICAgICAgICAgICAgICAgICAgfCAgNSAtLS0tLQo+ICAzIGZpbGVzIGNoYW5nZWQsIDEz
IGluc2VydGlvbnMoKyksIDE5IGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vdHRtL3R0bV9ib192bS5jIGIvZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fYm9fdm0u
Ywo+IGluZGV4IDFjMzQ5ODM0ODBlNS4uNzA4YzZmYjliZTgxIDEwMDY0NAo+ICsrKyBiL2RyaXZl
cnMvZ3B1L2RybS90dG0vdHRtX2JvX3ZtLmMKPiBAQCAtMzcyLDEyICszNzIsNyBAQCB2bV9mYXVs
dF90IHR0bV9ib192bV9mYXVsdF9yZXNlcnZlZChzdHJ1Y3Qgdm1fZmF1bHQgKnZtZiwKPiAgCQkg
KiBhdCBhcmJpdHJhcnkgdGltZXMgd2hpbGUgdGhlIGRhdGEgaXMgbW1hcCdlZC4KPiAgCQkgKiBT
ZWUgdm1mX2luc2VydF9taXhlZF9wcm90KCkgZm9yIGEgZGlzY3Vzc2lvbi4KPiAgCQkgKi8KPiAt
CQlpZiAodm1hLT52bV9mbGFncyAmIFZNX01JWEVETUFQKQo+IC0JCQlyZXQgPSB2bWZfaW5zZXJ0
X21peGVkX3Byb3Qodm1hLCBhZGRyZXNzLAo+IC0JCQkJCQkgICAgX19wZm5fdG9fcGZuX3QocGZu
LCBQRk5fREVWKSwKPiAtCQkJCQkJICAgIHByb3QpOwo+IC0JCWVsc2UKPiAtCQkJcmV0ID0gdm1m
X2luc2VydF9wZm5fcHJvdCh2bWEsIGFkZHJlc3MsIHBmbiwgcHJvdCk7Cj4gKwkJcmV0ID0gdm1m
X2luc2VydF9wZm5fcHJvdCh2bWEsIGFkZHJlc3MsIHBmbiwgcHJvdCk7Cj4gIAo+ICAJCS8qIE5l
dmVyIGVycm9yIG9uIHByZWZhdWx0ZWQgUFRFcyAqLwo+ICAJCWlmICh1bmxpa2VseSgocmV0ICYg
Vk1fRkFVTFRfRVJST1IpKSkgewo+IEBAIC01NTUsMTggKzU1MCwxNCBAQCBzdGF0aWMgdm9pZCB0
dG1fYm9fbW1hcF92bWFfc2V0dXAoc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICpibywgc3RydWN0
IHZtX2FyZWFfcwo+ICAJICogTm90ZTogV2UncmUgdHJhbnNmZXJyaW5nIHRoZSBibyByZWZlcmVu
Y2UgdG8KPiAgCSAqIHZtYS0+dm1fcHJpdmF0ZV9kYXRhIGhlcmUuCj4gIAkgKi8KPiAtCj4gIAl2
bWEtPnZtX3ByaXZhdGVfZGF0YSA9IGJvOwo+ICAKPiAgCS8qCj4gLQkgKiBXZSdkIGxpa2UgdG8g
dXNlIFZNX1BGTk1BUCBvbiBzaGFyZWQgbWFwcGluZ3MsIHdoZXJlCj4gLQkgKiAodm1hLT52bV9m
bGFncyAmIFZNX1NIQVJFRCkgIT0gMCwgZm9yIHBlcmZvcm1hbmNlIHJlYXNvbnMsCj4gLQkgKiBi
dXQgZm9yIHNvbWUgcmVhc29uIFZNX1BGTk1BUCArIHg4NiBQQVQgKyB3cml0ZS1jb21iaW5lIGlz
IHZlcnkKPiAtCSAqIGJhZCBmb3IgcGVyZm9ybWFuY2UuIFVudGlsIHRoYXQgaGFzIGJlZW4gc29y
dGVkIG91dCwgdXNlCj4gLQkgKiBWTV9NSVhFRE1BUCBvbiBhbGwgbWFwcGluZ3MuIFNlZSBmcmVl
ZGVza3RvcC5vcmcgYnVnICM3NTcxOQo+ICsJICogUEZOTUFQIGZvcmNlcyB1cyB0byBibG9jayBD
T1cgbWFwcGluZ3MgaW4gbW1hcCgpLAo+ICsJICogYW5kIHdpdGggTUlYRURNQVAgd2Ugd291bGQg
aW5jb3JyZWN0bHkgYWxsb3cgZmFzdCBndXAKPiArCSAqIG9uIFRUTSBtZW1vcnkgb24gYXJjaGl0
ZWN0dXJlcyB0aGF0IGRvbid0IGhhdmUgcHRlX3NwZWNpYWwuCj4gIAkgKi8KPiAtCXZtYS0+dm1f
ZmxhZ3MgfD0gVk1fTUlYRURNQVA7Cj4gLQl2bWEtPnZtX2ZsYWdzIHw9IFZNX0lPIHwgVk1fRE9O
VEVYUEFORCB8IFZNX0RPTlREVU1QOwo+ICsJdm1hLT52bV9mbGFncyB8PSBWTV9QRk5NQVAgfCBW
TV9JTyB8IFZNX0RPTlRFWFBBTkQgfCBWTV9ET05URFVNUDsKPiAgfQo+ICAKPiAgaW50IHR0bV9i
b19tbWFwKHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKPiBA
QCAtNTc5LDYgKzU3MCw5IEBAIGludCB0dG1fYm9fbW1hcChzdHJ1Y3QgZmlsZSAqZmlscCwgc3Ry
dWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCj4gIAlpZiAodW5saWtlbHkodm1hLT52bV9wZ29mZiA8
IERSTV9GSUxFX1BBR0VfT0ZGU0VUX1NUQVJUKSkKPiAgCQlyZXR1cm4gLUVJTlZBTDsKPiAgCj4g
KwlpZiAodW5saWtlbHkoaXNfY293X21hcHBpbmcodm1hLT52bV9mbGFncykpKQo+ICsJCXJldHVy
biAtRUlOVkFMOwo+ICsKPiAgCWJvID0gdHRtX2JvX3ZtX2xvb2t1cChiZGV2LCB2bWEtPnZtX3Bn
b2ZmLCB2bWFfcGFnZXModm1hKSk7Cj4gIAlpZiAodW5saWtlbHkoIWJvKSkKPiAgCQlyZXR1cm4g
LUVJTlZBTDsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tbS5oIGIvaW5jbHVkZS9saW51
eC9tbS5oCj4gaW5kZXggNzdlNjRlM2VhYzgwLi5jNmViZjdmOWRkYmIgMTAwNjQ0Cj4gKysrIGIv
aW5jbHVkZS9saW51eC9tbS5oCj4gQEAgLTY4Niw2ICs2ODYsMTEgQEAgc3RhdGljIGlubGluZSBi
b29sIHZtYV9pc19hY2Nlc3NpYmxlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hKQo+ICAJcmV0
dXJuIHZtYS0+dm1fZmxhZ3MgJiBWTV9BQ0NFU1NfRkxBR1M7Cj4gIH0KPiAgCj4gK3N0YXRpYyBp
bmxpbmUgYm9vbCBpc19jb3dfbWFwcGluZyh2bV9mbGFnc190IGZsYWdzKQo+ICt7Cj4gKwlyZXR1
cm4gKGZsYWdzICYgKFZNX1NIQVJFRCB8IFZNX01BWVdSSVRFKSkgPT0gVk1fTUFZV1JJVEU7Cj4g
K30KCk1vc3QgZHJpdmVyIHBsYWNlcyBhcmUganVzdCBiYW5uaW5nIFZNX1NIQVJFRC4KCkkgc2Vl
IHlvdSBjb3BpZWQgdGhpcyBmcm9tIHJlbWFwX3Bmbl9yYW5nZSgpLCBidXQgdGhhdCBsb2dpYyBp
cyBzbwpzcGVjaWFsIEknbSBub3Qgc3VyZS4uCgpDYW4gdGhlIHVzZXIgbXByb3RlY3QgdGhlIHdy
aXRlIGJhY2sgb24gd2l0aCB0aGUgYWJvdmUgbG9naWM/IERvIHdlCm5lZWQgVk1fREVOWVdSSVRF
IHRvbz8KCkphc29uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bAo=
