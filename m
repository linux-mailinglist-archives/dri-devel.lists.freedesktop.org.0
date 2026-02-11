Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4ILBHL11jGk6ogAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 13:27:41 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1FE81242F8
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 13:27:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F0A810E4C3;
	Wed, 11 Feb 2026 12:27:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="T9HbIiW+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010014.outbound.protection.outlook.com [52.101.61.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24D7010E189;
 Wed, 11 Feb 2026 12:27:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EXwVWd2dBMVw2SPhv+HVMvtqPEdWiwqCVNMxWRrO4QcFztlfghF4jgNb9PjZYXqXOAr755/4tdRQgsIZ0QhYbPBfpk3vFG4ofRx210HOtJc1ULqbqcKlhDnoshDnk4sW3nJktNh+6xkrPEVDqR4s6AQHxyAccXRYNxjbC/TkgsYDqwB+H3OIgplLfw+p/+TAORpSDwf4ofV8VaoB2VlLKGyWvwoCFqLYgAXHBHc4yEqcNyxjCThZS0XIQ85sJ7YHBvy0eSmvH6RS+2pJeV5UiZdJHmizkqvAlc9qCVV8K8xWs3XQ78yvirgGQqOmVA1+8bUWRT9mj1Jz3JZ1AtyHKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=E6lFLaEQUbR3+eecr7iojTykn8zFUKdTzM0ZUmhEQOo=;
 b=W2F5YXs5CFdehr9MZcOSnISz1RgaDp6FsCkNiQb0k2iLjJwg/NspfqJq8s4QcN0q1mbkkSSf3xlfis21habDFU6IHgwvQNiJ9a/FJ3FINTuLAPNDee3JNNW8qe1UlumMC0BbmxjJOGpRGjmJaklWsARKh0gjDhHW9MSNxi0L78evQHBlF+gpQqDD/YwOwlbimv4iMMw1Ne3buFionfyUPdlg0sq1r1fe6J5rzc+55GZD891slqMIvqfRMX+3rRGZlvginDExSJWyVBJn4AMNl0pI5bSW77DNMUu8BGYTB6AmiLM9YjDnnoaduzWVkyARQ8G8qLl7D9Bzkbz1oiVsMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=E6lFLaEQUbR3+eecr7iojTykn8zFUKdTzM0ZUmhEQOo=;
 b=T9HbIiW+eFLw3MGqpBRMZQc1nTeuELG7HwNTlN99zVsg0Yor3eCICLLyV0UOs5qcf346S+JANJAJd+vwBnwxd2re8IRTu2Y29HHvga3wgWoAmnOK3nEKUD5zQDNfxenA+R2BmI9lifkxWs9MQiC+pIjQabAoh3oG54KhUlrCh7M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4241.namprd12.prod.outlook.com (2603:10b6:a03:20c::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.20; Wed, 11 Feb
 2026 12:27:33 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9611.008; Wed, 11 Feb 2026
 12:27:33 +0000
Message-ID: <1db2ea6c-4a0b-4071-9918-5ba756d17a0c@amd.com>
Date: Wed, 11 Feb 2026 13:27:26 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/4] Add cold reset recovery method for critical errors
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com
Cc: andrealmeid@igalia.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 mripard@kernel.org, anshuman.gupta@intel.com, badal.nilawar@intel.com,
 riana.tauro@intel.com, karthik.poosa@intel.com, sk.anirban@intel.com,
 raag.jadav@intel.com
