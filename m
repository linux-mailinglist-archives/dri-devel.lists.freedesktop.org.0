Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A17DA12969
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2025 18:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7305C10E771;
	Wed, 15 Jan 2025 17:09:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="REm/Xuwu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6342010E771
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Jan 2025 17:09:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U8Z9ovHtlUW025PX9QeTLWg2a6SyJUx1h8AcnaLM6bVXqQ3O/asWQY8+eNUjNrBM92S2kkRn/OszpTmQw86xCJOYyNjoKqulSaKAuFy2Oq8Xuo6YrGDM5VTnKgBzP13TfKXOzYLLi53n4M9xJBvusim1h39eQp50xs4vvHvjHkda5YsTTlUZTjLV9Tvew1TKRu2iajwokar3DJnwt6QfKjJQ9nAjwswTE/kR67+Blpw8hSM1h87DeJBjiEO2WRDBYjW/EEVVQpNLgPDX5t259NuLZh9Nvx/1JGccRIddraCC3aMtmV19be+nJxXporAIdU/di/zvq/AXQ1SeJO6zCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GRV2I4g1XhjgIH1bALDay4cetipGa04+L4tY481nvfk=;
 b=ZnvzNrBX+GqvIyCG2ar+eB6E0ZuikTEPeh+cUynDM9oEa0SkxTGfdspDXvC1T0cNV2wMM9/pRIBDYRZ4rFH1zvJAuLDtBDqTq/4Wzx+8MljFWwi3HPf0nxcWeluBNeIpOCcFLDeu5nVMr2bwOkolbOrC6rMbbfATrqylaiFhQnobQ7mq6LJDPTccCum5YOe/R8XbU54bBmoSiA/Ag8wbdnjs08TjWNRNhEemR2RnJQdxLmSjHJC34lL6x4n5Os55LkUZPpHMbQSyihvqi8jyCnpjVp2yna7oqhQGKjSALJCjke6pMa8O2UZ+O4RQJtSVFggajN6afAdMD79pfHLR4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GRV2I4g1XhjgIH1bALDay4cetipGa04+L4tY481nvfk=;
 b=REm/XuwuHJQ5H/yX8p2Askz6auwHR1g/anGWM5uEkxH1KbyiddZsOtXYpqJnkvxTHF9qMCx9ro/NT+lam2hvTOCqA3tisl2DwUA46rXQ/PX0NLmX9qnwmnHrn3Ga3cOD0DGF90dcUk9+s2nCJ4nYDJfKT80UAmHMTma3f9HcWXd5iGjHYiKevTWgCghS17oO+UOV61lDLq32yf/9RlKfuW7l/16l6QynIfwjpkhCahC3C1a/baZtZFUlwUOPQ3ArwSBVvQpZvPz3svQTSivnejrMMxYXaNGFUgiOIaA+iGp+EKioF+//0zIBmM3WoEnsG+muJeF85BCLLLV1rU55eQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by DM4PR12MB5772.namprd12.prod.outlook.com (2603:10b6:8:63::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Wed, 15 Jan
 2025 17:09:43 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%5]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 17:09:43 +0000
Date: Wed, 15 Jan 2025 13:09:42 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>
Cc: Xu Yilun <yilun.xu@linux.intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
Message-ID: <20250115170942.GT5556@nvidia.com>
References: <20250110205454.GM5556@nvidia.com>
 <d213eee7-0501-4a63-9dfe-b431408c4c37@amd.com>
 <20250115133821.GO5556@nvidia.com>
 <f6c2524f-5ef5-4c2c-a464-a7b195e0bf6c@amd.com>
 <1afd5049-d1d4-4fd6-8259-e7a5454e6a1d@amd.com>
 <20250115141458.GP5556@nvidia.com>
 <c86cfee1-063a-4972-a343-ea0eff2141c9@amd.com>
 <86afb69a-79bd-4719-898e-c6c2e62103f7@amd.com>
 <20250115151056.GS5556@nvidia.com>
 <6f7a14aa-f607-45f9-9e15-759e26079dec@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6f7a14aa-f607-45f9-9e15-759e26079dec@amd.com>
