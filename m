Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAD3C9E76B9
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 18:10:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8BC210E1E8;
	Fri,  6 Dec 2024 17:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yYHb0+JW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CDF110E1E8
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 17:10:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iyz+3Jrc9CHrshAZkEVC6wdjAdT7Xfwnpzi4mim17yWMdfWTmRWXo735yNvig+admrneOgiUxI/IaY71ftcQOu7DDezsZQWkJahW7JCGDUXiK90S3Urooo7kayh18d3bZLT/C19KqwkvawayWUWaSxRtL61nwZGvpSwFxn1yMq/B3OrQE+fT9p5aTdVqS0TQoaJCGrOxGfilTqJdR79apI2/I8nxJ0InEWoHyXgJzwzhRKCm+ZLjnmo3AUfGpdSC5F4LFej72VfGvnJXgsr3BRKFFieIGKE0XS1cYzsxYZbxs6f8xczcTBbvPlbohA9XtY3TPrV+e37C1Ey9WsZuGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0WR12sX6nJ4exzGoXfOsFCySUxroUo8KlR9JpCknFBY=;
 b=F7NRjKxco9BPKuAj73O6cKPfvJy6m4CJD5ulVG9CEZ8/MovDCiCkP3q+OF5/BnaCd2mVw3EokF4SM3wLKJXx+qrpHxcsIfoDgXlWBsPlHK8qTUlcxi8m54fzMG9p7fqpC27jac/PL+bvgSlv1SHsqpbc6Hngs6o6jZGgnsXR9qMpFzHK9p4ib01oy60oWmFEPCt71FdzPlRblbBTS6EYjvQTwyVzqOZXUJvr0fowtcQPwbSq9HGNXXouW6cpeLSelZ/Qe2jAxTH2NpUdtqltYKmVmDL99LTv+ayYJCEB/fKnom9TkIgT4zoOoOrmmsBFUqGxKr2nKtdoOcOy7gQ/aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=fireburn.co.uk smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0WR12sX6nJ4exzGoXfOsFCySUxroUo8KlR9JpCknFBY=;
 b=yYHb0+JW6GIt+SFtMKdB9YRfJjabDpFwwMFL9SNU/Uo3lhT6eltIWE4Um617xqQM7dk5A8L6eqNE8NLWk703uX2THONcQixd7Y533vv7x2RAcBzgekboI8HxQeaCmWwV3G8/F/TuWZEAs+Tq7TdT3UGJQY9Kf8M7y1VVMF58O3c=
Received: from DS7PR06CA0036.namprd06.prod.outlook.com (2603:10b6:8:54::14) by
 CH3PR12MB9432.namprd12.prod.outlook.com (2603:10b6:610:1c7::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8207.19; Fri, 6 Dec 2024 17:10:31 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:8:54:cafe::7a) by DS7PR06CA0036.outlook.office365.com
 (2603:10b6:8:54::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8230.12 via Frontend Transport; Fri,
 6 Dec 2024 17:10:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8230.7 via Frontend Transport; Fri, 6 Dec 2024 17:10:28 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Dec
 2024 11:10:27 -0600
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 6 Dec
 2024 11:10:26 -0600
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 6 Dec 2024 11:10:26 -0600
Message-ID: <c9e86bf2-1d97-87bc-e170-4525d304d89d@amd.com>
Date: Fri, 6 Dec 2024 09:10:26 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V7 03/10] accel/amdxdna: Support hardware mailbox
Content-Language: en-US
To: Mike Lothian <mike@fireburn.co.uk>, Maling list - DRI developers
 <dri-devel@lists.freedesktop.org>
