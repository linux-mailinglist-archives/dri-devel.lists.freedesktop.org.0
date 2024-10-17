Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 265469A1881
	for <lists+dri-devel@lfdr.de>; Thu, 17 Oct 2024 04:15:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C87810E0B8;
	Thu, 17 Oct 2024 02:15:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="P3RwI4gw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D01B10E0B8;
 Thu, 17 Oct 2024 02:15:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FhvTixI6tTbj3diQkEj+TVavuqI7w9i2RdPcqyH6BElE3dTMHMEs2XAZL8FRR/E8nvOAU2/bRb4/xcR+o/JNaSPCiHxAm2BPlntfxHsMWK6CWDMhHCsW+T6sKwhccFq6NpQoatWkuXTvkok/nSt+l9IBK880UA1LyLKiRako9Ob9Oi4vCFD3ikFx0PaqoCw2c/Mvdw4DGgetrEahBTs2dHxdP/n5qwfviqR6XOXQRK5P4591witdznc3eNkvCnuaycVBI8mrIlsdfSRge3D8LH5jkey2MzxSExWw+BDQWo6s+MIKnLrXQc+EsLzjmF7q7QP+NB8Q6XKrbxtXOjbe1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dMFd31vBBspsR9sNwEExi/f6dOwIILweqVKtciplCVs=;
 b=ukn3uTdZDTUosl5Yw0BbeiaKTIQWCLDzxwzw5/4Cj2xzayM0w1rLOMqjzThF5fKJyMbFBBSkzgJ0lBdqnTA5xJMWKaTbTBXd7LBqc8q6reclDSefuayNwP1BTWcVEFJxiRGfgChsKbwze9nTrjq9AH/+RgqIPgC8PTZ54s8wR+z/+g8gyLhm1hEU5CRTmi9A49NW50hsSaQ+JemtxmlMFcuc7JM9WeE+hHGwjQyK9PRiGjbPXp6J43y3kTgXYOHMp5WP1JrHI7eMIpPKkWwGUQQYKJm4CEQ9c13G0uRrWW9uWGZtzUP6McFFh98DHP6zF0qnb0nOlCI/QwKf2DumvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dMFd31vBBspsR9sNwEExi/f6dOwIILweqVKtciplCVs=;
 b=P3RwI4gwuVkcyM6shEvmdCcRnpN5OArcyAzWU9d76VT3sK27+yyMUjbsPIGFllEUI5OkPfZ+ulPvxZb3tb5F7YKjs98Tlsnva67BC6F5JO9MONoGcr5LtUsx0iY6/xA9R6WWvGOVv1Oc7O+7HK9/ZnbJ9l1d50BPfttMqCo7bloDLjDtf3xiiJwZLQ8CSqxXwLIkNrAisz6eHA96ZgLAxZeQKPfrJbCp2eEMlor7BD+OeQXScmghve5ifOS34R1dVVYRNL+63dMcvUwh/wiXa07A0D2SNfbS5yPtuqHlaFeqUOqMuzRNg5CklkdqtXESr4xp0zvUTJeZW1JnIyNziw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DM4PR12MB5771.namprd12.prod.outlook.com (2603:10b6:8:62::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8048.27; Thu, 17 Oct 2024 02:15:35 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%3]) with mapi id 15.20.8069.016; Thu, 17 Oct 2024
 02:15:35 +0000
References: <20241015152348.3055360-1-ymaman@nvidia.com>
 <20241015152348.3055360-2-ymaman@nvidia.com>
 <87frow8wdk.fsf@nvdebian.thelocal> <20241016154555.GE4020792@ziepe.ca>
User-agent: mu4e 1.10.8; emacs 29.1
From: Alistair Popple <apopple@nvidia.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yonatan Maman <ymaman@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-mm@kvack.org, herbst@redhat.com, lyude@redhat.com, dakr@redhat.com,
 airlied@gmail.com, simona@ffwll.ch, leon@kernel.org, jglisse@redhat.com,
 akpm@linux-foundation.org, dri-devel@lists.freedesktop.org,
 bskeggs@nvidia.com, Gal Shalom <GalShalom@nvidia.com>
Subject: Re: [PATCH v1 1/4] mm/hmm: HMM API for P2P DMA to device zone pages
Date: Thu, 17 Oct 2024 12:58:48 +1100
In-reply-to: <20241016154555.GE4020792@ziepe.ca>
Message-ID: <878quno4os.fsf@nvdebian.thelocal>
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0035.ausprd01.prod.outlook.com
 (2603:10c6:10:eb::22) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DM4PR12MB5771:EE_