X-ClientProxiedBy: BLAPR03CA0105.namprd03.prod.outlook.com
 (2603:10b6:208:32a::20) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|DM4PR12MB5772:EE_
X-MS-Office365-Filtering-Correlation-Id: d488f33d-ee94-433f-1306-08dd358767af
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bm0xZTcrQjZhZWk2UDZ4L0pVVjFMK2dsRnVObklnUmVGcnFRYkcrZHdTa3Na?=
 =?utf-8?B?anBqeVZyVmswaDBvS1o5MUtrdUd3NDlJbENhTkVoNGI2bmRQTEdnVFpCN3Ix?=
 =?utf-8?B?UWtwRndmRDd5MFcxOHgwL2RXSTZkZk02SUNscE9uTVJnclZkelpRZ0p5ekpy?=
 =?utf-8?B?RDNaMWNDU1VQaEtaTWtsaDJzSkRvQnNZbDFIUzljSmJmdEppMWNsblRxdm5F?=
 =?utf-8?B?QkFlUFNSQjZNeDFWck85TFhzdTVXcmV5K05DMXdxRmppYy92R1V6cXo4a0U5?=
 =?utf-8?B?NVl5eE1jK2ZQbUhKcllwdXl2UE9VbE5PUDN5N2Y3VE5CeU05RDZyVk1JbmFM?=
 =?utf-8?B?eVdKTGJsdVhzNnRRR0RJdEhxYUlJZnYveUJlMjZrUGh4eVpQeUJsVHhMeDRT?=
 =?utf-8?B?cE4zTXJQREg4WVFmamRoWkVneWwyYzlaWWdHUzdiQ2poazk2THdVMldTUUZk?=
 =?utf-8?B?TnZpS3huS0Y1WWZYUS81MU1Sd0htVTV4SWhKYzB2blJBNzNTNXVaV25kaS9T?=
 =?utf-8?B?RnFQNm9heDZzZm43Z3B0TENDSHBCOUJGd1NRNGhYZnBjSlVjWjJ6bUgxMFcy?=
 =?utf-8?B?RzJydTdGU0lXS0QvcVEyOXRnWWlodk45THZGcWYyKzJYMzBHV0Z0VURTY2xO?=
 =?utf-8?B?U0MxNXRYMjBlT2owaERNQTU5RUtCSlRCWG1Nd3p4WEFuNU4yUDBsVUkwd0s4?=
 =?utf-8?B?Qmc2U09UU05rRllKQXFycDY2eTlxWUVWcWlrNFRWSnJWbkV3Z25sbmI1SG9q?=
 =?utf-8?B?WWFkcSs3bUdwSTJvVlY4NndRZzNrUHZsWmRkNmhTQnZ0MXl0SDVYNlEzckZK?=
 =?utf-8?B?TEdZSVVmS0phdUJTN2NYRGFIaGNmNUxvb2NkVnAvZEFFU0lsMUd2NU9JdWJQ?=
 =?utf-8?B?enQ2KzMrQm0vWWtLc0U1RE40VzBQWjFNUzg1amNWS0h5cWdvTjVoMjh0YUFM?=
 =?utf-8?B?dTh2UWNkdjFrYjFhZXVZVURlY3VtTzNWTWJhUkZNbXc4Zm1PRCtaSERtRHY0?=
 =?utf-8?B?bUhPeThTTnE3KzNaUVUrWHhBTWJub3hlVU1ySjkzWmdsZWRIdFZpKzN1YkFZ?=
 =?utf-8?B?Qk9JcG5Cd1FacEFYUk5sQjk0dkowaE4rM2lLNmIvQXUyTVc1dk0vNHJjN2Zu?=
 =?utf-8?B?bDd0Z1RsSjhlTDZUY3ptazdsZFBpWVlwbUJ1NEY4Z2ZnZnp2Nk0xbGlkajcv?=
 =?utf-8?B?UWphSFFiamtFaFVvNEtXZm5kQWx4c1U4dVpDeFk0cVRBMVB2TFNDSHNMU2d1?=
 =?utf-8?B?c3AyMFVDQWlycWRHZHlPam9BUUFkZjlSWU9Remh4THVXcFM0N3VzS2VLOTFz?=
 =?utf-8?B?NHE1Z0NUZVFkUng1dUpDbFJzbGIxOTNTSGJ6clVCbURHWlFJL2E4OFQyeVJW?=
 =?utf-8?B?dWlOd2pDU3NhdmNzSnVTRms4dmxRZE5md01BQ2hMenFMcjk4WkVEd3ovaE5m?=
 =?utf-8?B?NGV4OHJ5VmcyS3h0VGZFeEdTeUUzeWxzb2JTaWthZWtITHg4YjYzOVFBcmd6?=
 =?utf-8?B?RklZMlNNakhQR0VYRCtLeGxuMDMyeGt6SWJNNHQ2R2x4aHhoUUJoMFZtcW9t?=
 =?utf-8?B?enhIRjcwdk9qUk5lYzh2M2hsSWw3OUs2MGxSU3UwL1QzVXArOWFHWERHb2Ji?=
 =?utf-8?B?VzI4NnNSb0JpUXZGdWkyN0lESkgvcHExemwxeXhLWEhmZFRiQmdONm9udGp6?=
 =?utf-8?B?bFFLelFmNjFRL1liOXF2QzUzcXgyVzJxYnNyMmxuQlNwZXI2dUtXZERCM3Ji?=
 =?utf-8?B?S1BtbmVaTjFyTjBuaE5rcWE5a2xqMFR3eS8zTW9wZVkzSm4zamhBMm1rSi8w?=
 =?utf-8?B?U256Q3BQQjFMZGlwTzJ6Q3hOVVJHaStIMU1BN3UvQVI4WHUrYVRpbEFqQXdC?=
 =?utf-8?Q?PnERupmBGdVIu?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WnNGdENscHhERytBY3RKUTJGeGhXcXEva1FDQ3dDU0ZvcVBldHRDbC9oeisw?=
 =?utf-8?B?VDJuemE1eVlrRi9pWE12cFhQWXduanBndVI4bjBLQmljc1hrM1cxYTVJd3cy?=
 =?utf-8?B?bERHZkxnR2pISXE2dEpHcnZ1VTJFeFVLbittVEJTQ2g1emg3MmFXRmxXaVl1?=
 =?utf-8?B?akVsci9VRy9VcmwyK0Exb29EQ2JaSGs1QmlEa3BjT0FLcGpIMXpmUGF6RXZs?=
 =?utf-8?B?Nmlqa000NkNFenAwVTRLRzJINXVpWkI4UW9SRVpVckY4T1VrTEtHYlNHWjlR?=
 =?utf-8?B?WXU0anlzNGxjZW1XRWxseHNiaTQ2OFlFc2JteHU2OGRFMkpadWZhQitpcEw3?=
 =?utf-8?B?M2Y1SGprQlBkRlIrTGFrbFRuOTJtbGxlRXg1TTVWZGM1MjluU1FITXNwZktW?=
 =?utf-8?B?V05QSGllUUdVRS9yWFJpQmJsMC9nS2tkZXJPVVp2QzZnYUROSU11UXlRdW9x?=
 =?utf-8?B?ZXMvRkJnUzNMTllOVFh1b1VVNnBoOWN3NGVkU3J0cVRzcEFhUTM5dEZuR09T?=
 =?utf-8?B?Z1FYc1V3R1FMaE9Kc0toK1QyWUlNaTgyVjAzamhVUHVRZ0VPMXRETUpVYTJK?=
 =?utf-8?B?K0phczJNRm1qd3IwS1NoSHptSFBCOS82aTM3L216eFBrOGdjSnRpOUFHa0dE?=
 =?utf-8?B?Y1hpb2w2YVFXSTRFS2R6QmhOR3kyQzFubUN6K25CWUVEb20yQnJIcDBjMlFw?=
 =?utf-8?B?dmhnaEVONGxpUlQzcUFYcDYzRnZIQ3dBVTJYUXhjckRQNklHR0ZMR0xJK1NM?=
 =?utf-8?B?Q25pbExaS0c1emp6NDNwdys0Q2tHckJRVk5seldESk5TaVBMdXN1MjFVSUNK?=
 =?utf-8?B?WHY3V3RtZ3pNb0x4NnFIZTJJb1Y1RWRLNDZWMFg5QmVQUG9PbEQvYWtGOHB1?=
 =?utf-8?B?T1plSyswL0p0ZWJYWUpVcjBOaXF6bFdnaE1jK1BHUi84RGlkK254YllTYTVq?=
 =?utf-8?B?Y05wN20rN1ErbEZVWmRvM1MrNTdjTkwvdDVVQzRoMU5oRUIvL2o3WXBaQjJa?=
 =?utf-8?B?elVabW4vNTdVSU44L05oZUp1bkFxV05IQ2Y1ejFCd2Z2Q1JvYTk0K09ZMkgz?=
 =?utf-8?B?ZXJQeFR5V0hveUc1N2FRMXJESVFzRWtXb3BIRGZOTDlHeWtyQndSMFZ3VEhQ?=
 =?utf-8?B?V1BQemVIejZlTnlBZHY5eTdZM0xGNHJCNGs5Q0VuTHU1NVF0aThHcXpCc0hs?=
 =?utf-8?B?bmtyNUpNM1phSWZPK2VLaFk2UTlRQ3lBWVozdmJkcHpTMGY1azhRdWJ2dXV2?=
 =?utf-8?B?N0lVVFNRTTBySldhaytWN3NYbkJTWmV0b1FiYVg0UkxNVUhRbEcyK2RVNEQy?=
 =?utf-8?B?V2xhRWpRaU9tbnRsamhmVGNNNVZjU3EvbFJRcmd2KzJjeGcyYlJJN2M5T09a?=
 =?utf-8?B?R09JbnBucmFkTGQ2YUFldlpBYmx6bWtGV0cyQ0NrS2E0eHQxeWw0Q1k5d2RX?=
 =?utf-8?B?TXluMHo3U1o2WUtvVUZqL1BudG1kSVpabzhDU1NQeFE5NDJhSnI4NDlNMEZR?=
 =?utf-8?B?RUg4NUF2WUxRKzB1c2JvdlZKZW14WUMyc3crZXZwdDM4TUNSNVpKMHBueTVq?=
 =?utf-8?B?ZW0vb3pOcmtzZURQN3pnK3YycDJFbTRac0VwcWJvMnozVUtLYUM3UW5MNk84?=
 =?utf-8?B?OStmOUJ1YktCQjFkb2dxTWVtTks3dkpuMkdENFFQMm01Z1dRTTVXSmhRcG5L?=
 =?utf-8?B?WFpGNW1BUitPSnl2VUJxSW1EQlpTK1IxMmdpODI1M3FmMlE5djNCWGpCSVJR?=
 =?utf-8?B?dSs0d3NZUEV0VXE1U0FITUJrL3lOOXJHYTBTTU1WN1B4ay9TOGozcHRvWUZG?=
 =?utf-8?B?bmU0d3ZIT3BCSm50K1NwZTlXSlRxMDVnL3hkbHlBUWlmT3I1bVYvaW1tZ3lX?=
 =?utf-8?B?elhiTmRMMDU2QlREUjJKK3JVWUF0M2x6QklVVHNYVVl3QTZKT2c0TDRUZ2xu?=
 =?utf-8?B?WG5HemVTSnh0Ump2RVF0U2tmaDc4LzV6dDUzdzdoVDUrbk5pUXpsaXhYUlEr?=
 =?utf-8?B?UHN2ZjJyN2xuR1pITGNOTkxRL1dlVEYxNERHM0t4NHhIUVhrU3VBaG83YmZG?=
 =?utf-8?B?OC96Ymw1dVlDbktBS1VWa0tQWG9lWTk0eEtmazBUb0VvcnJYbGpjekh2WDZW?=
 =?utf-8?Q?nPTg=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d488f33d-ee94-433f-1306-08dd358767af
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2025 17:09:43.4746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JkFaro6UDezef9l1tkLG98IAkTfqYueSAX8xAigpPkDR8IbVXSJwiUHTf8mWbtHz
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5772
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

