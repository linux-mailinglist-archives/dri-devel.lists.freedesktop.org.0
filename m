Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19C2BC6F293
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 15:11:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B86B410E630;
	Wed, 19 Nov 2025 14:11:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="TyL1hzZx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010055.outbound.protection.outlook.com [52.101.201.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB2CE10E630
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 14:11:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F55f5AYH4NG/3LbHstQFXHKWFs3ozrnIDcgKT3xTOOPlj4xhWzDok2Kl5BgSfO+dTP+ZgNzYCI0ye+trSnf+k7rIx1cT8LOd4V87dCtjVSusZbZnSMmf3Mth+b8PJEPy/PPXR2c7DhG3BIFDCtfxY0fmqEtpaQEsbxt5Ldcm0hf155BTlSYu9tzS6LzHnrgarnFpPFzN+t+qZeP6pTthFUywlb8EmrtRUwySpxHnK9s1UJmLQjCA6Edbi7SV1naZTWwWfV+Fh1N+Eu/LZXoo8B5XyP1mu/Dl/NkAQafz53I43Stsz27T4lmYEG5sZWqvgdo4JqpR7Ew6CPpb68D7lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eiZ7nRObJqE6TnwqLCHninvorZEilfjukWBmJU2XFGE=;
 b=PJrOTDC43W3aHeCLwqxfFJglWHTjW5GoZmMEzVKfi2iyEC+vxiSl5DAFes1XuT0stm3mGq8n62/5yjt1BpFfQmmLXAnRm0pRoxHfbnUUGgHPvTAqty+Zl6wnJIj5akKKbX+luEKJpCWr5S7Snw7bJi8tjzqbTY0/d0xWZSyUqzni7jPC7QYMCRAikW1EUVorEfj64jN1j2ExEatAJUWQ0Jg1egKdgt7iBS5TgHxLIe/lgBIPyoYmosVueHedT1xuinh+F1BOP3Doig9NkFgv0Owub3Eqfg2Of5ATgsNt61cD4zrgZJgp1Mjt5hxExnByNNTvtwbNzcN1g9tcC4ILFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eiZ7nRObJqE6TnwqLCHninvorZEilfjukWBmJU2XFGE=;
 b=TyL1hzZxR8pQz2ekj9YjTqHZKzo7wtXsRuv/RDdcxTphQzMcGX41ofmyJDXFigfhU8CvYGSs+CXkuNkP+co7OX658qv7ONW+5gNr/N6Dp8nHSzwBzFrFp2KBaxMqucRcarrwpbPQDKW2t3zhvui38o2Q8NwJRxLlqqZAYd5LR/g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4207.namprd12.prod.outlook.com (2603:10b6:208:1d9::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 14:11:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 14:11:09 +0000
Message-ID: <6714dc49-6b5c-4d58-9a43-95bb95873a97@amd.com>
Date: Wed, 19 Nov 2025 15:11:01 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [Linaro-mm-sig] [PATCH v8 06/11] dma-buf: provide phys_vec to
 scatter-gather mapping routine
To: Leon Romanovsky <leon@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Logan Gunthorpe
 <logang@deltatee.com>, Jens Axboe <axboe@kernel.dk>,
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Andrew Morton <akpm@linux-foundation.org>,
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>,
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Ankit Agrawal <ankita@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Shameer Kolothum <skolothumtho@nvidia.com>, Kevin Tian
 <kevin.tian@intel.com>, Alex Williamson <alex@shazbot.org>,
 Krishnakant Jaju <kjaju@nvidia.com>, Matt Ochs <mochs@nvidia.com>,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-block@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 kvm@vger.kernel.org, linux-hardening@vger.kernel.org,
 Alex Mastro <amastro@fb.com>, Nicolin Chen <nicolinc@nvidia.com>
References: <20251111-dmabuf-vfio-v8-0-fd9aa5df478f@nvidia.com>
 <20251111-dmabuf-vfio-v8-6-fd9aa5df478f@nvidia.com>
 <8a11b605-6ac7-48ac-8f27-22df7072e4ad@amd.com>
 <20251119134245.GD18335@unreal>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251119134245.GD18335@unreal>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0347.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f4::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4207:EE_
X-MS-Office365-Filtering-Correlation-Id: 34f31839-c545-406c-990a-08de27757d05
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGhoa1FYNVBKQzZMSGxoL2ZYVDdBcWpYOXpjMllXZXh4NWM2UWplS21FMlNJ?=
 =?utf-8?B?S25OT1IvZmp0Y1FjRlVKUG1SWmR5cEVuak9QdjhhRGkweUswa0lmQytvN0VP?=
 =?utf-8?B?UktKQzdnZGc5bFRvZjVtRS9YU3hON2JBeThYRWVtWFovLzAzZG0ya1krSkJD?=
 =?utf-8?B?aUlQM0x6TG42NFJmbHc1V2xUbCtTMnJMUXhOVlpwNUtGd2dZSjVvRFh1dU01?=
 =?utf-8?B?em5yQWNqSk5ZY1lnWFRpQ3dYamRmbEhiOFAwV2Y3cklITjY3YnpNaURUaFNL?=
 =?utf-8?B?YWQ1T2pHTGFnVnk2N01jY0cyMG9QUjZxVm9td0F4Yko0QWRJODkyclV1UHpB?=
 =?utf-8?B?RWkvYklVTlVXVWMyQTJKNHRWNXRxT3lTdk1LZzJpclk2bWJRRll2WG9mNThI?=
 =?utf-8?B?ME5XVDdpVTlLZ25FbEF3SjhLY2lBUlVkQm9NZ2RKN05EVmhqaTNYdFBUeW9z?=
 =?utf-8?B?UU9ORXVoU3ZrV2Qyc25oQkJTVE1VR0dnY3lZL2xVRWp2aVM1SEIvbUVmTEZa?=
 =?utf-8?B?U0poWXdPMDdlbXNGZ3pPTFZvWFByUFEzOXdJZDRRRTVSVjFVV2xNbmppWCty?=
 =?utf-8?B?U3NkQ1lSYlFpMUJJaEowUW9nQ2tpazZ1TjJJcUpKNis2SHMxNFVONFd6QVBB?=
 =?utf-8?B?RjIxL0JCSXpXanBIZTVRODM0VjFGdDR6T3hFZXNNd2Qxd1MzSXFYbFVmendo?=
 =?utf-8?B?WThZM3V3NmxWVDNtbldrRnpGY0lsQ0U4U3YrMmNrTm9yNks2Z3I5cUxQaGE4?=
 =?utf-8?B?UVM2UHE1SWZWeDVqUFFxeE1XMEV6WkVZOUEzOUFZWWR1aFA0dDh5cGYxUHdP?=
 =?utf-8?B?NjFPcTRmQ2VuUkJyNHdSejVkRkJqaXM5OGp5b0Z0dnhjNUNOam1DQ05XTGZm?=
 =?utf-8?B?dFdhMW5zdTE4bVRMajJNTlNmOEJLTDNVd0FaNDFMeVNiVENnYmVVVThVQUFw?=
 =?utf-8?B?STgrOXdPaU84Z1lUZWh3YlRHVFlxYW1EZEU4RWovVzlsbFVTcTBNdHhTUHhV?=
 =?utf-8?B?aVRyN2tnU0crUTNqZ0p4L00vSHJ3V21RY2ZmamZ5VWlDOFRxdytNdUNEVWxa?=
 =?utf-8?B?cW9kMk1LejZ5R1JIbWx5RmRBamJ4WlJMczJaU2hpbkNaYmdaYnlLYU84N2pk?=
 =?utf-8?B?WjMzL2dzQXBlT0hSb0dnOVBSV21iMDNzajhGWkxWT1lBYURwckt2N3d3SE03?=
 =?utf-8?B?czB4NlRSZlBzYVJmVyt2ODd5bDZmRk45ZTdXV25qQ3NHTllQZjVZR0NXKzgy?=
 =?utf-8?B?L1EyN1BONDkva2QvQm1XblMvOFVjNjlaUEoraE8rZVl1VUt4MnNnYnlWaEc5?=
 =?utf-8?B?NmxRQ3lnUGdMdDFmcWU0U3IxTG5vODlQallrRnExUjJ5bzYwejFwRk1Xb1JK?=
 =?utf-8?B?L09ybkFDMWtzMTBnZ1lPbXBRUE9tR240RUhQUWxxaG1ycmI1Y0QzbnNnZlJX?=
 =?utf-8?B?YzRHeDdlMTlWbEpKNk02NlBPSndtYlNZN2dwZUIwTU5jajZ0ejY3a2tGanNW?=
 =?utf-8?B?cFJHMHcyZ3R1UXMrd0kzdUh2Uk1xWmhIWWNRcGo0TkdhQ25NZUVVT1NOVWxu?=
 =?utf-8?B?UGxrZzlHWDJ1SkJpRDYxc0oyYU5aU3FacFl3ZmhZZFBpdlpML1hRMXFERS9L?=
 =?utf-8?B?SWRCbGhiNEVNd2xiZnlLSllmbVhhSXZaQ3hISmdyeWhXN29lZWVaSnJXa2Jo?=
 =?utf-8?B?RzVBaElvN0xlOWpIYU5WVW1IM3VhcGFIWjUvQ2w2WS80NXRSMEM4YUpndEVU?=
 =?utf-8?B?Q011MVhzd1lUSDNQbFIyVU5PdXg4MEozODIrSklEWVpuMTFaM21VTE1kdkJ1?=
 =?utf-8?B?WkN3VTZVVzVnOVhFTUxPMkRiKzNNdlB2TlVDTGFLOUlXYnIzTk5GM0VLaFZS?=
 =?utf-8?B?R2ZZMG5Yd1FrOXRFdkhNR0I5Mm1PU1lYWVF4TkE5TVFXK2VtWXN0QjNHQVFS?=
 =?utf-8?Q?V4EK/dR3Jg4NFGLNlA8WdzG55XFE6wrG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1Foc0crN0VLM2QxVlI2Wko4SmxOU2kyd1UyQVFvSU1hamlrbHVXVzEvOGhX?=
 =?utf-8?B?N3lFOUVqWk9QRmdBSVBoTnNCWkV3enpmK0lFcWJlRnJpMnRvUU9DM09MYTFu?=
 =?utf-8?B?Qm1ndGtTSXNsVUxjVUROSXZjL2NQajNtZk1VdGR3a0l3VklUSUwyeGVDcEho?=
 =?utf-8?B?d3FBVlhYTHNncCtzNTJibkQ1c2loTzFIUERiSDgwUDBtTzYydXV3UDRxTW9q?=
 =?utf-8?B?dTEyS3FwOFNUaEsvYkpXL1lVVHVzeVJmT2M3b2dpRzJiWnZWZVRpcFcxKy9t?=
 =?utf-8?B?Vjg0SnI1clVHL3puSnhabjNNQjZpREs4NmFKQlpaTlA3Z0hXWnhZTU5BK1Yx?=
 =?utf-8?B?Z210QmFFc04ybUVkQmQwTXZ1MzdpbHowR2poeDFXWWwyUUdoNkRtaUdwck9T?=
 =?utf-8?B?Szh5Y2I2Z3hLUGtQT3JPNjdjZHB1NXFSc1FtSTVtNlhoZ0NiSldlRjdzT0s1?=
 =?utf-8?B?YVFkbjVlWklYa1A0c3dyVmJiUnBkSzNCZzVTc2pIcEdDZnNjL2VxMXZOLyt2?=
 =?utf-8?B?NDJWVDY1TnJwR25xUmF0U2tTTW4wUisycmtaYzVsMHVBVHVrNTFJQlNBejhJ?=
 =?utf-8?B?UmtIYzVzMXEzZElzNDFuUlJXZW5NL2NGS2pUQVZaMUUwUjZ4amhXcyszUnF6?=
 =?utf-8?B?UWdFOWxtRUlSdWc3Q0MwUG9od2V4SWRPNkdNMkk2KytWZjA3ZjJjOU4rclRl?=
 =?utf-8?B?Sm1mZ1J2d3ErZjBaakpsNndiazJMenJjYTJGTVRCQ1VmZXVoRlE3d1d6aHkx?=
 =?utf-8?B?SUhhRVhSOGtaaGRTZ2pLRjNtRlRQQ1Z5WHcvaWNDMHBsU05sem12REt1QThM?=
 =?utf-8?B?ekllejZOL0NtdWlwdzE2UEV1VWdxRllldkNKRUVRL1V3UElhZkZlcVlwQlkv?=
 =?utf-8?B?R0lIWWlDb2c3dXlYQUUyTTB3RnZQRTVpL0ZOSk55RFZLS0pIVWlvTnlvUVRQ?=
 =?utf-8?B?VkxSQy8yQXRRQitNZGY3ZktQakI5TG9OOWV1cW8wSHVzQzhYZVYzYUFyM2o4?=
 =?utf-8?B?KzN2Rk8xTTVIb3l4blUxei9mQkpuM0tOUFBNRXl1M1h1Vkc3STJVMzAwYXM5?=
 =?utf-8?B?dW5MN2NpYXk4eGlZMDVWUjJLL1dWdzhpc1ZwbXNtNS9heW9qSGVoZXZKQmhQ?=
 =?utf-8?B?SGhRV0pJTzZLSGdyaWFpcS9yaTZLT1liK1oyREo3QWtVaGJ0UlNFelZta3NJ?=
 =?utf-8?B?WTQvbVY3V0tCMEFvaXgwQ1lERzlsNlNNMzIrN3FEa1FCYTJSYlBYYnlKZmVy?=
 =?utf-8?B?OUxTK2JRRHpheXBFQlEydEh6Qm1MWXN0U2Fsc0NqOU9razN3SUNvaTZRT054?=
 =?utf-8?B?VTNQK1dsMXkxZnBZZU5pd25UTkl5eW1jN0hvVXJ2QlUzd2lIT3pJRWpYdHZk?=
 =?utf-8?B?YXRSYVREQ1hSZUxYN2FaN1JuWEpBaWtQMmlwQVpUZlppV2doOUxMaHpaTFo4?=
 =?utf-8?B?RURJdzNseVdpVmZxM204Q29ROU5LR1BDc0ZWRUk0Mk4xN0cyUmtabElwRmJJ?=
 =?utf-8?B?MUtmVExCZEVCWko0M2gxNmUySkZzdG9CLzk1Q1JNbktzWVhOMW5McHJXSnJZ?=
 =?utf-8?B?YmhxVWZDWnRRdWZDa0Q3MW03ZE5oMzFyQTR6YmcrS1lST2FVSjlmNlE0SWZR?=
 =?utf-8?B?SXFlUDZBenh3ZlJuK0hwSFJwUS9nZlpwOTJyWkpRQk15WTRObWlwR0JIQXRw?=
 =?utf-8?B?VFJmQUFJaEQ0Z0ZXbWRXck5MT0w5NVd3ZTRZS1ZVdEtkOXAwalFwd2p6MGFU?=
 =?utf-8?B?cW90dmxZbVdJcml3ajlJbktTRDl6b29GWmVRV2F1YlRyZ29MNktQNWM0ekpI?=
 =?utf-8?B?ellrTlQrVVhtb1V6ZHhQQ3ovTjlpNXpXK2RTU1IwYWlhcDRGZFBUQ3RLWTBs?=
 =?utf-8?B?R3Z6eFp2aWFOWHJ4bXBmcVd2aytDUitTS2NUTE1XWTUzWmR4MjVocnpBeDMv?=
 =?utf-8?B?M0pvR2w5ajd5NmY0aytoTnN0MTNONEdsNG5xOWs0cGwvMlN4NzE2VjhEV3Rk?=
 =?utf-8?B?YlFYMUtxMVY1YzRhd0ZKYi9hQ2lPSGJyZjU1anQrSExmc1ozS0thZmZMSk53?=
 =?utf-8?B?Z3l0N0xPNytQaFhQMjhobEEyQ1lPTjJKa2lCVkNsbmlJQ3hxa1FnOEtyczZu?=
 =?utf-8?Q?lkSSC6ng0A9+FgRI/KEN6sL+O?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34f31839-c545-406c-990a-08de27757d05
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 14:11:09.8082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0+Jc8VIYaEUptvZ/s0we6G6ycFlJakE7MOow/P6fT0ceCp0WJt9qZ35haDcpD8St
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4207
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

On 11/19/25 14:42, Leon Romanovsky wrote:
> On Wed, Nov 19, 2025 at 02:16:57PM +0100, Christian König wrote:
>>
>>
>> On 11/11/25 10:57, Leon Romanovsky wrote:
>>> From: Leon Romanovsky <leonro@nvidia.com>
>>>
>>> Add dma_buf_map() and dma_buf_unmap() helpers to convert an array of
>>> MMIO physical address ranges into scatter-gather tables with proper
>>> DMA mapping.
>>>
>>> These common functions are a starting point and support any PCI
>>> drivers creating mappings from their BAR's MMIO addresses. VFIO is one
>>> case, as shortly will be RDMA. We can review existing DRM drivers to
>>> refactor them separately. We hope this will evolve into routines to
>>> help common DRM that include mixed CPU and MMIO mappings.
>>>
>>> Compared to the dma_map_resource() abuse this implementation handles
>>> the complicated PCI P2P scenarios properly, especially when an IOMMU
>>> is enabled:
>>>
>>>  - Direct bus address mapping without IOVA allocation for
>>>    PCI_P2PDMA_MAP_BUS_ADDR, using pci_p2pdma_bus_addr_map(). This
>>>    happens if the IOMMU is enabled but the PCIe switch ACS flags allow
>>>    transactions to avoid the host bridge.
>>>
>>>    Further, this handles the slightly obscure, case of MMIO with a
>>>    phys_addr_t that is different from the physical BAR programming
>>>    (bus offset). The phys_addr_t is converted to a dma_addr_t and
>>>    accommodates this effect. This enables certain real systems to
>>>    work, especially on ARM platforms.
>>>
>>>  - Mapping through host bridge with IOVA allocation and DMA_ATTR_MMIO
>>>    attribute for MMIO memory regions (PCI_P2PDMA_MAP_THRU_HOST_BRIDGE).
>>>    This happens when the IOMMU is enabled and the ACS flags are forcing
>>>    all traffic to the IOMMU - ie for virtualization systems.
>>>
>>>  - Cases where P2P is not supported through the host bridge/CPU. The
>>>    P2P subsystem is the proper place to detect this and block it.
>>>
>>> Helper functions fill_sg_entry() and calc_sg_nents() handle the
>>> scatter-gather table construction, splitting large regions into
>>> UINT_MAX-sized chunks to fit within sg->length field limits.
>>>
>>> Since the physical address based DMA API forbids use of the CPU list
>>> of the scatterlist this will produce a mangled scatterlist that has
>>> a fully zero-length and NULL'd CPU list. The list is 0 length,
>>> all the struct page pointers are NULL and zero sized. This is stronger
>>> and more robust than the existing mangle_sg_table() technique. It is
>>> a future project to migrate DMABUF as a subsystem away from using
>>> scatterlist for this data structure.
>>>
>>> Tested-by: Alex Mastro <amastro@fb.com>
>>> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
>>> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
>>> ---
>>>  drivers/dma-buf/dma-buf.c | 235 ++++++++++++++++++++++++++++++++++++++++++++++
>>>  include/linux/dma-buf.h   |  18 ++++
>>>  2 files changed, 253 insertions(+)
>>>
>>> diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
>>> index 2bcf9ceca997..cb55dff1dad5 100644
>>> --- a/drivers/dma-buf/dma-buf.c
>>> +++ b/drivers/dma-buf/dma-buf.c
>>> @@ -1254,6 +1254,241 @@ void dma_buf_unmap_attachment_unlocked(struct dma_buf_attachment *attach,
>>>  }
>>>  EXPORT_SYMBOL_NS_GPL(dma_buf_unmap_attachment_unlocked, "DMA_BUF");
>>>  
>>> +static struct scatterlist *fill_sg_entry(struct scatterlist *sgl, size_t length,
>>> +					 dma_addr_t addr)
>>> +{
>>> +	unsigned int len, nents;
>>> +	int i;
>>> +
>>> +	nents = DIV_ROUND_UP(length, UINT_MAX);
>>> +	for (i = 0; i < nents; i++) {
>>> +		len = min_t(size_t, length, UINT_MAX);
>>> +		length -= len;
>>> +		/*
>>> +		 * DMABUF abuses scatterlist to create a scatterlist
>>> +		 * that does not have any CPU list, only the DMA list.
>>> +		 * Always set the page related values to NULL to ensure
>>> +		 * importers can't use it. The phys_addr based DMA API
>>> +		 * does not require the CPU list for mapping or unmapping.
>>> +		 */
>>> +		sg_set_page(sgl, NULL, 0, 0);
>>> +		sg_dma_address(sgl) = addr + i * UINT_MAX;
>>> +		sg_dma_len(sgl) = len;
>>> +		sgl = sg_next(sgl);
>>> +	}
>>> +
>>> +	return sgl;
>>> +}
>>> +
>>> +static unsigned int calc_sg_nents(struct dma_iova_state *state,
>>> +				  struct dma_buf_phys_vec *phys_vec,
>>> +				  size_t nr_ranges, size_t size)
>>> +{
>>> +	unsigned int nents = 0;
>>> +	size_t i;
>>> +
>>> +	if (!state || !dma_use_iova(state)) {
>>> +		for (i = 0; i < nr_ranges; i++)
>>> +			nents += DIV_ROUND_UP(phys_vec[i].len, UINT_MAX);
>>> +	} else {
>>> +		/*
>>> +		 * In IOVA case, there is only one SG entry which spans
>>> +		 * for whole IOVA address space, but we need to make sure
>>> +		 * that it fits sg->length, maybe we need more.
>>> +		 */
>>> +		nents = DIV_ROUND_UP(size, UINT_MAX);
>>> +	}
>>> +
>>> +	return nents;
>>> +}
>>> +
>>> +/**
>>> + * struct dma_buf_dma - holds DMA mapping information
>>> + * @sgt:    Scatter-gather table
>>> + * @state:  DMA IOVA state relevant in IOMMU-based DMA
>>> + * @size:   Total size of DMA transfer
>>> + */
>>> +struct dma_buf_dma {
>>> +	struct sg_table sgt;
>>> +	struct dma_iova_state *state;
>>> +	size_t size;
>>> +};
>>> +
>>> +/**
>>> + * dma_buf_map - Returns the scatterlist table of the attachment from arrays
>>> + * of physical vectors. This funciton is intended for MMIO memory only.
>>> + * @attach:	[in]	attachment whose scatterlist is to be returned
>>> + * @provider:	[in]	p2pdma provider
>>> + * @phys_vec:	[in]	array of physical vectors
>>> + * @nr_ranges:	[in]	number of entries in phys_vec array
>>> + * @size:	[in]	total size of phys_vec
>>> + * @dir:	[in]	direction of DMA transfer
>>> + *
>>> + * Returns sg_table containing the scatterlist to be returned; returns ERR_PTR
>>> + * on error. May return -EINTR if it is interrupted by a signal.
>>> + *
>>> + * On success, the DMA addresses and lengths in the returned scatterlist are
>>> + * PAGE_SIZE aligned.
>>> + *
>>> + * A mapping must be unmapped by using dma_buf_unmap().
>>> + */
>>> +struct sg_table *dma_buf_map(struct dma_buf_attachment *attach,
>>
>> That is clearly not a good name for this function. We already have overloaded the term *mapping* with something completely different.
> 
> This function performs DMA mapping, so what name do you suggest instead of dma_buf_map()?

Something like dma_buf_phys_vec_to_sg_table(). I'm not good at naming either.

> 
>>
>>> +			     struct p2pdma_provider *provider,
>>> +			     struct dma_buf_phys_vec *phys_vec,
>>> +			     size_t nr_ranges, size_t size,
>>> +			     enum dma_data_direction dir)
>>> +{
>>> +	unsigned int nents, mapped_len = 0;
>>> +	struct dma_buf_dma *dma;
>>> +	struct scatterlist *sgl;
>>> +	dma_addr_t addr;
>>> +	size_t i;
>>> +	int ret;
>>> +
>>> +	dma_resv_assert_held(attach->dmabuf->resv);
>>> +
>>> +	if (WARN_ON(!attach || !attach->dmabuf || !provider))
>>> +		/* This function is supposed to work on MMIO memory only */
>>> +		return ERR_PTR(-EINVAL);
>>> +
>>> +	dma = kzalloc(sizeof(*dma), GFP_KERNEL);
>>> +	if (!dma)
>>> +		return ERR_PTR(-ENOMEM);
>>> +
>>> +	switch (pci_p2pdma_map_type(provider, attach->dev)) {
>>> +	case PCI_P2PDMA_MAP_BUS_ADDR:
>>> +		/*
>>> +		 * There is no need in IOVA at all for this flow.
>>> +		 */
>>> +		break;
>>> +	case PCI_P2PDMA_MAP_THRU_HOST_BRIDGE:
>>> +		dma->state = kzalloc(sizeof(*dma->state), GFP_KERNEL);
>>> +		if (!dma->state) {
>>> +			ret = -ENOMEM;
>>> +			goto err_free_dma;
>>> +		}
>>> +
>>> +		dma_iova_try_alloc(attach->dev, dma->state, 0, size);
>>
>> Oh, that is a clear no-go for the core DMA-buf code.
>>
>> It's intentionally up to the exporter how to create the DMA addresses the importer can work with.
> 
> I didn't fully understand the email either. The importer needs to
> configure DMA and it supports only MMIO addresses. Exporter controls it
> by asking for peer2peer.

I miss interpreted the call to pci_p2pdma_map_type() here in that now the DMA-buf code decides if transactions go over the root complex or not.

But the exporter can call pci_p2pdma_map_type() even before calling this function, so that looks fine to me.

Regards,
Christian.

> 
> Thanks