References: <20260211115946.2014051-6-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260211115946.2014051-6-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0252.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:10f::24) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4241:EE_
X-MS-Office365-Filtering-Correlation-Id: ead9696f-adcc-44d0-5467-08de6968ee35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?REs2SnBtanBZK1RjSmxNZTVwMkN0TTVIVThOSzdFOWd6Nlg3Q0dxenUwbWlP?=
 =?utf-8?B?c2cwWGNxYjlxL1JtT2QvR2dvZ2JzcW9NTXY5VXJLVk81M1BKNlF6QkpxSG1Z?=
 =?utf-8?B?MGhrTzZRNWptOExRZVlndE43YXJKeitTMjFDS1luRWxCSFN2MUozN1ZMc2hj?=
 =?utf-8?B?bTEzS3dOWjRTWXNHNVRoSkxEZTBoS1lBb2Jqd1dNWGlwQVY5dHFlem4vZkw4?=
 =?utf-8?B?Mk9GRmdXN0dOUWR5b2FQVkorYko4L0ZBVjljaFBJVmFGY3VLRG92cWJGNFNN?=
 =?utf-8?B?c3ZmMW5RWk1hcHBRbGZ0TVRBckpLWVhsMnBuQ0k5ZmJSYWMxcFI4YTVaQVhv?=
 =?utf-8?B?clZtYUZqVUZncC91bE9TZDFhWjllcDlWV3dUU2RKbGhwandnRkZnWURsY2pU?=
 =?utf-8?B?MmYyV3lBYitsTGxxdFRVKzIzUlZPODRRMjBpc3U3M2swYWNwb1BCeFAyWHd0?=
 =?utf-8?B?UXo0bHZjZUFoL3lkcHhFY0NkZUpRLytkVksxZjdZejNldGNrZHV5Nk5hTkNh?=
 =?utf-8?B?S0YxQjR4S01NUWNib1d4VVBjQmlOdlJyMm41QWtDcXdkS2xtbms2QStBdEps?=
 =?utf-8?B?UWo5R3dGTjFGeEtFYmtEVFVtZlU3S0VKY3NqVzl5NDRjYlliaWswSkwwTlJZ?=
 =?utf-8?B?bFhxell0ZVQ5N0RhbkU3aHFaYVpJM1dVNXJjZUlYbHBOVkxWY3RLVElza3hz?=
 =?utf-8?B?Z1NQcnIxeG4wQUZuZFFOZlJBbzJRczhRc2liRlhRQlFLeUFHL0twVUc2ZEMr?=
 =?utf-8?B?TUIwcE5OakdGY2N2bld6a1ViU0ErYk96UitCK0VqRmkwUXh2VTFJaSs3Mlov?=
 =?utf-8?B?dERjOUExZVJwNkFDTmFtOFhoRWhreUZxWU81YWFWQ0REZkN1cXBTSTE4S0pn?=
 =?utf-8?B?QTI2cVNLNW1SS3d6RTNTUFBEbTNhOWZHZ2V1ZE5EZXg3M0N5NjE4TGJuYkEw?=
 =?utf-8?B?VHlhcXFiOFdiMmt6d09PZXV6aWxhYmIxOVJ0aVMxaEpEc2ZiZGdOMWdSQ0hN?=
 =?utf-8?B?Qm9QaHQ3enlqMkxva0NhMU1MRDQ1RGhwaTRUbmVpUVRRM3dLRnRVVkoyTG9F?=
 =?utf-8?B?NkszSXVQUVc3WWhKQmVoeGlTU1ZNRVY5VU55YVMzcVM0dUlvSjRiQ3ZUcG1Y?=
 =?utf-8?B?UmxDSHRmVllDaHZDU3FDM1JFNk5OWS9acFJvMzRqL2ZaUkRWZ3BmWkwyK0Fx?=
 =?utf-8?B?NlhrL0JVNVF2NnhjWTFpTmNnSVhqUlNQa0dNVWN3QzNrUjEvbGYyOFJiZnhD?=
 =?utf-8?B?aWNuUk0xN3l2TDZlTG4zdXVrN0QxSll3UG5xSDNFTG52amJlNzFrS0FGZ21F?=
 =?utf-8?B?eFJOZUVzS08vNFU3MEZhSFY1K3cxZmxMbnE0U3Y3M0RXczNwd1JWYTFGTzN1?=
 =?utf-8?B?QVE5cjVpdEV1Ly84UDc3NmxWbG9pTGRoYWU5QkM3OE5zVnR2dG1kOU1WcmFP?=
 =?utf-8?B?QUFENURBRTFGeDMvSkUwbDFMaG5KUy9pTjN4aFU3aHExVWhXVzdNbk4wUzBr?=
 =?utf-8?B?QXkxckZBbjlNaUQzRmVCMVprZTA4THlBaWNzcG54WGJFdzlCNXcwMlE3VVky?=
 =?utf-8?B?blBzU285R1VncmRIRjJxbHVKRjRRblR4WjBYTDA1bUoyc3pjTG43REdJOWVa?=
 =?utf-8?B?a0QrRGRpMGswTEJmMTBrZ0dMdm9mUkg5bmdhNnl2dmx2V1dpZjYwVEFWMzVw?=
 =?utf-8?B?WVR1UklLbWZWOG1DNDcrdDRrenh0emh3N3FvSDhQQ3hmaE1jbm1jTnJWWVdY?=
 =?utf-8?B?czdhWWdIY2NpN3FjNkRNQ1dHd2RhbHRaNmJUQ1ExKzFMR0dwZys2N0JjUUkw?=
 =?utf-8?B?c25yazRsQVlLbXZsaVBYSVJRclBlV2Mxb3RBbllqTm80Q2c4M1U3WVdDVEkw?=
 =?utf-8?B?TkFTcitnQnFHUzhyNU5VQnNKcGYxaEpzSGt3ZmN0bG41SHF5Y0lUTjQ3TENx?=
 =?utf-8?B?eEl1KzFoV3FaU1gwSThRL1R3VkZFeGRmeUJ3SUxuZUVnNys3ZTUwamhRU2Zx?=
 =?utf-8?B?YjJlSWovTEI0UXVzVGdwYUdZcCtqd1hiY0VlY2o2R00yRDJiNDY2dlJRbWww?=
 =?utf-8?B?VlV4MjU3SmxtQW5uRUVRQWRoYkplVnowQ0lzbG45dlg1bUxyTjhjRjJKQUtG?=
 =?utf-8?Q?hRug=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cXZkWG5oclJ6VTM2cDB6VzBENXhGMkRoYnYzd25VSnpNOHU3bm9ZZHhXamlY?=
 =?utf-8?B?MnplNUphbmYvZS9kNXdyRzJJRkxRMDNkSHljOXNMbWcyMWJEK0ZScDBtbnF5?=
 =?utf-8?B?UXRlV25RMzFTU0hJcmwvUE5ZbmdlYlQvR2FTWGhFRWw3dnZ6QzRXcm92NHE0?=
 =?utf-8?B?bG04MjlmelczUmk4ZzFpb1VUMW1jTFpCTEFYMHlpUU1YMGxNNWcvSXdwUHFF?=
 =?utf-8?B?WWhxZWlvSkpUMXRQdGdFek5FN0x3Ty9HQkpDRWxUYUZCaVZFaCtoOVJyTEpy?=
 =?utf-8?B?dXJRVVdvUVBEKzgwSFFadXNGd3MxMjNTS1F1bGFhSEFuSVNleS80K0pwcVhK?=
 =?utf-8?B?S2Zsc0NNN29YYnBUQnVZNm94VmxZSlc1M29SazBMZXdmQkVRVjROQVRSQmdJ?=
 =?utf-8?B?UTZ6MUlXTG5md2REaXJuRUhlZXJmTnpVT1ZUWGxrNG8vbzRJOXNpREhnMURu?=
 =?utf-8?B?dm9naUw4b3pjWXhrZVR0djRNRWhJRk01ei9ZODh0WnQ5b3BCbEJBcTJYQktm?=
 =?utf-8?B?bTFJcTZUL0lmbUVadmNjOXlXKzR6K2ZYMU5KTk1kMGdlbkozTTY0cGxJcFJW?=
 =?utf-8?B?WmxFT25NZWJMTWFHZ3pvbzVqUGo2R0prdk10bzFDUnJnS1JEdk1NZHkvZWhi?=
 =?utf-8?B?RVU5cVQwck95Wk1sS042ZXowNnZnRnBTSnpLb095V0prSkRBZVNUWVVxZGhh?=
 =?utf-8?B?RWwyUzhSMGtqUkRZQjd2RDJ5UTZ4STg5VXFQM3hZNWN6Vk8rM1VRNUx4a3VY?=
 =?utf-8?B?T3NNak9zdEJZREZ6QzcwMVM3VkVIbThhZWVwOVBGUnVKY0YxVTlONjNHblRX?=
 =?utf-8?B?UXlPRVRneEJMaFVQZVNldzN5aEl3bnd2WElTcjRoWU1GcXYxVmVHODkzUHlm?=
 =?utf-8?B?YXhVY0JxbHZ1cC9jSG01WE1IQXgyekpNZ2U3YW9adEhOR2pleCtSSG5NNmlq?=
 =?utf-8?B?cWZXQmVaWjFVdXF0YVhQbVVSQmNJVUZwTWg0aVNrVWRuVnJ6YUxHUDQ1UFMw?=
 =?utf-8?B?a3ZXYzZuQk10Z3QzQWRmNm1mMnF5anNvQlFpejMwMDR6a1ZUUlRrQ1FUc09a?=
 =?utf-8?B?OUthYnVISlRUa1JHZSsrNUxFNzM1SWhOVDYwNWJrelhCWDBJaXY4ZVdaSTFu?=
 =?utf-8?B?ZXB1SDcvVmNZOFZ5a0FPeEtzWlJxOG1nWWgxUDcxWWF4WTlXcm9YazVKOG02?=
 =?utf-8?B?dG9venA3NlMzMTlQMWl1OEpSNm5RTlpMR2FvclFPSDRScVpaS3YwYVQ2TVFk?=
 =?utf-8?B?ZWpjeWNrZStrS1dKTEgxQngwb0xaRmlJVnhMbHVGay9ZRGc5dlo1SE1JZVli?=
 =?utf-8?B?VUpRc2RSYmhzWXdGbDRJdVlyTXZWUzZJYS9zTVVIaysvUVdGdmttNzZlQUg5?=
 =?utf-8?B?eHlZdFRpSEVNN0ZpV2EyT0FHRWxoR1J0eXQ1Z3QyL1ZJdE4zbGlzZmN3WUpx?=
 =?utf-8?B?NFNmQWRzUmxxbTBVNEdSQUEwMmw2Sm0yUWRHSStQWWVMK2lRQmU2ZXh6bi9P?=
 =?utf-8?B?UDJxTFBaTWd6TmF3S0xCVmZCVUhKbWlyeHAxU0JqSXh0TEUwZnAwYis3ajVE?=
 =?utf-8?B?OEZUbWZqTmtlSjhOekFMRnQydGxodVZmejBTSjVkZm1Gblg4MHZ2bW5XTnNC?=
 =?utf-8?B?dUhQREdRSm1pSitiRS9tNlNIWUttdHF2WnhYS1FVL2VQNzhsNURCcW11R2Iv?=
 =?utf-8?B?dENGS1pCVk1penEvQktuWVdwTnFXSlpEbU5OOXZKYzcyVkxhcGtIYklMVnM2?=
 =?utf-8?B?RzZZTVRmY1Bab0w5K1phd1d1RzcvbFR0K2JJZDRoY1Z2ZGc2d0Z2aGxyVktP?=
 =?utf-8?B?NHJ1OEp3M2xTUy9rclNVeHBTbHE1bkJFbEs0emkwaTlvVXpIWlZQRTkyaVp3?=
 =?utf-8?B?WWptamdaVTRKRHgzaURsUC9sRlExZmoxSHBsS0Vkd3QrVTVKRlNicU9BMUNY?=
 =?utf-8?B?djNhaUIrSUpkN1EyM2Q1MG1RNzVHVXVCckpIdEJRQWVzdXkzWldJaUd5NGl5?=
 =?utf-8?B?YVlrTDBhK29LeG9QMnlDSGRnU05QOFR1aEFvWCttc0NRSHp5ZXhjd2RQRjZt?=
 =?utf-8?B?cGNadkc2SkFDOGZRMzE4SDhJbmpiMjRoSC9ROXNJS0FBa3l5aGRGVlJDQ1JN?=
 =?utf-8?B?NkljY1Y3dm9CMnFBR29ScFN3N0dpM1Y2d2VYYnJlVm13S21tbzNjV2dCKy9k?=
 =?utf-8?B?WDkrQ0twREV2TVg1VHFoV09pR09abTVoRlRISzhLcHVZV1hZbXE1a3Q5WklH?=
 =?utf-8?B?SHZhL2p4TjFqSndJOTlybTVZUnN4VFViSThLR3U1NkF6TWhTbTdnRkhKMXRR?=
 =?utf-8?B?TDdpTGhWTVhDRXVpZnYvZEFyd0lFbWc0eGFyV0pXOEM2ekx2SG56UT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ead9696f-adcc-44d0-5467-08de6968ee35
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Feb 2026 12:27:32.9427 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a3vdeh6C0YKxrjzD7Ro07tRByG5Dh8RYvwPFtE+GKDoG+iBgnrMC59Exj0WYzioI
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4241
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	FREEMAIL_CC(0.00)[igalia.com,gmail.com,ffwll.ch,kernel.org,intel.com];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,amd.com:email,igalia.com:email];
	DKIM_TRACE(0.00)[amd.com:+]
