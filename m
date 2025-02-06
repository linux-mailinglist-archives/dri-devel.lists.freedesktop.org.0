Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5063FA2A653
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 11:54:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D85910E2F5;
	Thu,  6 Feb 2025 10:54:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="5bQdVR2a";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2044.outbound.protection.outlook.com [40.107.236.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB57D10E812
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 10:54:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nKmvNBkn+vZjOoLLjZxjEfbiL9XU3+RM7Uf2y+lzdSKhARxwnQgmtxxGQzYe+eugUqyz/koROmudcbWiaH9Wq94rtK6VtbZhITeISlhUevgkun1Md4elzAm9zvu+zAmxqLdSm9twlUO76U6B5KLRBfWQHtFGYOqfdigPe47SjOS5nHOY9mCl+04QZzUPjA87dZI9UFae/ftePgAIQbfS1sKptJRel8HofB8OZL7qWJlMH0akce+Sm+1V8Bc+/7Beun6ekygWqc+JRBuqdS2NNZQa5ULWoQthLVvoSdMbKahcs38BJ3GJx93V07Q6Kpp41qLmSgLPjFscxCz+KMRwHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qDmEize+iPjX0oe4Dl2kscfEcCTQCStWFk54mU3UMw0=;
 b=cGrScOZvfz7Tng1vhzHw9saLJBNVLMomuj2tRdyafkLzT/4p9GCo90tm9R/qGehTU6qvL7da4/DTX1wlazUZuck2uQdMxHsdx/qPCUAEFJf5dduxlkgLGkyqeWG5y+EHCUYiClNWUCOu7dbHwnadnX3gUfbffDo8AbCC090zULZaj2DUhQaTxchrbH8/Hh9kqNdcVSG4PmkawpA1PDtdbT4hnu8Jqq4RCVH/dQDMiJ/dFAKWQ0OCs4oec82CXRD0hrOjzo6PUcPEhBRga0NHpoMsB+GihRgcWlyIAmXEQbMCBjkUJI3ng/82BGauYhl5jmymkopSOQdbIw0DwBnXXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qDmEize+iPjX0oe4Dl2kscfEcCTQCStWFk54mU3UMw0=;
 b=5bQdVR2ahtVJ2VtsSgSuHBVSoRQV+mFicQzhHgRaT+3dPfamrfliC+kx26Du5qpoU5X0aY+WoJesW3Fl8rOSgokMo6vubHzzgiLP5GQhaOutnzC6/zRQccSdRCvmf5owUfVLn4Ce0RkXdAA5QNMmWQS6XQaRxu7G8Dmc5Fq2v4w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by CH3PR12MB8332.namprd12.prod.outlook.com (2603:10b6:610:131::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.13; Thu, 6 Feb
 2025 10:54:08 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941%4]) with mapi id 15.20.8422.010; Thu, 6 Feb 2025
 10:54:07 +0000
Message-ID: <7b0bf2d5-700a-4cc7-b410-a9b2e2083b5d@amd.com>
Date: Thu, 6 Feb 2025 18:53:55 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] drm/virtio: implement blob userptr resource object
To: Demi Marie Obenour <demi@invisiblethingslab.com>
References: <20241220100409.4007346-1-honglei1.huang@amd.com>
 <20241220100409.4007346-3-honglei1.huang@amd.com>
 <Z2WO2udH2zAEr6ln@phenom.ffwll.local>
 <2fb36b50-4de2-4060-a4b7-54d221db8647@gmail.com>
 <de8ade34-eb67-4bff-a1c9-27cb51798843@amd.com>
 <Z36wV07M8B_wgWPl@phenom.ffwll.local>
 <c42ae4f7-f5f4-4906-85aa-b049ed44d7e9@gmail.com> <Z5waZsddenagCYtl@itl-email>
Content-Language: en-US
From: "Huang, Honglei1" <Honglei1.Huang@amd.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>, Huang Rui
 <ray.huang@amd.com>, Stefano Stabellini <stefano.stabellini@amd.com>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 David Airlie <airlied@redhat.com>, dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Lingshan Zhu <Lingshan.Zhu@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Kernel KVM virtualization development <kvm@vger.kernel.org>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 =?UTF-8?Q?Marek_Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