X-MS-Office365-Filtering-Correlation-Id: 37357d53-f312-42ca-30d8-08dcee5195d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pAjd/jFZDjG1e33QrDMwFG4Ywj7wnp8WP0SwAbGE7mFTlK4n9eKQ1QTRSE7V?=
 =?us-ascii?Q?9YOj7GFVE2mcDVeHn6ihiodPJyKRsLpx952i+Fom1Nlk1iUhpHhFNL3jUKn8?=
 =?us-ascii?Q?huW/cebSfGH5o1erjvp5dbpC5IWL1SmVrYmzb3B1N8IZ4XC+4hXARnAD0IgZ?=
 =?us-ascii?Q?LgUoScxSn7uSxCTEydFJ7Bd91WgtcNj/m+7+K082Gj8ljFtfvrkKAd1tbC7m?=
 =?us-ascii?Q?W925LGj69zXKrL6iHrmXzccZ+dMy58dwxrkUnsFEwdw4bQE1huUU7WHWIcRR?=
 =?us-ascii?Q?SXV/0PaU+HlmKpvy71zps7VnC/Y3TSCeB3gH5G6ngb9l2/yeNp/fwCIkVmM1?=
 =?us-ascii?Q?j5mQOnsF0cJA5dmgsSlUpD8Gf6HOSry976iyeCpK+DlMRMyqJ+XK+L9Igy0B?=
 =?us-ascii?Q?N+WDFfMcHkZ4mnWkeCADxT6vjur1pFy1wWDtJ7zA60ogEewjbU8MKpyaVi6V?=
 =?us-ascii?Q?f7qxfBb77+CgtkL/pMhH0COe3HOzni/UaWHI2o9V5PXAoQagxpldXft2R7Ek?=
 =?us-ascii?Q?2j7jTiFz8UZeLjCo5dXc9yr9oTvVa38EGvru36z6Ily8N6OsDPpwV23zHogO?=
 =?us-ascii?Q?olwegbuGPDBbcwoCKQvPXRJn7LhoZilg1jPLLuLdVJeCx6miDqRzbqgbGWdQ?=
 =?us-ascii?Q?TG8aac0KPwq1n8s2ng3pKWC6WvO5KZcVRLGxIBrHhAokEdm1RDXgMJdqOYYA?=
 =?us-ascii?Q?FXpIe2lQIDIEMbRX7ElTnSfpDAE1yo+7BEwdwqth+8AygFqoE/UInVgRFJa5?=
 =?us-ascii?Q?QvDP3S7nqxsNfhPJP0fWTY4VMKe+zK8+a0+GxRtnXrOFCKo45qderrPcjR9K?=
 =?us-ascii?Q?2/qKEJ+6LwQVXPg2G6dX4Ue19oT1Zna/DoZMkbHXY+tKpY0aWa9+cPkH0ZGz?=
 =?us-ascii?Q?RljDGgx8Qen40mMO5FIQ8qaIGd6r8wfFadR0tufAMG1KCQD48H3o2+idHJpU?=
 =?us-ascii?Q?rqypJW3cfaSTj0n/ILdvZ0680bzAL94sKDvudVlmSDRqVtfQeBX4T1x19XqR?=
 =?us-ascii?Q?NoQl2nOS/u/BKdrBj99Pjm6aVoyvJYQay3D7UM7kQzjPdGoy4oOdYxodxwHj?=
 =?us-ascii?Q?Z0BTH83ohKs2BMIRcl6v3RCYBSXrWilUTg9jIxuOfeyQSMn9Pv0lj6JNQguM?=
 =?us-ascii?Q?b9PAcYI1Z8apgffNXMMoGhFGjBUUbsHa4YY+I5EyD9SiHjx+kMZ1Zb16BXLu?=
 =?us-ascii?Q?YCZxY9Q8T34oamyS5Q7RvKJOH99l+gf6rypdVdI3abKsfoTiFiXJxBhZJ2MG?=
 =?us-ascii?Q?MSZicRJM8nDpsYEhTxxMPIPSzQcJ8c8mq2BIeue5cu+tW99zqRFTcfjEroF1?=
 =?us-ascii?Q?jHPXdaLLrDFmHdtWwpwU8a3r?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5EBrlgGUkXroaXAO+SAvggEaanKOKmLJq6dyOxeJVQspuFWyz662lkt8EPrH?=
 =?us-ascii?Q?bA0+A93ckcMDOkD4C/5uIuhWoTZYrm8CYOeOli5z3kNMKUhC+x6U+JE20Gut?=
 =?us-ascii?Q?sT2gQ2PaVGZvLMDHrZUr/DGwAAOxtW7FEwFt2aGm5B0aMdI6wyNU7ttt/v3r?=
 =?us-ascii?Q?tpsQMwmho9YpLHl7uTHCoLQussB1mB3rTCYoKR9m9xvPdeQRUrCTdAPIn1SI?=
 =?us-ascii?Q?xz7Ru8JtERrTZlpsAFQCjMalUYCGngnRWgZW7hwFQ09s1Hi6OFEY1G+enIhd?=
 =?us-ascii?Q?MomhpBK4jQITNxkp0jmt+mhCXhn/4TqbZr1ya+OTYZD98bybZXNv6zSzcytc?=
 =?us-ascii?Q?nUCw5VXEzOrjGsTFDCq6ck1tXsdmmzDxC1nxLb32nL3XwsmLgaC23z56GL+m?=
 =?us-ascii?Q?uth4G9i58XMGVZ7vkcxK/ZPaHDCs+qSQ4sSah6jBa0T0WDf2bAwblXvc8e9+?=
 =?us-ascii?Q?Cg8OlBCQY5ezQWj2jM2X5HF+sDax7pYlV0EVHbI3U0SedECFL5/623aMmQFA?=
 =?us-ascii?Q?35LwBSxRitXWdHn2I98TDz6Vo0Idlif4Xq+VkfxrsN2Jhnp+XpaAM5iviYoT?=
 =?us-ascii?Q?0E7WL72ppV03/u0we6LmYWfqnHz80S7dxoYksVo79BaqnmMYyR2POLHnxbP3?=
 =?us-ascii?Q?eaVvy7xhwTpv3/ArK0SuDwa6dFVovbqPpApWYInCR83HHhcniPSk71S0/o1j?=
 =?us-ascii?Q?OkOpfyHeiAKYehA3vHb4UTPY/bVQkWvnC9lQttZmladOCNnEnQZuEk5oEyZV?=
 =?us-ascii?Q?z+6KKfjXj26qmoubL0PX6gVL+PSw1cueK5UfmVn49yUvLZRzhRL3B1eG1qMz?=
 =?us-ascii?Q?XJv69h0+dueFuhZiss9E53KAxwlhrUvuhei0hE7gV9oapo5YU904gBHBy8uo?=
 =?us-ascii?Q?D6TKpgWSUeuANmqaZAXSaaNzLlOz2TZsnpKYXpWeUt3g5peEEV9CAbWu6CRs?=
 =?us-ascii?Q?gyL6OZTjZxb+AAS0k6BkJr+bMv/J+7ldQ8c9C7Q7zTMXlivKi/gWxO6u4R+z?=
 =?us-ascii?Q?t4Fd8fUOJYmZk/ofUYar+Y+Iq/x9zJdwAWNqHHRLGgKYK6mt8SJp7M7LrVmG?=
 =?us-ascii?Q?583O+bzpWb13KclmaN/O0um0/lgSGQA1BAaqmZMAeAB93UgpIoR7Vu/Brtc8?=
 =?us-ascii?Q?IXJNbg1NcyaWoFVXUK1B9dHIdt8RfRSudUg5hYF/H/eQJfmAwjMOCZucJm0h?=
 =?us-ascii?Q?qpAaUebZxZVi8mOEfky+2Fnmoz4wZH2oO3S7Z8F/APz/ZDnQGxm7gnaPsc5V?=
 =?us-ascii?Q?lKL0BJOGpgzFZmnBlXEz2wyCGSC3b5GAedxu3iWbabt4wIa2iaf6nBx3yCjk?=
 =?us-ascii?Q?rkmYFCMc7amW3HyN65enw79dsBGYh8tjqZVqwFT/o2dPl8VrofxYVimRdNu4?=
 =?us-ascii?Q?NGceo7f0/1TsxThW1XqVVE5xkO/yCulbuYbCAvsT1heqHdlgRyMFCCmcrYG0?=
 =?us-ascii?Q?ZKXA6E1AL10dzwG3nRny2yYTa6J2rrN8xHQ38AQIua51oNzHdiAvoxXD7UQO?=
 =?us-ascii?Q?Rnw8Q5dRS7jk93mELnIJhaxhAlNNQXc6B0cFhvvd2MKsqQ87YGA/gMMXS4R4?=
 =?us-ascii?Q?sO7Tol88Tv1ON2ngEnXJOQ1pG5BlwecWg/Txigp3?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37357d53-f312-42ca-30d8-08dcee5195d1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2024 02:15:35.4168 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 59fJaQF1+fjbVVoJ7HObGy/5uLRAwR4125z3mMoSONrYDr+oFgqHAk1GswO6RF2W5e9O7gAiPK5mizAFB2HQlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5771
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Jason Gunthorpe <jgg@ziepe.ca> writes:

> On Wed, Oct 16, 2024 at 04:10:53PM +1100, Alistair Popple wrote:
>> On that note how is the refcounting of the returned p2pdma page expected
>> to work? We don't want the driver calling hmm_range_fault() to be able
>> to pin the page with eg. get_page(), so the returned p2pdma page should
>> have a zero refcount to enforce that.
>
> I think that is just the rule for hmm stuff in general, don't touch
> the refcount.

Actually I think the rule should be don't look at the page at
all. hmm_range_fault() is about mirroring PTEs, no assumption should
even be made about the existence or otherwise of a struct page.

> We don't need to enforce, it we don't know what else the driver will
> want to use that P2P page for after all. It might stick it in a VMA
> for some unrelated reason.

And wouldn't that touch the refcount and therefore be wrong? How is the
driver which handed out the P2PDMA page meant to ensure it can
free/evict the underlying device private memory in this case? Normally
this would happen by migration, which would trigger an MMU notifier on
the virtual address. But if the P2PDMA page has been mapped into another
VMA how does it drop the reference on the P2PDMA page?

 - Alistair

> Jason