X-Rspamd-Queue-Id: B1FE81242F8
X-Rspamd-Action: no action

On 2/11/26 12:59, Mallesh Koujalagi wrote:
> This RFC patch series introduces a new DRM wedge recovery method
> 'DRM_WEDGE_RECOVERY_COLD_RESET' for handling critical errors
> that cannot be recovered through existing software-based mechanisms.
> 
> Background
> ----------
> Current recovery methods (driver rebind, bus reset, FLR) are effective
> for most error scenarios. However, certain critical errors
> affect device-level persistent state that survives warm resets and
> software recovery attempts. These errors require complete device power
> cycling to restore functionality.

I don't think that this is a sufficient justification for making those changes.

Especially since the patch set doesn't seem to add any detection for those cases, but rather just exposes a debugfs file to trigger them.

So what is the actual technical background? In other words when is that necessary?

Regards,
Christian.

> 
> Proposed Solution
> -----------------
> This series adds DRM_WEDGE_RECOVERY_COLD_RESET (BIT(4)) as a new
> recovery method to the DRM wedging framework. When this method is set,
> it signals to userspace that only a complete device cold reset (power
> cycle) can restore normal operation.
> 
> Example uevent received:
>   SUBSYSTEM=drm
>   WEDGED=cold-reset
>   DEVPATH=/devices/.../drm/card0
> 
> Testing
> -------
> The debugfs interface allows testing the cold reset recovery path:
> 
>   echo 1 > /sys/kernel/debug/dri/N/trigger_critical_error
> 
> This triggers the critical error handler, wedges the device with
> cold reset method, and sends the appropriate uevent to userspace.
> 
> Cc: André Almeida <andrealmeid@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona.vetter@ffwll.ch>
> Cc: Maxime Ripard <mripard@kernel.org>
> 
> Mallesh Koujalagi (4):
>   drm: Add DRM_WEDGE_RECOVERY_COLD_RESET for critical error
>   drm/doc: Document DRM_WEDGE_RECOVERY_COLD_RESET recovery method
>   drm/xe: Add handler for critical errors which require cold-reset
>   drm/xe/debugfs: Add interface to trigger critical error handler
> 
>  Documentation/gpu/drm-uapi.rst   | 73 +++++++++++++++++++++++++++++++-
>  drivers/gpu/drm/drm_drv.c        |  2 +
>  drivers/gpu/drm/xe/xe_debugfs.c  | 38 +++++++++++++++++
>  drivers/gpu/drm/xe/xe_hw_error.c | 28 ++++++++++++
>  drivers/gpu/drm/xe/xe_hw_error.h |  1 +
>  include/drm/drm_device.h         |  1 +
>  6 files changed, 142 insertions(+), 1 deletion(-)
> 