On Wed, Jan 15, 2025 at 05:34:23PM +0100, Christian König wrote:
>    Granted, let me try to improve this.
>    Here is a real world example of one of the issues we ran into and why
>    CPU mappings of importers are redirected to the exporter.
>    We have a good bunch of different exporters who track the CPU mappings
>    of their backing store using address_space objects in one way or
>    another and then uses unmap_mapping_range() to invalidate those CPU
>    mappings.
>    But when importers get the PFNs of the backing store they can look
>    behind the curtain and directly insert this PFN into the CPU page
>    tables.
>    We had literally tons of cases like this where drivers developers cause
>    access after free issues because the importer created a CPU mappings on
>    their own without the exporter knowing about it.
>    This is just one example of what we ran into. Additional to that
>    basically the whole synchronization between drivers was overhauled as
>    well because we found that we can't trust importers to always do the
>    right thing.

But this, fundamentally, is importers creating attachments and then
*ignoring the lifetime rules of DMABUF*. If you created an attachment,
got a move and *ignored the move* because you put the PFN in your own
VMA, then you are not following the attachment lifetime rules!

To implement this safely the driver would need to use
unma_mapping_range() on the driver VMA inside the move callback, and
hook into the VMA fault callback to re-attach the dmabuf.

This is where I get into trouble with your argument. It is not that
the API has an issue, or that the rules of the API are not logical and
functional.