References: <CAHbf0-E+Z2O7rW-x+-EKNQ-nLbf=_ohaNzXxE7WD2cj9kFJERQ@mail.gmail.com>
CC: "Zhen, Max" <Max.Zhen@amd.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <CAHbf0-E+Z2O7rW-x+-EKNQ-nLbf=_ohaNzXxE7WD2cj9kFJERQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|CH3PR12MB9432:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b1d1edc-c887-48fd-3da6-08dd1618e1f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R0t6NXJVVlpJTDdxUWtWWm5oeksxN0pTK1RMTnRuWXVwMTg4ZEd2YkNZZUNE?=
 =?utf-8?B?V1FLUzhqTS8zSTd3S09aMmU4M2U3bFRGdkR6aXhvUUN4UzlRZVF0dGw1bkpC?=
 =?utf-8?B?UHdKUGFRQkZTeHZVV0pvODYrRjUrMHBPT3Zrb2drMU5zME9SWU4vdUViS2Zw?=
 =?utf-8?B?c1o4cCtNSk1JbmpVV0UxczYrdTNSNlY5WXFaWitaRjFmVE5YckVzUzJhbnI5?=
 =?utf-8?B?MWpuc3ZyVUFSd0VhQk85dlA3eDY0WjlrOTJLTk5OL1ZkZE4wZjJQSEtGUjI0?=
 =?utf-8?B?bjFHRk9oZ0FPU3NjbGZ1UExmaXY1L09TMnM3MHpwL0RuQVhlR1RGVmZWNW1l?=
 =?utf-8?B?MCtUSkVQZE51TENVMEsrbU5BdldCWFJRbjJibFhybUFKU1dOd2NKMGxEUVRk?=
 =?utf-8?B?SFJMaThZeDMrSDVOT0NKUUJzQWJjekc3bklPV0FzdmtrSVM4SGZPU2tjeE9F?=
 =?utf-8?B?cG5makZKM1BRMG1ZcnU2WHZnQ3NiWXpUNVB1TU1jNjJtNmxaTkFja3dvNlhk?=
 =?utf-8?B?QkdzUmUrOFhoR2JZaWdGM0pveFZmRlVrYk5VWG10dkwzakh0ZmI1eGlUSURT?=
 =?utf-8?B?aXlWc0V3VGhSUU4rVXJIdWoyNlpseHB4emgvK1ViRjhMTlFPZURFNmFtTkFR?=
 =?utf-8?B?L2tWWXhHQmN1aytEa2t5NUk3UFIwR0s1Y3NQck4wNDdoakZyVDl6R3BoUXY3?=
 =?utf-8?B?WC82bHhXNDNUbHIrMU5UVHRwMTNRZ1dGQm9CTk8rNVZkOUVUZDI0UklBemo1?=
 =?utf-8?B?bGlxNVNucEFYNVV6U2hGQVNtQi9jQXZ4M0MwM1A1S1VmaCtsaXlmakRFSjRn?=
 =?utf-8?B?NjBEbW1pM3VOWk5uRTFsY2dwZ09ZY2tWMjc0QUdPdlVtcnBORzBEdElNN0NM?=
 =?utf-8?B?SkJNeUNGcDVXMWxtN2M5ZXRScnBwYXNwczF1Z0UzWWhqaVF0dkdhbXBlckVv?=
 =?utf-8?B?cE90bHFwR3BQSDJTSWdtczhJdldkTVFKbisxeFdKVzVEL3NqUERMNGJXcjNy?=
 =?utf-8?B?VTJaak1CbmRMc0Qrb29qY0lhNWVXWS9ITStJeWdnSTllTXRZcnJlN2VjMmxP?=
 =?utf-8?B?L1NCTjR4SjJXUzE4enpXY0MyRFJTYWxFVElrbUk4MXl3aVVkTEdyZzdTMzRt?=
 =?utf-8?B?RE5BbkNVSGoraGNUK1gvaWtCVzdzeVhMdHMwT1F5bUg0YUw1eDVnek5qdHhZ?=
 =?utf-8?B?b3luSE10VW9yODdyTk4xU1paczF1T29YaWRYdDVaOFNiUHpxQ0trWExCd2pS?=
 =?utf-8?B?dHZhenR2SklFNmdDWlVKQmdqOEdYTkxNbjZDUXptWWRkOUU2NUNkMm9KbDYw?=
 =?utf-8?B?MitWK2N4dnMzKzdzNm9ZcVQ5cEREeGI3ZVVoazkwdCs2STB0aW80VnBBcDV4?=
 =?utf-8?B?ZmI0Ylk5YUdZbWUzWHRFaEN3RTJ5Rm5Lc0JZOG94VnBSQTZyNUVOWkIzVHN5?=
 =?utf-8?B?bGVnWFhuNDNOMGVJRkZ4c1hFMVQ0VEcyS2p4MnM5YWpKU2tmckY3Q1lZQlFp?=
 =?utf-8?B?aEYyMWtWRXpwTTJHRHhUL2psZmRYOFFPQmtqRGxKSGg4SkJXcnVkanFKWmsv?=
 =?utf-8?B?Q0FiV3p5bVlxcFVsYzQvVmhzTFRZUWpCUGI5ZGlNT0dDR1lMdUo3Yzd4b3hN?=
 =?utf-8?B?cmdMVEttNFl5Vm4xVWRwMU1Qczl6OHNHcFhXOWhrYTNxSFVhd3NDTm80cFlW?=
 =?utf-8?B?OWx0MXRIcnYwNUphUXRqU1Uzdm4vdzY1UFlIZlBST0xOcTNQd3lkeDgvMi9Y?=
 =?utf-8?B?UTFHdWZBelM1VS9yV2dvYU96dG51U0VYNTlNRXpXZllJOEVQeHlqeVF4NVIv?=
 =?utf-8?B?bDVjYWRrNmRwYmtpRlFVS2Y2ZVBsOWpnTGpDOWhrYjNBSXYyNVYvSEMxbklu?=
 =?utf-8?B?bm1hNHExR0VRNkgzUnZzaEZTZ0JIRlJ5K1I3cE9yeUZYcUpOTjZ0VFoxNU5E?=
 =?utf-8?Q?FzjMVVbkRkqioNitom3Xs5nwc9lSUjOD?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2024 17:10:28.1028 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b1d1edc-c887-48fd-3da6-08dd1618e1f0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9432
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

Hi Mike,


How did you install npu.sbin.1.5.2.380?  There should be a symlink 
npu.sbin which points to npu.sbin.1.5.2.380.

https://gitlab.com/kernel-firmware/linux-firmware/-/blob/main/WHENCE?ref_type=heads#L2719


Thanks,

Lizhi

On 12/5/24 07:44, Mike Lothian wrote:
> Hi
>
> I needed to add the following to get things compiling for me
>
>
> diff --git a/drivers/accel/amdxdna/amdxdna_mailbox.c
> b/drivers/accel/amdxdna/amdxdna_mailbox.c
> index fe684f463b945..79b9801935e71 100644
> --- a/drivers/accel/amdxdna/amdxdna_mailbox.c
> +++ b/drivers/accel/amdxdna/amdxdna_mailbox.c
> @@ -6,6 +6,7 @@
> #include <drm/drm_device.h>
> #include <drm/drm_managed.h>
> #include <linux/bitfield.h>
> +#include <linux/interrupt.h>
> #include <linux/iopoll.h>
>
> #define CREATE_TRACE_POINTS
>
>
> I also had to rename the firmware in /lib/firmware/amdnpu/1502_00/
> from npu.sbin.1.5.2.380 to npu.sbin
>
> Cheers
>
> Mike
>
>
