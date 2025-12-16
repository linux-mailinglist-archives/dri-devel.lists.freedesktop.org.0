Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 057ADCC0E56
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 05:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5531610E6B9;
	Tue, 16 Dec 2025 04:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mdDJCiC0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010033.outbound.protection.outlook.com [52.101.201.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CE3610E68D;
 Tue, 16 Dec 2025 04:28:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sVy/Rh13FT/HEaEU20PLrvnYiFP8lUeNTDpzcU/4eacIxN2KDM9qg4RyRvIKvtgy0q9hsxhRp6ZrKRGWwFo2vVWVzfQx6CfUJxLf+kW1YrULzc0RJj4a5huhIHUeb8wS7hxO8vQYOM4AUKSYayOLLhBj5k8D8X+jxFpYQmTDk/T4YYAs6JpwCH10QF5NvW2UOnzgkx49P8r4ufAWEoiADi6KTY2IZplP5qpMJ5AbT4OJsw7bcGQs8c3UFFSkuZAXn1Fuqa4c8DCT14StKq5zLp2PUukfnJWaTYibd3w8vvOVw3fRgDAostWrJh8iGqcW/TmvTCAlEWOa/UXTXl44uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZUxRLlYcfDjKh25Gsggu6pSq6ECY7gT/seDuYBKPSHE=;
 b=bzUTcmgTG5EPCttvsnxxi17B8vGYwusGAwJWM2uvQgjtKWRe9+X9l3yO7hiryxCkuVDQUtzkGzpNtYI094Q3gGJmYY9jFpYIl7QYRJpp/IHKVWjoPqeWdU3/do2Cpy5fz8ryDsq781U4cw3MXO12cYniPkMp8X0MYUWQHxOELzYI/s+CWdsjFwcGPoOelqdq1MzkbvwNAMkysK5TDVJWld/OaCvT1WCxUH0NTJvzOe/O31B9fS9fsxM8t4/nBoYwagqW5EWzEQzSwrsEVn2o9xHX0V7cs2EdamQUfwliWjYNa20wPpMleLxRzNhTnJDd2RrSAhFbUX2MolmluJBiLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZUxRLlYcfDjKh25Gsggu6pSq6ECY7gT/seDuYBKPSHE=;
 b=mdDJCiC0GJPHE2ZlIYhpMsRfad4b1k+Yew3vltOaUVz+p55EdgA9c352ttjWdEVDJ7FOocdWsITe9En+JPM7u+fTV+MdDe/n6Lr1VRid3m4C94AU3eMHtfBggTnggO1GTrTfw7hIiqNq2N0FvMkmPeqm7GQ6x8f/29uwb+sqrhJPt/KOPyXY5gtjqcTl14EjQY0oHlaRIgSghFnNrmq8xrs7ohOYWPQScCOnPpmUP0zrxGWocvXvwC5P9/hHIFMdfp14mnyvCFUtfpV2qOtYIAggIbTtolv3NHDHBMzyjWAn2RULG2F3fQjcgMSF9ZS7t5GrIKEC3rMpHUipi3qCQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8754.namprd12.prod.outlook.com (2603:10b6:610:170::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 04:28:01 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 04:28:01 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 16 Dec 2025 13:27:30 +0900
Subject: [PATCH v2 10/10] gpu: nova-core: gsp: use available device reference
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-nova-misc-v2-10-dc7b42586c04@nvidia.com>
References: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
In-Reply-To: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P301CA0023.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:2b1::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: 61846ba8-56e1-4caa-8e1c-08de3c5b7f47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b0p1amN2c042VEsyZDlLZ1RIeEYwYXgwcHgyL2UvTmFzWDJlNlhQWVQrYy9y?=
 =?utf-8?B?bkZKekgvRDZ1bzNXNE50dUZaZlVlajd3dms1b0x4RHYrSFpYUVNTellsVWk5?=
 =?utf-8?B?SnRkNUUvcHlDV055U1pzNkRpRVBSbVFXUVJhaTlUTSt5WWNCRnVsZmduZVR6?=
 =?utf-8?B?NXVQdFcxN1FLb1puaDBraWRvSWJoaDBrRmIrSGljS3NoNEtzcHdTTXdzNmtX?=
 =?utf-8?B?dFE0TFpQcXVsaXVrTFJVcGh2YVdYK09YVnlhakFIR0VKcEpBSlJnUFE0TzdZ?=
 =?utf-8?B?RmlCVENLeFFXcjg0UVh2UTlnYUk4a0k2dG4rakVrZGtidEt1ejNpRW0wbUNG?=
 =?utf-8?B?Y3Z3TVE2OHArTUhwdVovbmFWcmN1UVZuMXd1RWpyVlhmN1ZqSkxuaUpOV3Vl?=
 =?utf-8?B?VVVqTmhhMVFTL1hNSm9pdSt6dkRuT3B6Ryt0YlZpMnhldHZGM3JSdUp2dTh1?=
 =?utf-8?B?QmNMbWRqLys2KzM1ZXliVlptaFUzK1RoTndLTU1TOHJUSWRhZFgxWXU1WHVN?=
 =?utf-8?B?TzVCeVVBQTc5WW9meWdDdTVUb3I3Z3NESjhpZEFXcGw5OHVudDkwQkVzODNh?=
 =?utf-8?B?K3ArOVFlTXk1QkRVcVlDMFdBZndIQXB3Umh5UDQya1UrbGhHVlNhY09zWmdM?=
 =?utf-8?B?eFJBZ2o3OFNyZFRTVkNialRxUjhlelZWWVJTYU1mYmk5UEJVU0xiWE1kSzgy?=
 =?utf-8?B?akFta25RdUpmNEUwa3A0WjdDQXBrbmJLcGxvNmxGRis3N094aHM4TThCeXFG?=
 =?utf-8?B?NnVRNjBiQlM1NVl4akxtcndXanV1VHNOc0tQSkNybGhSWHV3ZThtWk5URGxP?=
 =?utf-8?B?TGQ4NW93dnhTZzluQ1YzYmFxSkdWVGZiMFVvdy83b2hXbFNpZDZ0MUt5eWNr?=
 =?utf-8?B?Q3QwbnFXYUZveEFHUGNCelVKM1hpeUhveVEzRDBqL0JsTVhMNkNZQ3ZzNXBo?=
 =?utf-8?B?SXl1NmhteGdmZDF3OU93T3Q2S2R2a0Q2V1lTaXlLbkhpRHg0NUpldEN2bUQr?=
 =?utf-8?B?cGVGaHJLdmVYVUljU1B6djJOM3BaSVdKdk52V0tZYzMxL2NGQmVvV0xXSDgw?=
 =?utf-8?B?dXlxUFV3T2N0cEVMOWdxa1IwbWJjdW1LY2NEYzZJSUFlQXZHTS9ZcVA2Zlgx?=
 =?utf-8?B?VDZkSWE0em4yRXlHczZ2c3RielNsWlgxUEFtWUlvWTJMVDZSTStWL3dnMU5K?=
 =?utf-8?B?d1pPY1FldU9FdVR6Y0FxYXZXOTRoTkxnUVJvVDdoSXpPWGtBeEJDL1daUzRG?=
 =?utf-8?B?VUNHUlpzNUFuQmg1ZzdPRHR3TXdCVlcwbzZOSkd3RkdkTlZjZ1cxNEV1WGNX?=
 =?utf-8?B?RU83ZlYvcXIzdUgyZzVVZ3E1YU1MVU5tZUtnUk1BL1U2L0xpcTFxWmt5NTZi?=
 =?utf-8?B?aDBLMVR6T2RZUUZsMW9XUSs2WUNvZU9sd3RUUWtLdzFpNDFOMElGd0xRN3A2?=
 =?utf-8?B?MytjSHFSUmRlUVozdFRoWldid3JIbHo4ZXJab2s1SVpNc2c3eWRXQURUa1Bu?=
 =?utf-8?B?L1ZHWjAvRGdoQzBsNkJOYmtueGV5N2JqUjhsbXJ4bDg2RzNZRzhIem5Lc3lI?=
 =?utf-8?B?RW1QOE5Md2hJdm40T1RQM0t3dFdick5KRk9qRzluZ2VhYUtxc0sxTTVpNG5D?=
 =?utf-8?B?OXh4Y1ZxbGo1MlVzN0s0NnJhRE1CU1N5Y0RYVVJrMytseHREVy9ZZlZrSE5a?=
 =?utf-8?B?ejc1WGJJN2NNNy9SZVVEU2JWREF0aG1lMmg3Wi8rekhseXBaVHA3ajcrb1or?=
 =?utf-8?B?R1JibWdwVm9lSmVpOWhERXptakYzWk9Qcm1BcVY2bmxDR3V3YjlOeFZ2eTlP?=
 =?utf-8?B?VWh3Q3ZTVm5LZTZXVVE4b3F2bzJaSnQvZ2IweGFRam9BNTlEUGNJd043azlB?=
 =?utf-8?B?c0ZzeWtVK1lVeWZiQUNvdjRkNHA2bFJSSFJhSmliOE83Z2htRkw5MW1zUjFX?=
 =?utf-8?Q?siXh1Ht+AZxsSdvWIIaRVhJDR4N5bfjR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aklnZU1UeGZ3QzExcCs1WS9QOXBreXdNYkxzRUErNWhYQVRLVUhTZ29FSG9l?=
 =?utf-8?B?cllpNDZZVFM0S0dIN1NaUjc5Y3FXZjA1VlJpak9hek5LT3pHVldSVVlrdXN0?=
 =?utf-8?B?anVDNjJibDFDb3k3ZSszRnh6TlZzbDdlL0p6YzZtOWNpY2QwS0F4aWNsekls?=
 =?utf-8?B?Z3R3WXo0Vnk4TzltZEJIbldzOEZPT283SkFjUm9vL0ZnTGV6Qzh6cWJtV3d5?=
 =?utf-8?B?bjZVRkF4aXFxakEzZjdhKzIyVzNHVGVyZ0wwR2JQOTNiRGU3UFpTKytyR2NN?=
 =?utf-8?B?azJRUWpwVlpwRTJNQnV5cThkRjBNSnZSc3J6SmltNGlEeTlvd1ZpdllETlFS?=
 =?utf-8?B?R0VGSUY2bkZReGpadGpOclZGZ0J2UFpSNHh1WUZJT2FKcHJ6YWRWazdGUmUv?=
 =?utf-8?B?TXJEeSs0azY2UkZIYVBCVGJqY1lBelNicnZOTS9zY3NZemV2S09VZmhpVUNm?=
 =?utf-8?B?UG9IRHFSNjBRVm56TFA5TDFUODErTk5PNy9aakxXU3JEdUVQbGkzdGZYVjhX?=
 =?utf-8?B?STEyOVFPTnBYS0kwaDVCdFlyUzBwZEg1aHhOdFZHdERzTWQzMStWWWh4M1Rm?=
 =?utf-8?B?OXUwQjJqc3pOSnAxVVBZUktYWEJsVk5CVDVKbWJtUytEeG9JTUFNMzZmY2pM?=
 =?utf-8?B?Snh5NHBMTXF0am1QSThxMnVNWERacStuQzlxQzQ3YWE2eXRiUHpVR3UrS1E3?=
 =?utf-8?B?M3dsdHlZUld4bzIxYnhWdFFrTXU4T2c2U1N4a3ZScDZDSGJyN3FaRm00bk9V?=
 =?utf-8?B?djNPdGhFUEtIRTdLL1N5eWwrY3hVNlBwSjJWYzFsaVlDd3lIbkk2OVhpNHBu?=
 =?utf-8?B?QkJtL0lUOXh3Z0NTQUgrUVhKV3JZSlFBa3hISmdEVWNCeTNZMllMM1MvRCtN?=
 =?utf-8?B?NEsvUzdXZVpUWFU4bTdLSmVTUHhNN2g0MFBJSi9EZktMaFl1VEpjTGROaGF1?=
 =?utf-8?B?bGk1ZFZ3bkplN1UvY1BjVyszWVZwVTR0dExubTFkTmpOdWdIYUh1dHlqZkts?=
 =?utf-8?B?SHBSQThUdjVKakJKM0Y2YXRvb3RZdG1SYzYyZ2NkbStoUzFMQjhDOHpIWHpQ?=
 =?utf-8?B?cVMrVTV5MzJhbGhHWHlHV2RQQmhjYTgvVU1meUxHSGxqem9FVHh0MGIzL0Ry?=
 =?utf-8?B?V0pYOURJQ0NZRkROOEs1U3I4NWhuVGVYM2NmUU41T0ZHTVovaDMydmxsU2d2?=
 =?utf-8?B?MG1aNlhOSk1oLzRZdmFzdU5LbkN6S3V2RG9xai9mU1V2K0dnVVFqcTk0UkVD?=
 =?utf-8?B?bEo5OXlMQUdHNFNXVlFiMkk4YzBmUUw0WGFXMHlJdXdQUEcwQ1hKc2ZYaFNw?=
 =?utf-8?B?YzZtTHR5SmpNNm03UUF2ZXZUVnRsV1VleEFPN3ZlQURNZU40Z3JJV0RhUjBu?=
 =?utf-8?B?S0JmVVFDSDlpc1d6ZEpFQ21WdUxVeU5yaU1nK2l5RUdmOVkxSHZHK0NYd1Rl?=
 =?utf-8?B?cU1hYmVzb2NLQzdBWDNGWmpLaTZUajMxZXdWbWlGN2tiZTJmMmR1aXdVYTE3?=
 =?utf-8?B?c3o5TUlzRGZRd05ob0tzdW5taXgvbjcwRTlIVVRBbVFzUzR0aGRNanV3Nzhy?=
 =?utf-8?B?MjFKcEJZdFgrbk9HTUxBdWQ4SHBiNFpRWG9vWWpkWFNoUmpJcGd1YWkrLzZC?=
 =?utf-8?B?VzJQZjd5NGlyZ0lmUnNRei8yWVZnM1FJSm5nLzBGNW1raXd2emRFbnRhcnVL?=
 =?utf-8?B?MkFseDBPRUhXSlViSzdxN0VFbDJZUENhYU1xRzMxbGFyKzdyWU5NVXRQVU5L?=
 =?utf-8?B?cGhqWUFQVjRrdFVkUmJOSzZnK2JTTVlqcXUzNTNnYjcySlEwNU9MOXdKc1J0?=
 =?utf-8?B?Um9xamxYRkh2SXErdmVXQlVFL083N080SElyeVU0T0lqVXQzWTJ6dlY5b3Js?=
 =?utf-8?B?a3BweTVpUGhYblZDSEtPdlFDZXgra1MwMkpoNVVaVEZRZG9oMVlzQ3o0M0M0?=
 =?utf-8?B?Qnh1UEJBRkxPb1YxNHBZOVNYblM1Mk52a0o3M3lObUZ3RWxOZDRRc1ZMZTBh?=
 =?utf-8?B?SXJPSTNIVkpxQ0dpcXl4OUpKL3VoMndnb3FVT3l5czBWK0QzRHNlL1l2TFdY?=
 =?utf-8?B?djJNUTYvWlczZmdqOFR6K1BvTDg2anpCOGp4OEZ0N2FrdXExRExReUlUejBU?=
 =?utf-8?B?Y3VDYnE1OUN5bTF6bHlqK0ZocFQ0aGR3M3B6RGpYWGxNUC8zaVZaeXJPb1Rz?=
 =?utf-8?Q?sAd+lDEKlmLBqewJnWyMqss2BgxxJM+F2pfkbZLF69wi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61846ba8-56e1-4caa-8e1c-08de3c5b7f47
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 04:28:00.9615 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YEVaXEX+qOAd+Ji345SdavzOmuOT9YCrwdnkMePtUvosV37vQJz4FRFovGb83cztOE0//xAFQrIpG75Yckfe2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8754
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

We already have a regular reference to the `Device`, so we don't need to
repeatedly acquire one in this method.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 32 +++++++-------------------------
 1 file changed, 7 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 54937606b5b0..ca7efdaa753b 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -173,15 +173,10 @@ pub(crate) fn boot(
             Some(libos_handle as u32),
             Some((libos_handle >> 32) as u32),
         )?;
-        dev_dbg!(
-            pdev.as_ref(),
-            "GSP MBOX0: {:#x}, MBOX1: {:#x}\n",
-            mbox0,
-            mbox1
-        );
+        dev_dbg!(dev, "GSP MBOX0: {:#x}, MBOX1: {:#x}\n", mbox0, mbox1);
 
         dev_dbg!(
-            pdev.as_ref(),
+            dev,
             "Using SEC2 to load and run the booter_load firmware...\n"
         );
 
@@ -193,19 +188,10 @@ pub(crate) fn boot(
             Some(wpr_handle as u32),
             Some((wpr_handle >> 32) as u32),
         )?;
-        dev_dbg!(
-            pdev.as_ref(),
-            "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n",
-            mbox0,
-            mbox1
-        );
+        dev_dbg!(dev, "SEC2 MBOX0: {:#x}, MBOX1{:#x}\n", mbox0, mbox1);
 
         if mbox0 != 0 {
-            dev_err!(
-                pdev.as_ref(),
-                "Booter-load failed with error {:#x}\n",
-                mbox0
-            );
+            dev_err!(dev, "Booter-load failed with error {:#x}\n", mbox0);
             return Err(ENODEV);
         }
 
@@ -219,11 +205,7 @@ pub(crate) fn boot(
             Delta::from_secs(5),
         )?;
 
-        dev_dbg!(
-            pdev.as_ref(),
-            "RISC-V active? {}\n",
-            gsp_falcon.is_riscv_active(bar),
-        );
+        dev_dbg!(dev, "RISC-V active? {}\n", gsp_falcon.is_riscv_active(bar),);
 
         // Create and run the GSP sequencer.
         let seq_params = GspSequencerParams {
@@ -231,7 +213,7 @@ pub(crate) fn boot(
             libos_dma_handle: libos_handle,
             gsp_falcon,
             sec2_falcon,
-            dev: pdev.as_ref().into(),
+            dev: dev.into(),
             bar,
         };
         GspSequencer::run(&mut self.cmdq, seq_params)?;
@@ -242,7 +224,7 @@ pub(crate) fn boot(
         // Obtain and display basic GPU information.
         let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
         dev_info!(
-            pdev.as_ref(),
+            dev,
             "GPU name: {}\n",
             info.gpu_name().unwrap_or("invalid GPU name")
         );

-- 
2.52.0