You are arguing that even a logical and functional API will be
mis-used by some people and that reviewers will not catch
it.

Honestly, I don't think that is consistent with the kernel philosophy.

We should do our best to make APIs that are had to mis-use, but if we
can't achieve that it doesn't mean we stop and give up on problems,
we go into the world of APIs that can be mis-used and we are supposed
to rely on the reviewer system to catch it.

>    You can already turn both a TEE allocated buffer as well as a memfd
>    into a DMA-buf. So basically TEE and memfd already provides different
>    interfaces which go beyond what DMA-buf does and allows.

>    In other words if you want to do things like direct I/O to block or
>    network devices you can mmap() your memfd and do this while at the same
>    time send your memfd as DMA-buf to your GPU, V4L or neural accelerator.
>    Would this be a way you could work with as well? 

I guess, but this still requires creating a dmabuf2 type thing with
very similar semantics and then shimming dmabuf2 to 1 for DRM consumers.

I don't see how it addresses your fundamental concern that the
semantics we want are an API that is too easy for drivers to abuse.

And being more functional and efficient we'd just see people wanting
to use dmabuf2 directly instead of bothering with 1.

>    separate file descriptor representing the private MMIO which iommufd
>    and KVM uses but you can turn it into a DMA-buf whenever you need to
>    give it to a DMA-buf importer?

