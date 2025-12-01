Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F02EAC982DA
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 17:08:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F1EEE10E409;
	Mon,  1 Dec 2025 16:08:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1pOx1JuB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010010.outbound.protection.outlook.com [52.101.61.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D82610E409;
 Mon,  1 Dec 2025 16:08:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VQqBI4z9/Fqnm6Y0x2AOJ3lqbEPcPhDyG/VCxqPtvCQ/B+H+pjW+l1Z2zbAg309t6fmmFai0arGAgAYg6lT67/DR0DuzLBFDFmTlVQvK6PWJZRE2p44PqD0wrrwk2pS9M/ZCOAsygJaCe7C9wrPHeFWW1+Pe0zqxae+ddBDWF0piupcher3tLafYWE0/cWm2RmC78w3RWZyLwTRWixZ/UyZ+ckhH+EZ1a2e9JMrduw+7Pmvgm9vNZWDQTaBf9smtcrccmlqQTmQsdYLZH7fK26iqjwSNa0xcJ235uw/hu+YBwercSf1sIWxQZuhZEdAx9GdLXONMP5Qwj6BtwjsVGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DNQcfMPWK2u9QzNMBHGetnKo8pgbPYhwTKfEBnruC+A=;
 b=qLW3ovBtvrNzN1kptPe0ayotNs5ahCTJLZnyXzNxdbj0DEQxqhF2CRMo796nkhkfYGdxkXklAMn283u1Q7b5TW/KUuuAza62zfDY6h/4tYJJJypCMpX+dvgvA2ZlZrh+I8d4tDOrvJCCD1W9mILvqWeAbtnVF8Lafi0nlICW6xRCcW4N07v7dpXk4iLBhB5XVjMkL9z6qqYGOUkoIzYnoxIDBu/TJyLA2DK52uZ7KCx2IcqGboz0dZdmDvsW0kHZ7Fwj18YYl3l6N1u2emojszS0ohECUvbCZFJaDPB/YGuB9HgmXZPVcQJ1jrgfP6/pjEiQm+9mchTYXXe7XXm2Lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DNQcfMPWK2u9QzNMBHGetnKo8pgbPYhwTKfEBnruC+A=;
 b=1pOx1JuBmhlxhcVpnx0TrEWX1gEV5cvw35RRPUCKHPfAaMAhpMch6Rq331oe+HKbcewXwf2b7ONU1Gc6tupCkPJe/8Nh608EMJgEie2LivDd5h/3yR1df5r56qCYrouhaV848tKJEaZG6ZFEPLkDZbKTEAdpnn9XTltO9u82iyo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SA1PR12MB9491.namprd12.prod.outlook.com (2603:10b6:806:458::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 16:08:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.012; Mon, 1 Dec 2025
 16:08:18 +0000
Message-ID: <07cd6a0c-9975-48ef-bb2e-5e53a042888e@amd.com>
Date: Mon, 1 Dec 2025 17:08:10 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/8] dma-buf/dma-fence: Add dma_fence_check_and_signal()
To: phasta@kernel.org, Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-4-phasta@kernel.org>
 <80554ed2-4454-489b-873f-533d68c8d2ae@amd.com>
 <2a9c83b4a428bb3cc993499c39d0da01f9563278.camel@mailbox.org>
 <93a4f4e4-af7a-4c84-a7a2-5db785f2a5a8@amd.com>
 <247185f833edd075cd4aac8c39ac8ae5b5aabe07.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <247185f833edd075cd4aac8c39ac8ae5b5aabe07.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0375.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f8::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SA1PR12MB9491:EE_
X-MS-Office365-Filtering-Correlation-Id: e6f079be-d283-4258-3fd5-08de30f3d776
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UzNCaWZoOGdlaG1Oc2VOMk1KVU0zZG9idEZhSTk1SzlHRmltTjV1eEtxTDRB?=
 =?utf-8?B?eUo3MWVJaFlZcjN6SmpMNWNhZ1VKWjBNWHBIQzVNdldtTzFXaGdmUlk5RUg3?=
 =?utf-8?B?bmhIZGNKWWc4Y3B1akZMUHVUa1diRUJhYmhVdnY0Q0FFeGNibkFRcWZZNmpu?=
 =?utf-8?B?TmJBQm5OMVMxYXg5RXlCeHB5Zjc2REtLNjdrWW1KZlFnZEhFSXMvREdyMmdD?=
 =?utf-8?B?N0hoQzVzOVFoc1ZHZzk5U0RCTjRUcjBPTGZ5MFU3ZW9BMEcxR0N4Vnhsejls?=
 =?utf-8?B?WW9FZi9CRWxCZ203VUd6eWg3UHVId0hjOXdvaHlCamZSSFNhb3JENG1sZFpX?=
 =?utf-8?B?V3ZzRVU5OHY4WEpPckFiUzA4RTRNb2ZMQnF2a1NjVlJFNU4ySUwvMGoxVTVG?=
 =?utf-8?B?Q2h4THE3ZEFPclJ4cUpFM2t1c1lNRkdFelZrTU8wWGg3bTU0OVNtRk9kRHNR?=
 =?utf-8?B?amNYT2hBQ2wzZ0k1c1g4Sk1VVkk5VFUzZmNIYzI0cjRtK0RTd2ZScHZ1WTgz?=
 =?utf-8?B?MHFxcndyY1FqRDUwSHMzdUt6VTZaMy9YTmZqYmgvNURJTnlBekNOWUdzbHNp?=
 =?utf-8?B?YlFoUXYrdUFYekxVNGFOVWYzZnNkRXpXY044SW56MVB3emJSSmgwa0NxTTNp?=
 =?utf-8?B?cHlnYVpjaCs5ZitJZEhHZVdKLzJJTUZnUWY5L0RXN3c2TmRzVlpqSGVTZW1W?=
 =?utf-8?B?S0kyYnk5NWpCajY5VFBDc2QyV0doMkJSN3JXbTBlMkhkbExJUmdHdytiYnkr?=
 =?utf-8?B?Ri94VThNcjFtdXMyb2dSbG1MaUQrdCtib2pKbE5JczNpZ254OWoramEvUWg1?=
 =?utf-8?B?aTBDN21OMmdFMXFRQ05ndnBPNG5UZHh1UUNvQ2llQnpoUWd0QzcrQVZLT1JH?=
 =?utf-8?B?VmxsV253ZmRNWmdPTGVIdGYzS1lhV0pEZFkyMWNkMVMxN0kyTXRXWnkxbU5k?=
 =?utf-8?B?N2YvZVpRWVdxL20zRTNIaTdQUGtIU2JPRHJ3VDBZSEFQb29McVRIeExIK1Jz?=
 =?utf-8?B?ZWJheSt3YjR5M2ZFaitBUkwzelVBaEM4SlZnU2pQVU1aekdsT2Rtb2hZTTFa?=
 =?utf-8?B?b3Uxa2kydDVRNE4wSDBsVDV6emlYajQwQ2NQSkFzYWIybkF6MElVMWZjRWti?=
 =?utf-8?B?VFJmQklRMEg5QktBMFN6OXhxV3BHL0pJb3dpZVlOZFp3Ny9zNnlqQUxCbGp4?=
 =?utf-8?B?L0VhVnB5QW1PMDN2cXMrMFBFYStqOXoxMTMzbmxCSGhHR3NnRDRoRHJHODhR?=
 =?utf-8?B?c01rRi80b3NEWlVvaGNHWFJYcG1FbWQrRSs2Vm9iY09ZTlFOVHJkalcrb2pQ?=
 =?utf-8?B?eDF6Q1NKM2dsTUlESmdjUjluMGFVTlRsTEpxbkdMOU5uSEoyd2VyaEd1UDVD?=
 =?utf-8?B?SVVyMUViek52cDRkcytISms4VFh3M1ZRTW9rT0c1MFV6UjhFZGJNZlZ1Zlkz?=
 =?utf-8?B?M1pXQzdIL1BZZGcrbzJQak9NMHhRZml3WDhRd2pBRU5UaSt3a2xwbFhYbHNo?=
 =?utf-8?B?VU94V1gzd2dMbi84ZzVGQ29jT05Fd2ZqeU1oSEVUVmlDRU9ocWJuMDFPM0l2?=
 =?utf-8?B?WFd5Z3FleEJlUjVTSTJmbTdTU0ZHNzZGaW96QTZsMFRFNFRRSU9hbi9UZEky?=
 =?utf-8?B?Wjk0WWVHbGFDTDBjcFJjakVMUVVuQitkLzViQnZSZWUrckJKUDhPdkVZVkYz?=
 =?utf-8?B?RkpFbjlkWjFaY0JBOFl4dEExRVc4WFM5VGI1c0VvTkNVM05DYVpmdmVLTU9B?=
 =?utf-8?B?MHJwNFFhNGlBdVM0b1hqNmtyYnlpandJYk93d05LZy9UUmlJRFAxSHdFTEtB?=
 =?utf-8?B?RGpYdzI3VDM3T3VBc1hBY25LME9XWFZJYUN4M1JXLytBS3JnWjJnMEpoNzcx?=
 =?utf-8?B?VklQSTloWmkrcGk1ZUQ2Q3FBd25HQjh2Q0Fid1c4c1VRbUpXMFFxVG93NXNY?=
 =?utf-8?B?VllEaEIyN1dpS1YxRFo2cmtFaklhMG83MzFrOE9aUEg5Q1JDVEp5TFF5dmRC?=
 =?utf-8?Q?/afX3TNFWCspwBwDR5QvOwDRtCinXc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K0UrK1ArOWNWVEk2U3BUc205NXNJbW44Uno2aXVYWElOSU44a0wxc0FLRmYx?=
 =?utf-8?B?MlBhR0NoMi80cExKZkJ0VFM5ZDVaS213c1ZFd2JZWkJET2JYVDZwL1dsd1Ex?=
 =?utf-8?B?VHlYY1paT3kzT2JEL1VFd25wQVlXZEcva2dsckRUUS9JL3lMMHRKSEhyai9C?=
 =?utf-8?B?TUZYRksxMUI2aDhVdlByZ1pDS0RCQnMycUVlNUVvRXlBUFNvVStBU1FsN3Ix?=
 =?utf-8?B?UXplZkxwQWNLcVJLMTNyTUxsSktVMTRBR3RtTjJYc1pOZDNhNGRkenBPd0Z5?=
 =?utf-8?B?dUVLbWFNdWYxaHhuQzJpWm9JTkhCMk5qcDJaT2dlc3hFVHBzSUY5Q1g1REg2?=
 =?utf-8?B?eEVvZ0g5ZXhIb2hoMjhPU1FGVHI2d1NLeWZlMDA5UkwveUlqanFtNDU3bnRs?=
 =?utf-8?B?NW5aQzBOVEZzREtaOSs0R0tHYWMvL1BvS1A3UEZuNWtIS0ZiNlNONnh3RXpt?=
 =?utf-8?B?cHkvaFVCR254NGZBeWJzV2psWlpSWHZGdGJwOUpzQWNxWjc3ZE40TWpxREJC?=
 =?utf-8?B?RWR0eUQ2dEhMMVpKZE1FdHBwNHBvOWkwbHZKUC9SYVc2QjJLT2JHYzFDZWxU?=
 =?utf-8?B?RTBrcXh6VlAwZmR2Z1VLd0lLMlBSeEtvMGdQOUxtcTBDMGZTQVVUc215TEMy?=
 =?utf-8?B?Qyt4MnlhK20rS2w5Z1k4cXV5NUdDd2lUTTFSWG55MlBEV2Qyb25hY1RBLzNI?=
 =?utf-8?B?Zmt2bTkzM0FhdzM1REpjNENKRjFIU0FaSVNsZXU1RS9rYTdIVVAvSzY5WUov?=
 =?utf-8?B?Zkp3Rk5RckF0UXRsMndtaG15SWR4Qnh2NEI1Vk9ORXhwdDU2aFdPalRZZ1o2?=
 =?utf-8?B?SVFqVk5hL2ZRNnFvaGVPL1NuMUpvaHJDb1VlRWppYzlJWS9OZXJIQzVrV3RD?=
 =?utf-8?B?NWZhZjVYckg3cFFOckt2UDBKSUpxT3JjNEU4Q3Rnbk9RdnpDb2RKYldYSDN2?=
 =?utf-8?B?c290VWl4WVhXaC95eldiYmcrVmRqSVNjOTZTUXlzZHR0Z2FQa2FvMVJyWDcx?=
 =?utf-8?B?ZWlkbmF3RDJXL0lQQTdna0ZqcHloU0ZTNzVqdkZuSWJnKzNuZkdaMDVWWXd4?=
 =?utf-8?B?eklWUVVVaGZSdi9JeHZISFdtVEcrWDhkbHg5ek9kd2JYdmIxRFZHYmo0N3Ev?=
 =?utf-8?B?OWFzVnNXcmY3aEpJOHpxajJRaVNmZkoxdFZnSTN1U0dHNFJSOXFyVWc1R3Zo?=
 =?utf-8?B?ZWlhRTZqREpDTjQzWTExTTdiMTRTNjFHb09USjFHV1VjZXJpK2RkMXNLR0ZN?=
 =?utf-8?B?clBONHZZc0NSZ0NINkpUWk12Y1FncTh0bXlvWE1iUmM4MUJ1VnR2eHRRbDJJ?=
 =?utf-8?B?djRpS2hJZ3FxYVFVaFp5MXlvYXBpNDhuVDFSU003RzRUOEVZMUVYS1kzVml6?=
 =?utf-8?B?T0xPcTJqR2FOSmJFbFJDYk52VlNuWEMreU1RYWFXdnZYZ3FmNTZLdXN2TXdj?=
 =?utf-8?B?YVoyR2lSaFoycTlHb2J3cDYxSWQ5SFhzTFdkdm5pT3l6MlRnWE5sYkdpMmho?=
 =?utf-8?B?TDVOZnA4R1VocnpUUVczNVY5eDNDYUhFL20zSlR2VDY2ZE1xUnRzN1ZHeDZH?=
 =?utf-8?B?cTZ4SDBqNkdNdlkxanJ0TEg0VUZUMFJDK1pnUDVCTDVDY1dvQlZ4WkVmaFFW?=
 =?utf-8?B?Y3RYR0ROaFZIQ0d3dDJpMjN1OXFxUzk0V0JGSE41TnU0M3NRSllLWW1ZaEZL?=
 =?utf-8?B?d2dvZ1FFcFladXQzenpxVUE4a0JSM1VrWDZUNmFQODdjMDYrVDFFRW9ZVE10?=
 =?utf-8?B?RlA3QUZnV21FZVZRYU5ON2M5amJ2RUo0M01CY1YvT3dJQVQ0OUUycnlheERp?=
 =?utf-8?B?TnpuVUxlekd6WVJEakFSRUM5VHpnK0dhNUlDS05SOU5wQ00yUkFMdkU4ZW9S?=
 =?utf-8?B?NW9LN3k4a0ZZdklaazhSR0FlSUJKenZJNHpKUmp0K1phcFlaYW5veW83d0tu?=
 =?utf-8?B?dm9NN3BwMWVRVk1DWmloRHVFZjBMbVVxVGs3Zlc4VG4ydlZYQXNiVEFTaisr?=
 =?utf-8?B?V1JIT1YwQzllMkpXMEY1M3FVMWdpVW5qejRic1QvckE3QjdBUFI0QktQNzFQ?=
 =?utf-8?B?SEx5bmdmRUpSMU9TRGFIcXNzbXc4cnA1RFg3N3Ird2tZSkNndDRhQzcwMzVs?=
 =?utf-8?Q?gE0koRg7VG/XdHYt57DCzeRWf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f079be-d283-4258-3fd5-08de30f3d776
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 16:08:18.4720 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mgQRxBPN74kv78/o2oQVwgVU6jEND5G2Yo5VzZH5ef7OrDQnn2LB1DjYlyOHY+72
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9491
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

On 12/1/25 16:53, Philipp Stanner wrote:
> On Mon, 2025-12-01 at 16:20 +0100, Christian König wrote:
>> On 12/1/25 14:55, Philipp Stanner wrote:
>>> On Mon, 2025-12-01 at 14:23 +0100, Christian König wrote:
>>>> On 12/1/25 11:50, Philipp Stanner wrote:
>>>>> The overwhelming majority of users of dma_fence signaling functions
>>>>> don't care about whether the fence had already been signaled by someone
>>>>>
>>>
> 
> […]
> 
>>>>
>>>>> +{
>>>>> +	unsigned long flags;
>>>>> +	bool ret;
>>>>> +
>>>>> +	spin_lock_irqsave(fence->lock, flags);
>>>>> +	ret = dma_fence_check_and_signal_locked(fence);
>>>>> +	spin_unlock_irqrestore(fence->lock, flags);
>>>>
>>>> Could this use guard(fence->lock, flags) ?
>>>
>>> guard? You mean a lockdep guard? Do you have a pointer to someplace in
>>> dma_fence who does what you mean / want?
>>
>> E.g. like guard(spinlock_irqsave)(&fence->lock);
> 
> 
> Hmm, but why?
> It's obvious to all readers that I do spin_unlock_irqrestore() here.
> It's very simple code, lock, 1 line, unlock. What would the guard
> improve?

Well you can save using the local variables.

So this:

	unsigned long flags;
	bool ret;

	spin_lock_irqsave(fence->lock, flags);
	ret = dma_fence_check_and_signal_locked(fence);
	spin_unlock_irqrestore(fence->lock, flags);

	return ret;

Becomes just:

	guard(spinlock_irqsave)(&fence->lock);
	return dma_fence_check_and_signal_locked(fence);

Regards,
Christian.

> 
> 
> P.