In-Reply-To: <Z5waZsddenagCYtl@itl-email>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR02CA0071.apcprd02.prod.outlook.com
 (2603:1096:4:54::35) To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|CH3PR12MB8332:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da46d50-dafb-468f-68cd-08dd469c9462
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RlhQdWJTRWVkNEZVUjFwcHRVbUxlY1ZOM0JlRVQyWTVWSmEvOFdtZ3FlTDRD?=
 =?utf-8?B?L3l0cTVEcFZ3VWZsSzZyME9LRDhSRFF4WjNrSkN5WjZ3QnBKS01OeWUzY3Y5?=
 =?utf-8?B?MXFhZEVZMlBlZ0JBM3g3WmYyb2VVQ1FNTE5PSHBPSDJFcnJlZWk1ZnQ0b05H?=
 =?utf-8?B?S1ZYb1JrV1h1bDVEVVFUQTBpNUpWVjFzbVpXNjJ4TkVJYUZMdTJvSzVYSzVx?=
 =?utf-8?B?YnplTUFFVk0zQzFoK2xCelByN25rbTVqZHRWUFlCR2gvNXEvVGZoNU1xR1ow?=
 =?utf-8?B?YzRWSjQ5M3RBRVpxZmpMaStRYVhmRkhNSFlTOTN6dzNreVFMNW93UTdQQXVp?=
 =?utf-8?B?Z2oydldkQXVFWWZOdlhaaFZLOWp2bWh4MkZ4TFlYOWRFblljOGxIVFBHWmxm?=
 =?utf-8?B?Yy92b2VxZ2JIMnJHZ2tsR2RpYmgwRzFGbU52T0M5K280U2wxWEIyNXcrZldi?=
 =?utf-8?B?ajdNZDk1aGhhbmFKYVFLZUl2b1cvNitSaEhNME5zRkRZRnlJZVRJQlRkeUhL?=
 =?utf-8?B?VXpBc0ZiM25nZXBIZVlrK05iYUVDbWpkcGd2a2ZadnYzMk1SK2FvSzJxNWZ5?=
 =?utf-8?B?U3YzYTRyRHh4WG93MFFWaHFkbUllRGNQS0xnZWY3eTNXVjNZV01aS2hPZW8x?=
 =?utf-8?B?Q0RsekpuQi9mbGM2SkdDaXZ0YzlXZ2hqdTRuNStaaWY0MXBWTFBNYzhCWXhz?=
 =?utf-8?B?NFBGenJzUmZ4VUhaNnRjaGsvNGsra0lPcVBoS3JBcHFLZEprRStvOGpjQmo4?=
 =?utf-8?B?SXJzT3NML0VvTzNmdEtwekZQQTE0Z3VKamlwQ29ieDJVU2lWN2Y2bUxxZ0dn?=
 =?utf-8?B?SUVkOHlPeUdOa0dNajArd0NjZEdBQnpSZTlMbjNRbWhsWXZMQUt6SEc1SDMz?=
 =?utf-8?B?djA3ZGdvdGFSa1VyMFlCZmVBL3NmbkFieGJISDhMUkJqSG1sWkorZVNpdER3?=
 =?utf-8?B?RTdIRlFtalJRWWdTM1MrRktJVFpVRk1udzI4bEIrYWFYdGpzT1NVdm9TMmFZ?=
 =?utf-8?B?OHJGU2RuYms1M0tCcFIyWHNqcWxNQVFBb21rL2xLK1pPVnYxZUhFeElzZU9F?=
 =?utf-8?B?YmFHTVZrZi9iSHRvNDlKY0xyWHBRQkpESTdDRW53S28xUzZWTUp2VzBMMVkx?=
 =?utf-8?B?clRNeGUyLy96RkhwYWRUaDZLR0dLSmNQMERTc0N0NzYvbFl0TDlQVGJYN1Zn?=
 =?utf-8?B?dElZYUpQQkhxQk5xdjI2czE5Rk4zbFMralc0ajNYcmcwUlZleWNmOElBcmRz?=
 =?utf-8?B?aVlpVWd2aUNKT1ZUei85OEdXTXRRYUxJNVg3UFBsTmNOK1h4ZmNiUkJ6YWl3?=
 =?utf-8?B?Zk9paDZmeldyellGL2dlSHM4TUxRL1JsaWFRNGtER1U4bGt3STc5cytrVnAx?=
 =?utf-8?B?VFZ5U1pBTW1lVkJ0dVJtSWlFdnF6Z0dVcWJsVHFoVTdsRDgvanNZN3ljdllw?=
 =?utf-8?B?SG9TaVV5UHpPV0gwbkdua1JCR2ZZZUZGNnR1R2o3S05CcldDb3dvYWNHVFFp?=
 =?utf-8?B?ZkVMblI2azhPMnNaMk1zMVpHVkttZ1ZnVFNEYlFDOGIyQlR4ckFwQitkVERy?=
 =?utf-8?B?NzJSOFBkNmlsRXErR0ZPYnJLbzFXKytBaVNETUJVUnhmNSs5dDNmd1ZzU2sv?=
 =?utf-8?B?VlVSMTB0SkpFSUFGS1BFclE5ZGVzOFJEdTNaU1NDUFkxOTd4TkRqVmVjNlUx?=
 =?utf-8?B?MlVtaTQ4bWY2Z29JUXpVaXd6cmNTQ0pTTFhlWTZjR0U0Nitta0JtK2x3TUxi?=
 =?utf-8?B?TmI2S2EwRVpJWGM3V0pxbHlRVEFQUzRGTm9wUG8rNU1HeThJeDRRTytoaUZw?=
 =?utf-8?B?c1p6V3czejZsNERiU3p0ZWFCajhFcmt0V0ZDRHhZWU5oSngrc2NZUHB5ejJZ?=
 =?utf-8?Q?kUZPYAzqx77WJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3A0bFFLV2NROTF4dGVkazhtSDdBLzFaUHJRY1hiU1MzbW9vWGl4NGxZUDF2?=
 =?utf-8?B?RWFGSGwwMWlYbm1PejVqa3pkQjJlSnZobGZqdEdsU1dLNkI2UGdiZ3hYNjVv?=
 =?utf-8?B?bFpxeFRvQkkzTkZ5TGUxTVVhUEUvSHcvTVdmZVozRmU0SWQrYkxYcmZIUHcw?=
 =?utf-8?B?cUQ3M2tjeTRSUExiL25pa3dwS3RZL2UwNFdsK0ZFWUdLYTBNT0h6VmErUmds?=
 =?utf-8?B?YTM0c3M1UEJrZmhSZHVKUG1uNHh6eWc1R0JEQzE3WnErREZqNGVGbWVrZjA1?=
 =?utf-8?B?dFdObWw0QUhhMmdOWXZ4SkFaQ1Eycm9MTHhKeGh0R0cxYk0vR2pFOEFYaUcx?=
 =?utf-8?B?bkd6am1vek16VTZMYjJVbG5RQWNMMGpUS3czYXlnMk41WVZ4RHQ4dXRuZEly?=
 =?utf-8?B?clVKVklYVXNLTDc2SGU3VDZTdUU4NTZMTWNpcjZaYjdZNTZRazZTc2lMVmJM?=
 =?utf-8?B?U2pSWE93WmhrZksyVzh4TXpLcWNzMWRYaVVGem1ZRXZlUDdOMDYycERudDh5?=
 =?utf-8?B?VGFzaUVLbE9mUzZ4K1BWVGMzQnpyWW50ekRkVXJ0L3RYd2g3VTF2VUpvbG5z?=
 =?utf-8?B?MkR6QUgrdC9mcXRYTlpoRFA3cEFGajBzSEVXUGFDdW9ZdnB2QU5lQ0tKZ29P?=
 =?utf-8?B?VnYvdUkveExrR2hoNFRscXlwdURXdkt5NlRlMmJRR0I1dmw1UFA1YWRDUEVO?=
 =?utf-8?B?aEV2U0FXUVBKbkZVTGpLOHVidDdFK2k0aU9zREs3c2hwVnlDUEF3bTNpK3Y5?=
 =?utf-8?B?cnRna2V3dVNIaHpjQWVYTG9mZ0ZFK01YcU5TeFl6U290akI0UTMxVmxQMmM5?=
 =?utf-8?B?M1pLNFVpRUlSU0FYbUtIYVg1Y1F0OXQvaGVCSm9rRVpBaXd1WXliam1pTXFN?=
 =?utf-8?B?ekFOWXZEQWplNkxRODhIQkQyK0FSaWlhaDBkZHlVcUQ4NEZYNXBWL2VYN1dj?=
 =?utf-8?B?a2F4NDRyZFl6SkpRZUV4anNWcjc0MzVtdXVzRjVENTFqTklKbHJqd3Q1SHVx?=
 =?utf-8?B?U0VRdERVK2Q1TTBRTUdhd3FmWkkvajdTTlR4TDZPSkJoak5yNWdNektoVW1M?=
 =?utf-8?B?TUJkT1ZrN0pjVFF2WTBLQUxOMDYvYXJjemwvVFlITDBSeXdlOERGQUdvblVr?=
 =?utf-8?B?bWRtY3NiNFhQNzFuQWFOM2h5S3lwVkhvVkw4bnlsb1FJZDBwQ29zaVVpWTZx?=
 =?utf-8?B?VXBVRy9vc0FNZjY2azJGWUs2UFZkaVM1NUF4SG5nSndRZUlOTW5RV2N1NHVJ?=
 =?utf-8?B?d2V4UzVtU3R4bWRhdEtKOTNiMXluREEveXFoOVNrUmdSdG1zMW4vYnlDUGdL?=
 =?utf-8?B?YkttcWExUElzQUcyd2xFWWZ3MzgraG8rR2NCODVYUFlMbi9BSUVSYVRnNGNy?=
 =?utf-8?B?ajlrTzRXSWhVK3ZmQWl6Mks0dmhPY1ZJazNmdG5YalNWK2cyaEpoa2x1ZEhB?=
 =?utf-8?B?M2sxdCs1WWxIRVBGbi8xUnhiRWRTOFRrQUMxZnZpbk84b2hILzBRQmxzV21v?=
 =?utf-8?B?VXBIdktkZCtIZ1BMNEtPOUNmRDEvVkpsTkMra2xQTXZwSEMxbU50Z2twVmYx?=
 =?utf-8?B?TytOc3NDNVFyNWZDNVZmWmtiQ29Ca0ZWYzQ5d09xMmFkQ3MxSEVWWStOR0pt?=
 =?utf-8?B?WDlDYVNxN1UvMDhDZ1dOYlhUNlg1eEhmY3ZtckJ2QTNyTmtSVldiOEVCeDd1?=
 =?utf-8?B?ZkQ3RXgrTS81RldUSWJKang1STdVSVhFMUVJR3pZcDhROHVQTFdsZS9PeS81?=
 =?utf-8?B?RXg2RTg5czRBMWxWajAxcjZFK0tlZU9ZdGcrNW13b2NIeXQ3bG1hUVBJWmFo?=
 =?utf-8?B?eHZwNXh2VFNqRURSd0ZkczdJVFFZbFUrWnA1RTRvSHc0M1N3d2dmdHBjbG93?=
 =?utf-8?B?TVZNZzNraDZBd3Y3MjhORUdQNmFvWWhzSVBXTlM4UkQ0bkNoVjJJbUZDcWU3?=
 =?utf-8?B?NGUyMGZ5TkFxdVQ0K21IUTRadXVzdkJ2eXFTcmtmNDVRc2JWK3VNbVEzd2s1?=
 =?utf-8?B?WnlRV1RIRGVSU1VkUzJRYUhmRzMxOWprS0I2ZHhTRXNPZ0VFVWtZU3YzUTl6?=
 =?utf-8?B?c244WkR0ZktvUy9vTmE1cGs5RzNTaFhDd205TDhrcTJiSm5lNGNlTGRkeU5k?=
 =?utf-8?Q?6DZAT7+EjbTXi/SkEqsUs9yyl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da46d50-dafb-468f-68cd-08dd469c9462
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2025 10:54:07.8921 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zvce/j6+y4sf8kvv3mEx6CRxCqwtfeXLXlnzjyyd12WopDQwTlzukE7WKOehCnfsb4N3ghNv7Mq0nGUW+hyjyw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8332
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