Well, it would end up just being used everywhere. I think one person
wanted to use this with DRM drivers for some reason, but RDMA would
use the dmabuf2 directly because it will be much more efficient than
using scatterlist.

Honestly, I'd much rather extend dmabuf and see DRM institute some
rule that DRM drivers may not use XYZ parts of the improvement. Like
maybe we could use some symbol namespaces to really enforce it
eg. MODULE_IMPORT_NS(DMABUF_NOT_FOR_DRM_USAGE)

Some of the improvements we want like the revoke rules for lifetime
seem to be agreeable.

Block the API that gives you the non-scatterlist attachment. Only
VFIO/RDMA/kvm/iommufd will get to implement it.

> In this case Xu is exporting MMIO from VFIO and importing to KVM and
> iommufd.
> 
>    So basically a portion of a PCIe BAR is imported into iommufd?

And KVM. We need to get the CPU address into KVM and IOMMU page
tables. It must go through a private FD path and not a VMA because of
the CC rules about machine check I mentioned earlier. The private FD
must have a lifetime model to ensure we don't UAF the PCIe BAR memory.

Someone else had some use case where they wanted to put the VFIO MMIO
PCIe BAR into a DMABUF and ship it into a GPU driver for
somethingsomething virtualization but I didn't understand it.

>    Let's just say that both the ARM guys as well as the GPU people already
>    have some pretty "interesting" ways of doing digital rights management
>    and content protection.

Well, that is TEE stuff, TEE and CC are not the same thing, though
they have some high level conceptual overlap.

In a certain sense CC is a TEE that is built using KVM instead of the
TEE subsystem. Using KVM and integrating with the MM brings a whole
set of unique challenges that TEE got to avoid.. 

Jason
