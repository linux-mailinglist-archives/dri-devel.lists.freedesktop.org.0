Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA2DDB09C7B
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:27:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8011110E910;
	Fri, 18 Jul 2025 07:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gTEMfPoa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2082.outbound.protection.outlook.com [40.107.95.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67AEC10E906;
 Fri, 18 Jul 2025 07:27:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PpbcEZEUWu7/K2WQUfTXyBbcvq71OmccZXE1cD0oQwTxjbz5rBOICJd7av6rairzhNkDvTdHXnPQTh305/9+sduMYemYlPIzuAGWUJYgloI+ICWrBQWDkhub++DroIDEU/tJD91tNAMNLIC+Qs/iGvHk9cUezXrwz+T2MQikAHPSSavfT+ZXwm77W5BAEQn6tBHFySuBJukErQFpl1wnq3sFPIhaIEw3QgIRYfxyd2IBnGRiOie7mrpOvFbIGQyLocJblN80vZ5EGPNB4ooZzQ3S0xPi3bQumAZSmgo/bMKPqFX8LKA8X3bmkleja42+pTjYRlSXlia2UNhhFaviAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ORzuyrNziqUyb1+w930lsSVrtpy8H1mRpxIXW9wYUVw=;
 b=N4njmv96xyH/Ik089cPtLEIzcDZk4BQSx88OdB1fc6j1WfKMSvgEIPSbzLKNqaIDCKpY+PsDO9Y5JyLyDa8s+d++sgHYWatiqKeOthiiLUcPkG0SUecCKA0IYNZHwVIIekLO6ZkXVIufH5TpWC/BldQ98657+++zd+dYavNf0z5NlM3AubOcYtdcy09VOzFebxXMUwb5+2C31qc57wDJoST1vTKsyE/xtu+4IBDZSS6anNMfBzgMced0pOAWTWa6FvFp6ARhUWr6+xehVEAARw9Lhha6UVLIcJWOWrBsfHgBzbHmwEZDgrM2jTTNyDgl6k6Ang2rdEUMeGH5h7n4MQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ORzuyrNziqUyb1+w930lsSVrtpy8H1mRpxIXW9wYUVw=;
 b=gTEMfPoa2C1F0gLbayR22LygE+xqqe8ai2nML9a0Z1jA+NpbIDxTb5RPJofchaHDdNooNUh+seaM2Pr6Wukeqb/jdcpTxlheTF51In8eiVDYCYzFjds2fxrf9QcI/lKOswZEmotzCHr++ixiL8bfB/5KjmYOFgctDlnzPBI+DMgFlhlmn4mDPqs/LkEx644Pb4WpZM6Lfr3uXHKR31ko9F0F6Ug3Go97asUrdWa9JeY89ifvsUj1wsxka/04Iflxs9O3R2pCmQ5wQKhBjhl2R6jAFL7LraGaatarrb2O+SRdFLpRpyjLncDHdc9644onCaYUlo/Z+fXUaVLyZ5zXAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW3PR12MB4427.namprd12.prod.outlook.com (2603:10b6:303:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Fri, 18 Jul
 2025 07:27:11 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 07:27:11 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 18 Jul 2025 16:26:20 +0900
Subject: [PATCH v2 15/19] gpu: nova-core: register: redesign relative registers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-nova-regs-v2-15-7b6a762aa1cd@nvidia.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
In-Reply-To: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TY2PR0101CA0028.apcprd01.prod.exchangelabs.com
 (2603:1096:404:8000::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW3PR12MB4427:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d940ecc-adcf-4df8-123f-08ddc5cc8291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dkVCcmlDb1hVY3h3MEJaQUJIYUcwUEdNL0lVbU9TbVB2bUZ0VFhLZzllcjRN?=
 =?utf-8?B?TjRmeDJXS2NkYTQ5VlFWRk5GRUlxR1dCMXE2MnZOMkJYSWdhWHIvRkp1cmQ1?=
 =?utf-8?B?aGtDcEVRdW5pNnNEMmxoMHdwdjBwRmx4TlNSL3Q2ZElpQlVZbDdNVEpTUkE1?=
 =?utf-8?B?YjBLbXc2WVJyeFZLUlN3bDJ4RncveHErNFJibzRmYitXRXY5YkxrY3RjcnFs?=
 =?utf-8?B?UXlsUFk3TVp2b1BkL3JBMFBmWHRUM3Q2aGFoaUlVTW04LzVzSC9UMnYrZHov?=
 =?utf-8?B?ZitVTk9zbE50bnVqQ0N4Y1VkV05XOGlUQUkyTGJnaTJqa0pTS29kTU5PdStC?=
 =?utf-8?B?c0pDbk5DUnJlckFmMDhHUUVJSHMwcjJaY2dZSzIwaUFNT0ZNd0oxRHBkQWRL?=
 =?utf-8?B?MlowcUovZlB2VWFQa3U1dFk2TVA0c1dwT2FyZFBtQmRpN3FMN04zRE9CZS84?=
 =?utf-8?B?OXVHSjdZeUhkaEdzWjN4N2hpWFpVaWFhN2tmcHM3bjhyL08xWUJXMEZRYmpo?=
 =?utf-8?B?Y2lmc3FsTzNDS0ZtTkNrb1lEL3FNQ0h5NWxsdUFuei9sTUxmek1FL3pqbDdi?=
 =?utf-8?B?WFhmLzdudUxTYUpLYlVXWTREeU9EWWZ4NzhKY2RFNmNOcG9wV1ZIeXJkd0dL?=
 =?utf-8?B?ZEhiczEwbmR4SVJ5akdXZk51aGJ1bXFMRmZVelFiK2dUektqbENYMXV1STBG?=
 =?utf-8?B?WkpoaVI5Z3dLYW9QeCt1WFNQNmNuWFltYUNwTWdZUTZteFM5bUlVL1YzL2pv?=
 =?utf-8?B?a01JeTRsN2Z3amY1R250bGZIQUVXckt0a2RDQ1dMNnVyUGIxekZCRlROa3Bu?=
 =?utf-8?B?SUMzZnpIK2xRMDQ0aGFxdUlJZUJmNTBpZnVHWjBnQ3p0SWZHT2NKOEFIclhO?=
 =?utf-8?B?Rk80enEzM1JhUzh2WkFneUh6NjN1NzcydE9ubnB1S2JXKzh3T3R2dEhBUTVW?=
 =?utf-8?B?SVdTL3RPbTBCYXZjb0VsVThQNVI3MGVLazdOandjeXY2RXd5SUxXVzhmRjBY?=
 =?utf-8?B?SGdIdXNXTGd2V2E0RU1PUS9Za1R1K0x1Y1o0S00vN3IwV2NtNmNIWThkVDBE?=
 =?utf-8?B?bG5TUWpERkVBTitud1RzcnhTRzZjT3BqNkE1Mjh2L2plS2xFQ01tNDV5MXNM?=
 =?utf-8?B?ck9xa3ZOT1hDMThSVTRDZ3JVZlVhL1BReEp1VHoxRlZQRWlhRHI0ODJYc2JG?=
 =?utf-8?B?MWdZRmVHd0hmNVR0d0NsVVRPQ0lNKzRRM1FPQzRTaUlvWk94TExDbkRnc05Z?=
 =?utf-8?B?NXBiTVg4OHRVc3dyRkp5YndYUTB0M2t5TGlUV0NMRmJvMElmN1U4MmNVUHVL?=
 =?utf-8?B?Z29kMUFpWWd2YXgzTE1VQnRjTElxZ2dMNTFmL3A0cTFxdGNjUDBlR0hSeW9m?=
 =?utf-8?B?QVVoU0hrMTV4UEp1Slh0U2p3a2FPRzgxcXdKTFNYUzVrUzByeEFHaDFLa0N1?=
 =?utf-8?B?UThyU3hjZW5SR040WnVQMUtMa1NITU42bUxWME56NEtVTk1uZHhZelViMnk0?=
 =?utf-8?B?WmQ1N04reExGUHBlK0dJVURoSHBmYVB6VVhoZjdRU1ZHck9ZSEpiY0RYRUJn?=
 =?utf-8?B?amE0MUkxREt3dUxUS2JkWnI0MjRDaHBxaUM5aktMQVh0WXFodVQ4V1dXTEpJ?=
 =?utf-8?B?Szh2YUVwMXZySm1zR1VtMkdKRW9OV3ZSNFRhU2ExUHl0WnRqcTVqQjVTUVpK?=
 =?utf-8?B?UmNjeUdzM0JJRElWekNBZWpDZFd6QzlWTUt0bEYrTy9TbmRQaXdTYjFvRnlz?=
 =?utf-8?B?U1A5Q2RBdEdpVTZLMWNuSzAwZHIzUmF5b0V0WHUrZFNRUTZBbU9XNEdHUVla?=
 =?utf-8?B?dU53MkgxbHFTU1A4akFuNEFwTGpMK1hETWZReFBXSUY4cmdvdnplblRKakZ2?=
 =?utf-8?B?NkZZazFWaEhzR2NqZXE0b2dkYndLd3VNNmJ3NUdrNTIyakNobmk2TEx5VGdn?=
 =?utf-8?Q?AK+WGBJdOi0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bTNOcEFrNzZuMDN5cUpsa1BlUnU1cTNXVGVlTWZFMUxzNFJCOFdDS0RPcVZn?=
 =?utf-8?B?dVlWd1dWZzNCSk1lK3d2Z3pwaXVWQ3VKSThZVERkZldEQWxKd1BYdUdXMmQy?=
 =?utf-8?B?TUFyL1l6SUtRdi96NU10OE50VVRIay9FSmF2VW4zK2daMkNUaFpSMW1ZcE52?=
 =?utf-8?B?TklTczZUbWMvU043SnBRdmRiMkRKZVZhM0krTHNjUmYxeDEyRVVuN2NRK1FI?=
 =?utf-8?B?SHBLU0E3dTAwS1JYelQ4L1pFTlRIQ21xQXBiTU8zUCtSVjJQZUFsbVFPUG5B?=
 =?utf-8?B?RWQzdGIrRDk2bnlnR2l3Mk00ak9EVlplSk9sb1FWTzBMMmxiVUU5RjdzaExN?=
 =?utf-8?B?VC9VQnRmdGZCNXlJYXY5dmNSUmR4cjVqTDAvVHEwUEpxWVB2djQ4cGZnUm5D?=
 =?utf-8?B?UGRaa1NUV1QxMk9JL3I2TU1JOVJIaXJ0bmExNldSbDJxcDVaSkVOMmM3SjFi?=
 =?utf-8?B?ckRJT0pUWEcxQklyNlZ5eisyQk1BNkpXVWFGY0NjU3d6Y2E0VmJ0c0FlS0hy?=
 =?utf-8?B?cTJIVnh1aHlKR0pGYkgyeldtL0ovWFI3dEZLd1p1azNlRjM0WUVaY3lpTkwx?=
 =?utf-8?B?Mmozc1lsWjNVOHdvSVFyOWZiU0hBZVgvL2l6bFY5dEdIUzBtWEpSSVFabEVp?=
 =?utf-8?B?VFExWkxVeEl3Wk5BT2NJUlFpTEJhY0dYeGlsTE5aZ29iaHdueWRhYnJGSmQv?=
 =?utf-8?B?ZStmR0l1eDM3NFVTQkxUWURBSEw1T0p4K2swN0dTc3ZKSWVWb1lwRTJ6Yk9M?=
 =?utf-8?B?TWhkS1NLekI0TDdRbFhHSk1xT0g3b1BXclppZlFBTlg0djNLMXpYQ20rMm9j?=
 =?utf-8?B?RE1zbXZqaWVLRkFYcld5R2xYT09HNmlNM2Y4dTlDUWdjTU16ekgybUJzanhV?=
 =?utf-8?B?M1ljVSt4Zmo4S3puSGpYS1d5cThYaFVwMWswSHdQdFdqZS9lZUFoek0rVDVX?=
 =?utf-8?B?YkZEN05CbTZlbTVUUjNCSTJOMEpPWkVsTVRZcGxlSm9qSW9GcHJ0NGlnelQr?=
 =?utf-8?B?amF0M1ZUNHJPRFVIUy8yZlYwTUdBbUtzRzFjUGI1aStBdUp6N3FLNzQ3NHgy?=
 =?utf-8?B?dTVlNUJtallsY1NjQllQSC9ZQWo5b2kxaWRmTkpDSjVhc1Q2dm9RcWZxQThi?=
 =?utf-8?B?NVBiaTZDcHMvR0lnV3dPZ25SeVZFOVhzbjNUa21HK2RHenQxZ1NsME9UbHdZ?=
 =?utf-8?B?WktiYisvdEJEbnUzdndpNkVtMi9YMUdzenVBUjNoOEo3MGd6enVQWWxpamhx?=
 =?utf-8?B?TVJydjR4dkNpQVJUM1BhSm1za25rUTluMjY0MXJLM1lieDlVeE9idFI1Mkhv?=
 =?utf-8?B?Vkl4aENJL1hiK2J0dmZRTXU2TjY2Y1hzQWs3anE1MVFUck5DaHd6M0FzTHVl?=
 =?utf-8?B?d2syVHc1NVoxa1VyWDY0aG02Yng2UXU4RjlBeHo0TWFDajAzaEM3alJzVFBR?=
 =?utf-8?B?djZORkN6b2tHVmpmcUlaVjVvYzZTRkJYWklaYkJycU00c0ZyUXpkOE42bUdt?=
 =?utf-8?B?ME43Y2JVbkZWb0o4c0tTcU5TY2tyd0wzUk13ZTNRM3VYMjdUZ2ZYY3oyRXJm?=
 =?utf-8?B?bzhkcVN6VXpDSHp0c1dKT2VvZmE5SGZEVERUQTBzR2RQejh2T1RRYTRRVGNC?=
 =?utf-8?B?SVhmUFZleFR6RXlEb2U3WFFiWGZHNDBSbjJ3V293SGhJcC9PclR0dEZFb09G?=
 =?utf-8?B?aXU0MDZYS1RTZ2Y4OXJEbkY0cFF4dzAvRlE5ZVI2Mytjb0hvNm9MM1dEbEZI?=
 =?utf-8?B?Zy9xbXozWDJOcDM3UFpMYmY3QXpkaWV2R3ovK0RyL21yQllhMGxqSHdRbkRa?=
 =?utf-8?B?VmVPR3JPSXR5Y1d0azlVYVJBZEZvK0ZMVDFaMTNvZGFhVGJXUTN5Z0VXRzBU?=
 =?utf-8?B?MDNPR0RZbVlzY0VaZTRrM1IwR2QrMFBDWUwrZXNDZzE5TnRsT0R6L1FOTWMw?=
 =?utf-8?B?em5oODR5Y0NJNWxhdjRCUzFacjlPL0xXREhCb3lLdmRoM09yQ29DM2t0L01m?=
 =?utf-8?B?dC9BaFljanR5dU9hcnlESlpHR1NNSWh6ckhBL2JOSW84d1lYSDU5M05KS0w5?=
 =?utf-8?B?cVdJeTBnR3N4cG1Hd1l5QW5QWjk2dDU0MmtoNjdINFU1UXlIUFlub1lyRkdZ?=
 =?utf-8?B?c0JVWm43Tm14SUg5UE41QzZuY3gvcFVXZ3cwVXlVQkE5dGtrVzF1NjZ4ejg0?=
 =?utf-8?Q?gStpnFnEf1nyicvQDyAdp3kRI7JceBkL6nxTbciJlMpx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d940ecc-adcf-4df8-123f-08ddc5cc8291
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 07:27:11.3646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qEslNZu6v9+AAo2qLe3YCqOR/CuDMnqK/8y28KHvD1x5lyI6ryU2mDkoGLpXMspe+gAbSYaIoCoknUbcJoGFMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4427
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

The relative registers are currently very unsafe to use: callers can
specify any constant as the base address for access, meaning they can
effectively interpret any I/O address as any relative register.

Ideally, valid base addresses for a family of registers should be
explicitly defined in the code, and could only be used with the relevant
registers

This patch changes the relative register declaration into this:

    register!(REGISTER_NAME @ BaseTrait[offset] ...

Where `BaseTrait` is the name of a ZST used as a parameter of the
`RegisterBase<>` trait to define a trait unique to a class of register.
This specialized trait is then implemented for every type that provides
a valid base address, enabling said types to be passed as the base
address provider for the register's I/O accessor methods.

This design thus makes it impossible to pass an unexpected base address
to a relative register, and, since the valid bases are all known at
compile-time, also guarantees that all I/O accesses are done within the
valid bounds of the I/O range.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/todo.rst      |   1 -
 drivers/gpu/nova-core/falcon.rs           |  67 +++++++------
 drivers/gpu/nova-core/falcon/gsp.rs       |  12 ++-
 drivers/gpu/nova-core/falcon/hal/ga102.rs |  14 +--
 drivers/gpu/nova-core/falcon/sec2.rs      |   9 +-
 drivers/gpu/nova-core/regs.rs             |  50 +++++-----
 drivers/gpu/nova-core/regs/macros.rs      | 156 ++++++++++++++++++++++++------
 7 files changed, 212 insertions(+), 97 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index 894a1e9c3741a43ad4eb76d24a9486862999874e..a1d12c1b289d89251d914fc271b7243ced11d487 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -131,7 +131,6 @@ crate so it can be used by other components as well.
 
 Features desired before this happens:
 
-* Relative register with build-time base address validation,
 * Arrays of registers with build-time index validation,
 * Make I/O optional I/O (for field values that are not registers),
 * Support other sizes than `u32`,
diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 50437c67c14a89b6974a121d4408efbcdcb3fdd0..67265a0b5d7b481bbe4c536e533840195207b4bb 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -14,6 +14,7 @@
 use crate::driver::Bar0;
 use crate::gpu::Chipset;
 use crate::regs;
+use crate::regs::macros::RegisterBase;
 use crate::util;
 
 pub(crate) mod gsp;
@@ -274,10 +275,16 @@ fn from(value: bool) -> Self {
     }
 }
 
-/// Trait defining the parameters of a given Falcon instance.
-pub(crate) trait FalconEngine: Sync {
-    /// Base I/O address for the falcon, relative from which its registers are accessed.
-    const BASE: usize;
+/// Type used to represent the `PFALCON` registers address base for a given falcon engine.
+pub(crate) struct PFalconBase(());
+
+/// Trait defining the parameters of a given Falcon engine.
+///
+/// Each engine provides one base for `PFALCON` and `PFALCON2` registers. The `ID` constant is used
+/// to identify a given Falcon instance with register I/O methods.
+pub(crate) trait FalconEngine: Sync + RegisterBase<PFalconBase> + Sized {
+    /// Singleton of the engine, used to identify it with register I/O methods.
+    const ID: Self;
 }
 
 /// Represents a portion of the firmware to be loaded into a particular memory (e.g. IMEM or DMEM).
@@ -343,13 +350,13 @@ pub(crate) fn new(
         bar: &Bar0,
         need_riscv: bool,
     ) -> Result<Self> {
-        let hwcfg1 = regs::NV_PFALCON_FALCON_HWCFG1::read(bar, E::BASE);
+        let hwcfg1 = regs::NV_PFALCON_FALCON_HWCFG1::read(bar, &E::ID);
         // Check that the revision and security model contain valid values.
         let _ = hwcfg1.core_rev()?;
         let _ = hwcfg1.security_model()?;
 
         if need_riscv {
-            let hwcfg2 = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
+            let hwcfg2 = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID);
             if !hwcfg2.riscv() {
                 dev_err!(
                     dev,
@@ -369,7 +376,7 @@ pub(crate) fn new(
     fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
         // TIMEOUT: memory scrubbing should complete in less than 20ms.
         util::wait_on(Delta::from_millis(20), || {
-            if regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE).mem_scrubbing_done() {
+            if regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID).mem_scrubbing_done() {
                 Some(())
             } else {
                 None
@@ -379,12 +386,12 @@ fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
 
     /// Reset the falcon engine.
     fn reset_eng(&self, bar: &Bar0) -> Result {
-        let _ = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
+        let _ = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID);
 
         // According to OpenRM's `kflcnPreResetWait_GA102` documentation, HW sometimes does not set
         // RESET_READY so a non-failing timeout is used.
         let _ = util::wait_on(Delta::from_micros(150), || {
-            let r = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, E::BASE);
+            let r = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID);
             if r.reset_ready() {
                 Some(())
             } else {
@@ -392,13 +399,13 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
             }
         });
 
-        regs::NV_PFALCON_FALCON_ENGINE::alter(bar, E::BASE, |v| v.set_reset(true));
+        regs::NV_PFALCON_FALCON_ENGINE::alter(bar, &E::ID, |v| v.set_reset(true));
 
         // TODO[DLAY]: replace with udelay() or equivalent once available.
         // TIMEOUT: falcon engine should not take more than 10us to reset.
         let _: Result = util::wait_on(Delta::from_micros(10), || None);
 
-        regs::NV_PFALCON_FALCON_ENGINE::alter(bar, E::BASE, |v| v.set_reset(false));
+        regs::NV_PFALCON_FALCON_ENGINE::alter(bar, &E::ID, |v| v.set_reset(false));
 
         self.reset_wait_mem_scrubbing(bar)?;
 
@@ -413,7 +420,7 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
 
         regs::NV_PFALCON_FALCON_RM::default()
             .set_value(regs::NV_PMC_BOOT_0::read(bar).into())
-            .write(bar, E::BASE);
+            .write(bar, &E::ID);
 
         Ok(())
     }
@@ -464,10 +471,10 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
         regs::NV_PFALCON_FALCON_DMATRFBASE::default()
             .set_base((dma_start >> 8) as u32)
-            .write(bar, E::BASE);
+            .write(bar, &E::ID);
         regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
             .set_base((dma_start >> 40) as u16)
-            .write(bar, E::BASE);
+            .write(bar, &E::ID);
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
             .set_size(DmaTrfCmdSize::Size256B)
@@ -478,17 +485,17 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
             // Perform a transfer of size `DMA_LEN`.
             regs::NV_PFALCON_FALCON_DMATRFMOFFS::default()
                 .set_offs(load_offsets.dst_start + pos)
-                .write(bar, E::BASE);
+                .write(bar, &E::ID);
             regs::NV_PFALCON_FALCON_DMATRFFBOFFS::default()
                 .set_offs(src_start + pos)
-                .write(bar, E::BASE);
-            cmd.write(bar, E::BASE);
+                .write(bar, &E::ID);
+            cmd.write(bar, &E::ID);
 
             // Wait for the transfer to complete.
             // TIMEOUT: arbitrarily large value, no DMA transfer to the falcon's small memories
             // should ever take that long.
             util::wait_on(Delta::from_secs(2), || {
-                let r = regs::NV_PFALCON_FALCON_DMATRFCMD::read(bar, E::BASE);
+                let r = regs::NV_PFALCON_FALCON_DMATRFCMD::read(bar, &E::ID);
                 if r.idle() {
                     Some(())
                 } else {
@@ -502,9 +509,9 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
     /// Perform a DMA load into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
     pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
-        regs::NV_PFALCON_FBIF_CTL::alter(bar, E::BASE, |v| v.set_allow_phys_no_ctx(true));
-        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, E::BASE);
-        regs::NV_PFALCON_FBIF_TRANSCFG::alter(bar, E::BASE, |v| {
+        regs::NV_PFALCON_FBIF_CTL::alter(bar, &E::ID, |v| v.set_allow_phys_no_ctx(true));
+        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
+        regs::NV_PFALCON_FBIF_TRANSCFG::alter(bar, &E::ID, |v| {
             v.set_target(FalconFbifTarget::CoherentSysmem)
                 .set_mem_type(FalconFbifMemType::Physical)
         });
@@ -517,7 +524,7 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
         // Set `BootVec` to start of non-secure code.
         regs::NV_PFALCON_FALCON_BOOTVEC::default()
             .set_value(fw.boot_addr())
-            .write(bar, E::BASE);
+            .write(bar, &E::ID);
 
         Ok(())
     }
@@ -538,27 +545,27 @@ pub(crate) fn boot(
         if let Some(mbox0) = mbox0 {
             regs::NV_PFALCON_FALCON_MAILBOX0::default()
                 .set_value(mbox0)
-                .write(bar, E::BASE);
+                .write(bar, &E::ID);
         }
 
         if let Some(mbox1) = mbox1 {
             regs::NV_PFALCON_FALCON_MAILBOX1::default()
                 .set_value(mbox1)
-                .write(bar, E::BASE);
+                .write(bar, &E::ID);
         }
 
-        match regs::NV_PFALCON_FALCON_CPUCTL::read(bar, E::BASE).alias_en() {
+        match regs::NV_PFALCON_FALCON_CPUCTL::read(bar, &E::ID).alias_en() {
             true => regs::NV_PFALCON_FALCON_CPUCTL_ALIAS::default()
                 .set_startcpu(true)
-                .write(bar, E::BASE),
+                .write(bar, &E::ID),
             false => regs::NV_PFALCON_FALCON_CPUCTL::default()
                 .set_startcpu(true)
-                .write(bar, E::BASE),
+                .write(bar, &E::ID),
         }
 
         // TIMEOUT: arbitrarily large value, firmwares should complete in less than 2 seconds.
         util::wait_on(Delta::from_secs(2), || {
-            let r = regs::NV_PFALCON_FALCON_CPUCTL::read(bar, E::BASE);
+            let r = regs::NV_PFALCON_FALCON_CPUCTL::read(bar, &E::ID);
             if r.halted() {
                 Some(())
             } else {
@@ -567,8 +574,8 @@ pub(crate) fn boot(
         })?;
 
         let (mbox0, mbox1) = (
-            regs::NV_PFALCON_FALCON_MAILBOX0::read(bar, E::BASE).value(),
-            regs::NV_PFALCON_FALCON_MAILBOX1::read(bar, E::BASE).value(),
+            regs::NV_PFALCON_FALCON_MAILBOX0::read(bar, &E::ID).value(),
+            regs::NV_PFALCON_FALCON_MAILBOX1::read(bar, &E::ID).value(),
         );
 
         Ok((mbox0, mbox1))
diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index d622e9a64470932af0b48032be5a1d4b518bf4a7..0db9f94036a6a7ced5a461aec2cff2ce246a5e0e 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -2,23 +2,27 @@
 
 use crate::{
     driver::Bar0,
-    falcon::{Falcon, FalconEngine},
-    regs,
+    falcon::{Falcon, FalconEngine, PFalconBase},
+    regs::{self, macros::RegisterBase},
 };
 
 /// Type specifying the `Gsp` falcon engine. Cannot be instantiated.
 pub(crate) struct Gsp(());
 
-impl FalconEngine for Gsp {
+impl RegisterBase<PFalconBase> for Gsp {
     const BASE: usize = 0x00110000;
 }
 
+impl FalconEngine for Gsp {
+    const ID: Self = Gsp(());
+}
+
 impl Falcon<Gsp> {
     /// Clears the SWGEN0 bit in the Falcon's IRQ status clear register to
     /// allow GSP to signal CPU for processing new messages in message queue.
     pub(crate) fn clear_swgen0_intr(&self, bar: &Bar0) {
         regs::NV_PFALCON_FALCON_IRQSCLR::default()
             .set_swgen0(true)
-            .write(bar, Gsp::BASE);
+            .write(bar, &Gsp::ID);
     }
 }
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 52c33d3f22a8e920742b45940c346c47fdc70e93..3fdacd19322dd122eb00e245de4be8d1edd61a5f 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -16,15 +16,15 @@
 use super::FalconHal;
 
 fn select_core_ga102<E: FalconEngine>(bar: &Bar0) -> Result {
-    let bcr_ctrl = regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, E::BASE);
+    let bcr_ctrl = regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, &E::ID);
     if bcr_ctrl.core_select() != PeregrineCoreSelect::Falcon {
         regs::NV_PRISCV_RISCV_BCR_CTRL::default()
             .set_core_select(PeregrineCoreSelect::Falcon)
-            .write(bar, E::BASE);
+            .write(bar, &E::ID);
 
         // TIMEOUT: falcon core should take less than 10ms to report being enabled.
         util::wait_on(Delta::from_millis(10), || {
-            let r = regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, E::BASE);
+            let r = regs::NV_PRISCV_RISCV_BCR_CTRL::read(bar, &E::ID);
             if r.valid() {
                 Some(())
             } else {
@@ -76,16 +76,16 @@ fn signature_reg_fuse_version_ga102(
 fn program_brom_ga102<E: FalconEngine>(bar: &Bar0, params: &FalconBromParams) -> Result {
     regs::NV_PFALCON2_FALCON_BROM_PARAADDR::default()
         .set_value(params.pkc_data_offset)
-        .write(bar, E::BASE);
+        .write(bar, &E::ID);
     regs::NV_PFALCON2_FALCON_BROM_ENGIDMASK::default()
         .set_value(u32::from(params.engine_id_mask))
-        .write(bar, E::BASE);
+        .write(bar, &E::ID);
     regs::NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID::default()
         .set_ucode_id(params.ucode_id)
-        .write(bar, E::BASE);
+        .write(bar, &E::ID);
     regs::NV_PFALCON2_FALCON_MOD_SEL::default()
         .set_algo(FalconModSelAlgo::Rsa3k)
-        .write(bar, E::BASE);
+        .write(bar, &E::ID);
 
     Ok(())
 }
diff --git a/drivers/gpu/nova-core/falcon/sec2.rs b/drivers/gpu/nova-core/falcon/sec2.rs
index 5147d9e2a7fe859210727504688d84cca4de991b..dbc486a712ffce30efa3a4264b0757974962302e 100644
--- a/drivers/gpu/nova-core/falcon/sec2.rs
+++ b/drivers/gpu/nova-core/falcon/sec2.rs
@@ -1,10 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
 
-use crate::falcon::FalconEngine;
+use crate::falcon::{FalconEngine, PFalconBase};
+use crate::regs::macros::RegisterBase;
 
 /// Type specifying the `Sec2` falcon engine. Cannot be instantiated.
 pub(crate) struct Sec2(());
 
-impl FalconEngine for Sec2 {
+impl RegisterBase<PFalconBase> for Sec2 {
     const BASE: usize = 0x00840000;
 }
+
+impl FalconEngine for Sec2 {
+    const ID: Self = Sec2(());
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 2df784f704d57b6ef31486afa0121c5cd83bb8b9..7a15f391c52c9d0ba3c89094af48998bda82e25e 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -5,11 +5,11 @@
 #![allow(non_camel_case_types)]
 
 #[macro_use]
-mod macros;
+pub(crate) mod macros;
 
 use crate::falcon::{
     DmaTrfCmdSize, FalconCoreRev, FalconCoreRevSubversion, FalconFbifMemType, FalconFbifTarget,
-    FalconModSelAlgo, FalconSecurityModel, PeregrineCoreSelect,
+    FalconModSelAlgo, FalconSecurityModel, PFalconBase, PeregrineCoreSelect,
 };
 use crate::gpu::{Architecture, Chipset};
 use kernel::prelude::*;
@@ -194,24 +194,24 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
 
 // PFALCON
 
-register!(NV_PFALCON_FALCON_IRQSCLR @ +0x00000004 {
+register!(NV_PFALCON_FALCON_IRQSCLR @ PFalconBase[0x00000004] {
     4:4     halt as bool;
     6:6     swgen0 as bool;
 });
 
-register!(NV_PFALCON_FALCON_MAILBOX0 @ +0x00000040 {
+register!(NV_PFALCON_FALCON_MAILBOX0 @ PFalconBase[0x00000040] {
     31:0    value as u32;
 });
 
-register!(NV_PFALCON_FALCON_MAILBOX1 @ +0x00000044 {
+register!(NV_PFALCON_FALCON_MAILBOX1 @ PFalconBase[0x00000044] {
     31:0    value as u32;
 });
 
-register!(NV_PFALCON_FALCON_RM @ +0x00000084 {
+register!(NV_PFALCON_FALCON_RM @ PFalconBase[0x00000084] {
     31:0    value as u32;
 });
 
-register!(NV_PFALCON_FALCON_HWCFG2 @ +0x000000f4 {
+register!(NV_PFALCON_FALCON_HWCFG2 @ PFalconBase[0x000000f4] {
     10:10   riscv as bool;
     12:12   mem_scrubbing as bool, "Set to 0 after memory scrubbing is completed";
     31:31   reset_ready as bool, "Signal indicating that reset is completed (GA102+)";
@@ -224,17 +224,17 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     }
 }
 
-register!(NV_PFALCON_FALCON_CPUCTL @ +0x00000100 {
+register!(NV_PFALCON_FALCON_CPUCTL @ PFalconBase[0x00000100] {
     1:1     startcpu as bool;
     4:4     halted as bool;
     6:6     alias_en as bool;
 });
 
-register!(NV_PFALCON_FALCON_BOOTVEC @ +0x00000104 {
+register!(NV_PFALCON_FALCON_BOOTVEC @ PFalconBase[0x00000104] {
     31:0    value as u32;
 });
 
-register!(NV_PFALCON_FALCON_DMACTL @ +0x0000010c {
+register!(NV_PFALCON_FALCON_DMACTL @ PFalconBase[0x0000010c] {
     0:0     require_ctx as bool;
     1:1     dmem_scrubbing as bool;
     2:2     imem_scrubbing as bool;
@@ -242,15 +242,15 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     7:7     secure_stat as bool;
 });
 
-register!(NV_PFALCON_FALCON_DMATRFBASE @ +0x00000110 {
+register!(NV_PFALCON_FALCON_DMATRFBASE @ PFalconBase[0x00000110] {
     31:0    base as u32;
 });
 
-register!(NV_PFALCON_FALCON_DMATRFMOFFS @ +0x00000114 {
+register!(NV_PFALCON_FALCON_DMATRFMOFFS @ PFalconBase[0x00000114] {
     23:0    offs as u32;
 });
 
-register!(NV_PFALCON_FALCON_DMATRFCMD @ +0x00000118 {
+register!(NV_PFALCON_FALCON_DMATRFCMD @ PFalconBase[0x00000118] {
     0:0     full as bool;
     1:1     idle as bool;
     3:2     sec as u8;
@@ -261,60 +261,60 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     16:16   set_dmtag as u8;
 });
 
-register!(NV_PFALCON_FALCON_DMATRFFBOFFS @ +0x0000011c {
+register!(NV_PFALCON_FALCON_DMATRFFBOFFS @ PFalconBase[0x0000011c] {
     31:0    offs as u32;
 });
 
-register!(NV_PFALCON_FALCON_DMATRFBASE1 @ +0x00000128 {
+register!(NV_PFALCON_FALCON_DMATRFBASE1 @ PFalconBase[0x00000128] {
     8:0     base as u16;
 });
 
-register!(NV_PFALCON_FALCON_HWCFG1 @ +0x0000012c {
+register!(NV_PFALCON_FALCON_HWCFG1 @ PFalconBase[0x0000012c] {
     3:0     core_rev as u8 ?=> FalconCoreRev, "Core revision";
     5:4     security_model as u8 ?=> FalconSecurityModel, "Security model";
     7:6     core_rev_subversion as u8 ?=> FalconCoreRevSubversion, "Core revision subversion";
 });
 
-register!(NV_PFALCON_FALCON_CPUCTL_ALIAS @ +0x00000130 {
+register!(NV_PFALCON_FALCON_CPUCTL_ALIAS @ PFalconBase[0x00000130] {
     1:1     startcpu as bool;
 });
 
 // Actually known as `NV_PSEC_FALCON_ENGINE` and `NV_PGSP_FALCON_ENGINE` depending on the falcon
 // instance.
-register!(NV_PFALCON_FALCON_ENGINE @ +0x000003c0 {
+register!(NV_PFALCON_FALCON_ENGINE @ PFalconBase[0x000003c0] {
     0:0     reset as bool;
 });
 
 // TODO[REGA]: this is an array of registers.
-register!(NV_PFALCON_FBIF_TRANSCFG @ +0x00000600 {
+register!(NV_PFALCON_FBIF_TRANSCFG @ PFalconBase[0x00000600] {
     1:0     target as u8 ?=> FalconFbifTarget;
     2:2     mem_type as bool => FalconFbifMemType;
 });
 
-register!(NV_PFALCON_FBIF_CTL @ +0x00000624 {
+register!(NV_PFALCON_FBIF_CTL @ PFalconBase[0x00000624] {
     7:7     allow_phys_no_ctx as bool;
 });
 
-register!(NV_PFALCON2_FALCON_MOD_SEL @ +0x00001180 {
+register!(NV_PFALCON2_FALCON_MOD_SEL @ PFalconBase[0x00001180] {
     7:0     algo as u8 ?=> FalconModSelAlgo;
 });
 
-register!(NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID @ +0x00001198 {
+register!(NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID @ PFalconBase[0x00001198] {
     7:0    ucode_id as u8;
 });
 
-register!(NV_PFALCON2_FALCON_BROM_ENGIDMASK @ +0x0000119c {
+register!(NV_PFALCON2_FALCON_BROM_ENGIDMASK @ PFalconBase[0x0000119c] {
     31:0    value as u32;
 });
 
 // TODO[REGA]: this is an array of registers.
-register!(NV_PFALCON2_FALCON_BROM_PARAADDR @ +0x00001210 {
+register!(NV_PFALCON2_FALCON_BROM_PARAADDR @ PFalconBase[0x00001210] {
     31:0    value as u32;
 });
 
 // PRISCV
 
-register!(NV_PRISCV_RISCV_BCR_CTRL @ +0x00001668 {
+register!(NV_PRISCV_RISCV_BCR_CTRL @ PFalconBase[0x00001668] {
     0:0     valid as bool;
     4:4     core_select as bool => PeregrineCoreSelect;
     8:8     br_fetch as bool;
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index a9f754056c3521b2a288f34bf3d78ec56db53451..3465fb302ce921ca995ecbb71b83efe1c9a62a1d 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -10,6 +10,16 @@
 //! dedicated type for each register. Each such type comes with its own field accessors that can
 //! return an error if a field's value is invalid.
 
+/// Trait providing a base address to be added to the offset of a relative register to obtain
+/// its actual offset.
+///
+/// The `T` generic argument is used to distinguish which base to use, in case a type provides
+/// several bases. It is given to the `register!` macro to restrict the use of the register to
+/// implementors of this particular variant.
+pub(crate) trait RegisterBase<T> {
+    const BASE: usize;
+}
+
 /// Defines a dedicated type for a register with an absolute offset, including getter and setter
 /// methods for its fields and methods to read and write it from an `Io` region.
 ///
@@ -56,20 +66,6 @@
 /// The documentation strings are optional. If present, they will be added to the type's
 /// definition, or the field getter and setter methods they are attached to.
 ///
-/// Putting a `+` before the address of the register makes it relative to a base: the `read` and
-/// `write` methods take a `base` argument that is added to the specified address before access:
-///
-/// ```no_run
-/// register!(CPU_CTL @ +0x0000010, "CPU core control" {
-///    0:0     start as bool, "Start the CPU core";
-/// });
-///
-/// // Flip the `start` switch for the CPU core which base address is at `CPU_BASE`.
-/// let cpuctl = CPU_CTL::read(&bar, CPU_BASE);
-/// pr_info!("CPU CTL: {:#x}", cpuctl);
-/// cpuctl.set_start(true).write(&bar, CPU_BASE);
-/// ```
-///
 /// It is also possible to create a alias register by using the `=> ALIAS` syntax. This is useful
 /// for cases where a register's interpretation depends on the context:
 ///
@@ -85,6 +81,87 @@
 ///
 /// In this example, `SCRATCH_0_BOOT_STATUS` uses the same I/O address as `SCRATCH`, while also
 /// providing its own `completed` field.
+///
+/// ## Relative registers
+///
+/// A register can be defined as being accessible from a fixed offset of a provided base. For
+/// instance, imagine the following I/O space:
+///
+/// ```text
+///           +-----------------------------+
+///           |             ...             |
+///           |                             |
+///  0x100--->+------------CPU0-------------+
+///           |                             |
+///  0x110--->+-----------------------------+
+///           |           CPU_CTL           |
+///           +-----------------------------+
+///           |             ...             |
+///           |                             |
+///           |                             |
+///  0x200--->+------------CPU1-------------+
+///           |                             |
+///  0x210--->+-----------------------------+
+///           |           CPU_CTL           |
+///           +-----------------------------+
+///           |             ...             |
+///           +-----------------------------+
+/// ```
+///
+/// `CPU0` and `CPU1` both have a `CPU_CTL` register that starts at offset `0x10` of their I/O
+/// space segment. Since both instances of `CPU_CTL` share the same layout, we don't want to define
+/// them twice and would prefer a way to select which one to use from a single definition
+///
+/// This can be done using the `Base[Offset]` syntax when specifying the register's address.
+///
+/// `Base` is an arbitrary type (typically a ZST) to be used as a generic parameter of the
+/// [`RegisterBase`] trait to provide the base as a constant, i.e. each type providing a base for
+/// this register needs to implement `RegisterBase<Base>`. Here is the above example translated
+/// into code:
+///
+/// ```no_run
+/// // Type used to identify the base.
+/// pub(crate) struct CpuCtlBase;
+///
+/// // ZST describing `CPU0`.
+/// struct Cpu0;
+/// impl RegisterBase<CpuCtlBase> for Cpu0 {
+///     const BASE: usize = 0x100;
+/// }
+/// // Singleton of `CPU0` used to identify it.
+/// const CPU0: Cpu0 = Cpu0;
+///
+/// // ZST describing `CPU1`.
+/// struct Cpu1;
+/// impl RegisterBase<CpuCtlBase> for Cpu1 {
+///     const BASE: usize = 0x200;
+/// }
+/// // Singleton of `CPU1` used to identify it.
+/// const CPU1: Cpu1 = Cpu1;
+///
+/// // This makes `CPU_CTL` accessible from all implementors of `RegisterBase<CpuCtlBase>`.
+/// register!(CPU_CTL @ CpuCtlBase[0x10], "CPU core control" {
+///     0:0     start as bool, "Start the CPU core";
+/// });
+///
+/// // The `read`, `write` and `alter` methods of relative registers take an extra `base` argument
+/// // that is used to resolve its final address by adding its `BASE` to the offset of the
+/// // register.
+///
+/// // Start `CPU0`.
+/// CPU_CTL::alter(bar, &CPU0, |r| r.set_start(true));
+///
+/// // Start `CPU1`.
+/// CPU_CTL::alter(bar, &CPU1, |r| r.set_start(true));
+///
+/// // Aliases can also be defined for relative register.
+/// register!(CPU_CTL_ALIAS => CpuCtlBase[CPU_CTL], "Alias to CPU core control" {
+///     1:1     alias_start as bool, "Start the aliased CPU core";
+/// });
+///
+/// // Start the aliased `CPU0`.
+/// CPU_CTL_ALIAS::alter(bar, &CPU0, |r| r.set_alias_start(true));
+/// ```
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
@@ -98,16 +175,16 @@ macro_rules! register {
         register!(@io_fixed $name @ $alias::OFFSET);
     };
 
-    // Creates a register at a relative offset from a base address.
-    ($name:ident @ + $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
+    // Creates a register at a relative offset from a base address provider.
+    ($name:ident @ $base:ty [ $offset:literal ] $(, $comment:literal)? { $($fields:tt)* } ) => {
         register!(@core $name $(, $comment)? { $($fields)* } );
-        register!(@io_relative $name @ + $offset);
+        register!(@io_relative $name @ $base [ $offset ]);
     };
 
     // Creates an alias register of relative offset register `alias` with its own fields.
-    ($name:ident => + $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
+    ($name:ident => $base:ty [ $alias:ident ] $(, $comment:literal)? { $($fields:tt)* }) => {
         register!(@core $name $(, $comment)? { $($fields)* } );
-        register!(@io_relative $name @ + $alias::OFFSET);
+        register!(@io_relative $name @ $base [ $alias::OFFSET ]);
     };
 
     // All rules below are helpers.
@@ -380,39 +457,62 @@ pub(crate) fn alter<const SIZE: usize, T, F>(
     };
 
     // Generates the IO accessors for a relative offset register.
-    (@io_relative $name:ident @ + $offset:literal) => {
+    (@io_relative $name:ident @ $base:ty [ $offset:expr ]) => {
         #[allow(dead_code)]
         impl $name {
             pub(crate) const OFFSET: usize = $offset;
 
+            /// Read the register from `io`, using the base address provided by `base` and adding
+            /// the register's offset to it.
             #[inline(always)]
-            pub(crate) fn read<const SIZE: usize, T>(
+            pub(crate) fn read<const SIZE: usize, T, B>(
                 io: &T,
-                base: usize,
+                #[allow(unused_variables)]
+                base: &B,
             ) -> Self where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: crate::regs::macros::RegisterBase<$base>,
             {
-                Self(io.read32(base + $offset))
+                const OFFSET: usize = $name::OFFSET;
+
+                let value = io.read32(
+                    <B as crate::regs::macros::RegisterBase<$base>>::BASE + OFFSET
+                );
+
+                Self(value)
             }
 
+            /// Write the value contained in `self` to `io`, using the base address provided by
+            /// `base` and adding the register's offset to it.
             #[inline(always)]
-            pub(crate) fn write<const SIZE: usize, T>(
+            pub(crate) fn write<const SIZE: usize, T, B>(
                 self,
                 io: &T,
-                base: usize,
+                #[allow(unused_variables)]
+                base: &B,
             ) where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: crate::regs::macros::RegisterBase<$base>,
             {
-                io.write32(self.0, base + $offset)
+                const OFFSET: usize = $name::OFFSET;
+
+                io.write32(
+                    self.0,
+                    <B as crate::regs::macros::RegisterBase<$base>>::BASE + OFFSET
+                );
             }
 
+            /// Read the register from `io`, using the base address provided by `base` and adding
+            /// the register's offset to it, then run `f` on its value to obtain a new value to
+            /// write back.
             #[inline(always)]
-            pub(crate) fn alter<const SIZE: usize, T, F>(
+            pub(crate) fn alter<const SIZE: usize, T, B, F>(
                 io: &T,
-                base: usize,
+                base: &B,
                 f: F,
             ) where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: crate::regs::macros::RegisterBase<$base>,
                 F: ::core::ops::FnOnce(Self) -> Self,
             {
                 let reg = f(Self::read(io, base));

-- 
2.50.1