On 2025/1/31 8:33, Demi Marie Obenour wrote:
> On Wed, Jan 29, 2025 at 03:54:59PM -0500, Demi Marie Obenour wrote:
>> On 1/8/25 12:05 PM, Simona Vetter wrote:
>>> On Fri, Dec 27, 2024 at 10:24:29AM +0800, Huang, Honglei1 wrote:
>>>>
>>>> On 2024/12/22 9:59, Demi Marie Obenour wrote:
>>>>> On 12/20/24 10:35 AM, Simona Vetter wrote:
>>>>>> On Fri, Dec 20, 2024 at 06:04:09PM +0800, Honglei Huang wrote:
>>>>>>> From: Honglei Huang <Honglei1.Huang@amd.com>
>>>>>>>
>>>>>>> A virtio-gpu userptr is based on HMM notifier.
>>>>>>> Used for let host access guest userspace memory and
>>>>>>> notice the change of userspace memory.
>>>>>>> This series patches are in very beginning state,
>>>>>>> User space are pinned currently to ensure the host
>>>>>>> device memory operations are correct.
>>>>>>> The free and unmap operations for userspace can be
>>>>>>> handled by MMU notifier this is a simple and basice
>>>>>>> SVM feature for this series patches.
>>>>>>> The physical PFNS update operations is splited into
>>>>>>> two OPs in here. The evicted memories won't be used
>>>>>>> anymore but remap into host again to achieve same
>>>>>>> effect with hmm_rang_fault.
>>>>>>
>>>>>> So in my opinion there are two ways to implement userptr that make sense:
>>>>>>
>>>>>> - pinned userptr with pin_user_pages(FOLL_LONGTERM). there is not mmu
>>>>>>     notifier
>>>>>>
>>>>>> - unpinnned userptr where you entirely rely on userptr and do not hold any
>>>>>>     page references or page pins at all, for full SVM integration. This
>>>>>>     should use hmm_range_fault ideally, since that's the version that
>>>>>>     doesn't ever grab any page reference pins.
>>>>>>
>>>>>> All the in-between variants are imo really bad hacks, whether they hold a
>>>>>> page reference or a temporary page pin (which seems to be what you're
>>>>>> doing here). In much older kernels there was some justification for them,
>>>>>> because strange stuff happened over fork(), but with FOLL_LONGTERM this is
>>>>>> now all sorted out. So there's really only fully pinned, or true svm left
>>>>>> as clean design choices imo.
>>>>>>
>>>>>> With that background, why does pin_user_pages(FOLL_LONGTERM) not work for
>>>>>> you?
>>>>>
>>>>> +1 on using FOLL_LONGTERM.  Fully dynamic memory management has a huge cost
>>>>> in complexity that pinning everything avoids.  Furthermore, this avoids the
>>>>> host having to take action in response to guest memory reclaim requests.
>>>>> This avoids additional complexity (and thus attack surface) on the host side.
>>>>> Furthermore, since this is for ROCm and not for graphics, I am less concerned
>>>>> about supporting systems that require swappable GPU VRAM.
>>>>
>>>> Hi Sima and Demi,
>>>>
>>>> I totally agree the flag FOLL_LONGTERM is needed, I will add it in next
>>>> version.
>>>>
>>>> And for the first pin variants implementation, the MMU notifier is also
>>>> needed I think.Cause the userptr feature in UMD generally used like this:
>>>> the registering of userptr always is explicitly invoked by user code like
>>>> "registerMemoryToGPU(userptrAddr, ...)", but for the userptr release/free,
>>>> there is no explicit API for it, at least in hsakmt/KFD stack. User just
>>>> need call system call "free(userptrAddr)", then kernel driver will release
>>>> the userptr by MMU notifier callback.Virtio-GPU has no other way to know if
>>>> user has been free the userptr except for MMU notifior.And in UMD theres is
>>>> no way to get the free() operation is invoked by user.The only way is use
>>>> MMU notifier in virtio-GPU driver and free the corresponding data in host by
>>>> some virtio CMDs as far as I can see.
>>>>
>>>> And for the second way that is use hmm_range_fault, there is a predictable
>>>> issues as far as I can see, at least in hsakmt/KFD stack. That is the memory
>>>> may migrate when GPU/device is working. In bare metal, when memory is
>>>> migrating KFD driver will pause the compute work of the device in
>>>> mmap_wirte_lock then use hmm_range_fault to remap the migrated/evicted
>>>> memories to GPU then restore the compute work of device to ensure the
>>>> correction of the data. But in virtio-GPU driver the migration happen in
>>>> guest kernel, the evict mmu notifier callback happens in guest, a virtio CMD
>>>> can be used for notify host but as lack of mmap_write_lock protection in
>>>> host kernel, host will hold invalid data for a short period of time, this
>>>> may lead to some issues. And it is hard to fix as far as I can see.
>>>>
>>>> I will extract some APIs into helper according to your request, and I will
>>>> refactor the whole userptr implementation, use some callbacks in page
>>>> getting path, let the pin method and hmm_range_fault can be choiced
>>>> in this series patches.
>>>
>>> Ok, so if this is for svm, then you need full blast hmm, or the semantics
>>> are buggy. You cannot fake svm with pin(FOLL_LONGTERM) userptr, this does
>>> not work.
>>>
>>> The other option is that hsakmt/kfd api is completely busted, and that's
>>> kinda not a kernel problem.
>>> -Sima
>>
>> On further thought, I believe the driver needs to migrate the pages to
>> device memory (really a virtio-GPU blob object) *and* take a FOLL_LONGTERM
>> pin on them.  The reason is that it isn’t possible to migrate these pages
>> back to "host" memory without unmapping them from the GPU.  For the reasons
>> I mention in [1], I believe that temporarily revoking access to virtio-GPU
>> blob objects is not feasible.  Instead, the pages must be treated as if
>> they are permanently in device memory until guest userspace unmaps them
>> from the GPU, after which they must be migrated back to host memory.
> 
> Discussion on IRC indicates that migration isn't reliable.  This is
> because Linux core memory management is largely lock-free for
> performance reasons, so there is no way to prevent temporary elevation
> of a page's reference count.  A page with an elevated reference count
> cannot be migrated.
> 
> The only alternative I can think of is for the hypervisor to perform the
> migration.  The hypervisor can revoke the guest's access to the page
> without the guest's consent or involvement.  The host can then replace
> the page with one of its own pages, which might be on the CPU or GPU.
> Further migration between the CPU and GPU is controlled by the host
> kernel-mode driver (KMD) and host kernel memory management.  The guest
> kernel driver must take a FOLL_LONGTERM pin before telling the host to
> use the pages, but that is all.
> 
> On KVM, this should be essentially automatic, as guest memory really is
> just host userspace memory.  On Xen, this requires that the backend
> domain can revoke fronted access to _any_ frontend page, or at least
> frontend pages that have been granted to the backend.  The backend will
> then need to be able to handle page faults for the frontend pages, and
> replace the frontend pages with its own pages at will.  Furthermore,
> revoking pages that the backend has installed into the frontend must
> never fail, because the backend will panic if it does fail.
> 
> Sima, is putting guest pages under host kernel control the only option?
> I thought that this could be avoided by leaving the pages on the CPU if
> migration fails, but that won't work because there will be no way to
> migrate them to the GPU later, causing performance problems that would
> be impossible to debug.  Is waiting (possibly forever) on migration to
> finish an option?  Otherwise, this might mean extra complexity in the
> Xen hypervisor, as I do not believe the primitives needed are currently
> available.  Specifically, in addition to the primitives discussed at Xen
> Project Summit 2024, the backend also needs to intercept access to, and
> replace the contents of, arbitrary frontend-controlled pages.

Hi Demi,

I agree that to achieve the complete SVM feature in virtio-GPU, it is 
necessary to have the hypervisor deeply involved and add new features.
It needs solid design, I saw the detailed reply in a another thread, it
is very helpful,looking forward to the response from the Xen/hypervisor 
experts.

So for the current virito-GPU userptr implementation, It can not support 
the full SVM feature, it just can only let GPU access the user space 
memory, maybe can be called by userptr feature. I think I will finish 
this small part firstly and then to try to complete the whole SVM feature.

Regards,
Honglei

