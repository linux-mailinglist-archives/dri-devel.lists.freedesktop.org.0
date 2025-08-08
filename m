Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E08B1E0AD
	for <lists+dri-devel@lfdr.de>; Fri,  8 Aug 2025 04:47:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51FFB10E8B5;
	Fri,  8 Aug 2025 02:46:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XZii05qX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 935BD10E8B8;
 Fri,  8 Aug 2025 02:46:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOirhuGHbIgp/5rYl/koq/D7oJzHj4mTBAh93Rt0h7tjKyJYPn46gmJF0MrczeFmKPhUvr4wtv8HnTczRJyehALDKBBuD6RmridcIo2bj3D+ODZ/wLTktFrkHPcO4nKea2weBdwcXxigWA6hepIDYCWISIcdBLLTLH1uoPS3bF0qMzM5D4bnFMyG+auEyNehYqIAdSJ/QF2xwew4lqACGWJCKTJa2l+MPeEJIkM5U+usnNNEKa1F+T9UOgi20P5POa5nj0WPOyGxktJW97n61pneUi2VWc6606XgubL306nnFhzrD/W/OVTVVn830vlTVMCUwhGMRUzVy2iqew+auA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dj9rGXrYsT/rhDHdlYytaqCUg63c2o3MxqzD/x+yIUY=;
 b=Ag9DRVOWL1O4t6EDWO+zEcQgOHDIsfedBbp6ZXn5lLB2nSVl0ybqL4Sa3j7Q2otUPGlmg1TxX4DCVF90Nf5rTKYEkQGWmctuxPKt54UoSAMhqndN60lXWEjDVXkZyYgJlqjfDozch1I70Z7U7c0KP9+RJn8yqcFoV2KKdv/vBwqNv2zSGIMGjcxyuzfmfhp0WPAflgQ/T0vM5x+u55XcEoFJI+R5N/W2W8lEz4t7DjURu6tavoLHYu14j9ng6XlwEClRrz08Ya5FVpzonh1ofNgd1lstF3IsFpSHqVvnmyotbLmdWrVk4EZefcq6aOiKhKCBbqw5NfGl+sTUPsE46A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dj9rGXrYsT/rhDHdlYytaqCUg63c2o3MxqzD/x+yIUY=;
 b=XZii05qXOCSDWpJS+LcquER9TATK5iT/5lM60RhoYoAPMMvWv1AKfvHEo83jBGxIDm5xQhB3yOYI9SwtSeUEKSYphkx89kCj4LyTFOOhjJJSpZiKyMtN5HcT0i8pFrwzQgQ6X5D7kMfAg1wfu0fR1yzwx5ZgnwKYCmQoMjdDbON1Cl0389OX726p7GVN4HyRTVE9CWsX3qvNtDNnZsp2pJq/jPkbWS8Vl3E15xsLyGI1DHvSaAlvIHBu3OYoUDsj44e1WDRsYIjUYDwpzQgE94iyRfjm31yx1WVGyUqgVSZNyJFAZYq3OaGUuqqu/bnZWoTRapt0t0BDtUqzy3v/xg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW5PR12MB5600.namprd12.prod.outlook.com (2603:10b6:303:195::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.13; Fri, 8 Aug
 2025 02:46:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9009.013; Fri, 8 Aug 2025
 02:46:52 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 08 Aug 2025 11:46:42 +0900
Subject: [PATCH 2/2] gpu: nova-core: vbios: store reference to Device where
 relevant
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-vbios_device-v1-2-834bbbab6471@nvidia.com>
References: <20250808-vbios_device-v1-0-834bbbab6471@nvidia.com>
In-Reply-To: <20250808-vbios_device-v1-0-834bbbab6471@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Joel Fernandes <joelagnelf@nvidia.com>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0310.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW5PR12MB5600:EE_
X-MS-Office365-Filtering-Correlation-Id: 0716f3a9-b8ff-4be1-4649-08ddd625d4a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RGtqUldMa2xxaWZUem85SDJsTnJRU1F4RXJPYi9seEtpTjVza2VxbkRRZDU0?=
 =?utf-8?B?NUpENVROQ1JMVjllQTZWMTd6RkU1UGtuY0R4N04rMDMzTFY5M2ZpRXcrbWo2?=
 =?utf-8?B?QlFRMnBqZFFvWUJzYUNlRFF6d0pUckRwd0FMelQwSWEvQnVYcVJIdE5XRTRt?=
 =?utf-8?B?OWRSdXhRMHBMd2VjM095cHp2c0VtamxsdXd2b2taWDc2SThZOENpRFA0NTJ0?=
 =?utf-8?B?K2pnSjNkQTVRbTkydW9ESThkd2t5NTJMUlMxdVcxQnNJSjAvREw2eXRZT3ht?=
 =?utf-8?B?eW9QbHJTV3JVUGlLRzBuRHpHRmdaWkpBbkNCYy9uL2ZpQzhEeER4cGswQmdG?=
 =?utf-8?B?bm93bDEvTkExd3VqUVNzUUMyUENXV0loRGplRlBjTjQ2TTVVNmtFa3pmSE9j?=
 =?utf-8?B?NzgzYXZldEZjakFuQlZ3b3B5eU0zRzZvMHp3RDd6aDRvZU1rYTNHNkVaZmMz?=
 =?utf-8?B?Zzhjc3p5Q01jUTltL2d5ZDU5bEZaZmNZYzgyZUdRR1FSUUxzamNJeTdxT0lL?=
 =?utf-8?B?eTM2eVZCTEtva3ZnVHMycWw1dERlL0J1L3RnN08zMjZkVlRqa0VYM25BVmFJ?=
 =?utf-8?B?NHdLUm1zUTNNQk9hVisyMFUrTmE5aW5CVnVRN0J6dW9yeWJtL0lRSFJJVzhk?=
 =?utf-8?B?MjFST0IzUlVxQmRhVk5zZzNwWnRST0p3MnNsc2h4QUhETktXZFp5VHZJdXNW?=
 =?utf-8?B?alU1N1lTb1lFT3RLdWN2U3JOdXBVWDBpTEpSUVNScnRLTG5oblBRQzl4QnFL?=
 =?utf-8?B?bDRRODBWVkdpRmVWQ0ZCNUoxa0dqYURuOVVlWlozZnYzMldiSTFtam1hZEky?=
 =?utf-8?B?eVlPS3l3SGlSd29Dcm1qWWYwVlovTU0wSUZRbWFiTzludFhIUnpuWnh3Tml5?=
 =?utf-8?B?eHNOZ0xzSXIxTXdDM2I4UkY2bWkvOVdlSWx3dU1lVU5aTlJUaGk4VVBheXhp?=
 =?utf-8?B?Nis3WkJpNCsvWXlYbzZBL1R3ZUVsb0l3V2luQytDTTJkckY3bXRtNkc0cHQ3?=
 =?utf-8?B?Z2JKdjJMWFFLcU1GVzZ5eVFlaUoxdTZtM0h3dytXcWJwV28zVWpVdlFaRTdl?=
 =?utf-8?B?Z3BhdGN0emZqRDkwRmkwY1hrN0RLNnRMdDg1M1FRM1B2aHByK3RXVVpWTisw?=
 =?utf-8?B?TmphMjlIUzIxOVN0Y3dPZWpZRXJQeEFWOWJlWitGclJtN2RqcWQ3Z000UzE1?=
 =?utf-8?B?dGYxV0lTNTJ4Y0FmWUJzMlBZOWJGWERqN0FyU1ErNy81WUl2SVVzUExqVS9V?=
 =?utf-8?B?bWdzdFJjK2JNN2ozNkFYSVlHbDFKaTFReExubmtESWNwR0h0MnhTS25wc1M0?=
 =?utf-8?B?QjUzQWxMVEdVMWxwdGJRRGJTVFVnaWtObkNRZXpORTFjc0o3L0xOeHhPbElX?=
 =?utf-8?B?VE02Y2tIaE9GV0VuZnM3VDEyZ1lDMmRZNXdZSExTUUV1SFRPY2hDaDUzcTBw?=
 =?utf-8?B?d1VvTWVQdEtweDVwZ0xENURWN3k0SlAza0o2YnZGRXZpRWczaTZ4eDV1RWNl?=
 =?utf-8?B?Z041WW80S20yVnpsQ2dBSmR5RS8yc1h4aHVrVTUreGUyN0tNQjBxQW9pMGJo?=
 =?utf-8?B?MEF2K2JGakMvSG1wK2RGd3NINXBGeU5HSU1mU0lPWjh1UmpvTjc0WnFtT2JD?=
 =?utf-8?B?dWZuaGZlMWNmQ25wSVNqbFNpeTVHL3BNcWJHS2xBdzJVTnZLQ3NQL0w1a2Jz?=
 =?utf-8?B?bmJvUzlRV1RtbFptZHp6SHM1dlBVclBEMkxqcmxLcWgvc0R1NGp0WlNyRnJu?=
 =?utf-8?B?T3didkxZb3FTWlNLOEd4MU5NRU1zcC9hdERNUGFGOGFkZDhNTmtGVkdCL0sv?=
 =?utf-8?B?dEkvQ3Z1M25ERzVaNDJ5LzBzbGVUYlZhbExqS3JOanlPdHdiUUtDZDEwMHBj?=
 =?utf-8?B?a0JBTDV0TWo3NTV6V3pKVTI2SGNRcUQxQnBVbTZFd1RpQ1BoV282eXF4Qkkr?=
 =?utf-8?Q?Zq4AeM9uupw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnoycFFGVUJxbHk0eDFkVkNrVmVCdmFwVnhWM0JiL2tRQ2VzRXFjbG56RlhZ?=
 =?utf-8?B?Wm1pU3NIYjFrNW9FMmU5THJGcVl4dDdIZTJ3TXRrMngvQ0ZQSm5XdG41cEJq?=
 =?utf-8?B?Z01hdUlRdnBTRmVBb2NsNVJ3czJCY2VNNWZLSXdnMjZ6RDU0T2Q2K3Y0OXBB?=
 =?utf-8?B?eE5tbjRJYU1La2k1d0JQRjZXU3ZraVc5RFMvZWxGVWMrdmVqYUZoa1VMZ0FD?=
 =?utf-8?B?dW1waURhNW1lTzFwZi9LSWpvWmpZUWRjVzdXSm81c2g1R3JUVjBnTDEwbzN4?=
 =?utf-8?B?UnUvdTg2dnRWL3ZQMDg5bDJZRWJjUU54NTJ1WUZsUDhueFg5WXVidDhPcGt4?=
 =?utf-8?B?MC80a203c1FTNUh5aFFLZTV5cE53amlOcFVTR0dVcU9WM2ZOV3JUTGNXYTdE?=
 =?utf-8?B?YlpLR1lGcGlnU21Va08yK2JYWWNQMDltRm8ySG4wdVlBWGtlazdjK1R0d0xx?=
 =?utf-8?B?cG1GaTZiZlNROER1dXlIaGFwaERCSk42bktvNllNTjhQd0xMR0tGM1EzY2xF?=
 =?utf-8?B?SCtnMnh4WVFoSWhEUVRGTXhhTDNhTkVjbmVpa3dNVkZIZG8vK1dxNzBwTWlU?=
 =?utf-8?B?dzZiNDlqNk9MUmJCMVB1bFdiWkRyQ0pTS2hkbWNHQ2FVb2k5QllVdTlSRFFN?=
 =?utf-8?B?WXRYU1RMK1dDNTBsM1lLc1Y2aDZOUFlZaitPL3Z2L2dqbnNCV1BGS2dmelNU?=
 =?utf-8?B?ZVRSM2VpY0M3VmpqTG41YWhKaWo3Ky9tT2Z0SGNINXFkUzdLdWh6Ym1rdHVF?=
 =?utf-8?B?M3hFUUt5UjhOYXBtd0FnSmxJSURJNUdqK2VuNFg0V2xxOTFrYS9tT0x3dVBW?=
 =?utf-8?B?ZXd5K2pWTS9FNzdLQytvOEc5d3BFeHhjQ3ZHQnFyc0kreTdaWEd0VXM4ZzFL?=
 =?utf-8?B?a0NONk4yQis5T3ZqTXRZdWk4dWFQQ0lUMzhFVlA5UXcvYlRtUkNUNGs4SEdm?=
 =?utf-8?B?Kys1b0o0SW5JMkhFVUhiaEJ0cVZxOTR2a3hVNjIwLzcrSXUvTXNQaGN4emNn?=
 =?utf-8?B?T1A3Qys0WlA1NDZsU0FncmlUN0p2Z09QL0F1MHZ5d2w0eG4rNW90SUdYRHYz?=
 =?utf-8?B?RWRsSHMzaUU4cXdickRtakVqWjFDcm96V3VsMTFpOVB1TkFoK2hySGY3bEFw?=
 =?utf-8?B?dUpPR1FGN3pFNXRkcmRaajhIY0Y0QitGRWpIL1BsdjNSbjNhU0xkY3g0aTdL?=
 =?utf-8?B?cEx5a01uN09RZGo2ZkxJTitMMEp6KzRqZVhnVHpsRnhTNWFRTFZoQTBscHNh?=
 =?utf-8?B?VjZsbWVTVG1TR1JpbUpjWklqaW54VTJ2Sm1IaDFGOURNMlVoS2ZNZWZFTlJ6?=
 =?utf-8?B?QzZpcmxTc0o3cHQzYjJsRFExZGtUUTYyem9TRS9xMFVFVlJqOXI5VllXUUVU?=
 =?utf-8?B?NVFIbHhJRDBOSi8xaWNqNDJ4eWljcHVFNXQzOEV4QlllUTVHNVZVTzRnZUUw?=
 =?utf-8?B?N2VhWVhQYjNDeVJ1N3hvbk5vTkIrZ3BoSGpjTEhyWnluUTVpQ1NiSGZNSFBy?=
 =?utf-8?B?MzgzVk1xTUJtaGRDbXhkTXBLT2t4aHoydVJtV3k2QXp6T2g4bnNYWXIxTFRu?=
 =?utf-8?B?ZWwrNzRTdTdhSGRNUHg0d05kT3cvRmowMEZZbW9TVStHdVRjUFc1b2c2RDZn?=
 =?utf-8?B?MDBVdHhER2FpM2Z2Mm9DYnlJcmhXY0p5RFVZa0hEOTVoYVFTbUtrdmJTN0Zq?=
 =?utf-8?B?R2FtZmg0aWhCd3AvdmZuSW5EalV1dVkrTjQya094L2tQb0pmUzBqZmpyQTNQ?=
 =?utf-8?B?SlltRGk5djNWckdRcWxsdDY4czZnZmpGQlpvR01vb0g3ZVBZRWc2dWU1VGRo?=
 =?utf-8?B?VTdyZmYwcEhGay9xUUlFTy9xTkdQYTVydWcxWW9ZS2FtNFYzTXZVUkd0aGNk?=
 =?utf-8?B?Vkg1dTIvTC9RSjJxaEpzcWNTOG5sOUtOamZBT3RBY2xJU01MTnpadW1QdE5V?=
 =?utf-8?B?QzdxOXBnTkFELzFpazRPZHh3eEdNMWdJaUVKbmdwSzNEUFpQLzZpK3BDb2ti?=
 =?utf-8?B?akxOSnBNOWJ3UDh3YUF0TGZiVHFrTVJUVHFxcmcySnJ4aWhVVnVLVU9GcnNF?=
 =?utf-8?B?cXlhMWdYWkNHRGFmMnBrTnlRc3dEdThyOTV6eEttQTZxOXJkSDhPdU1CL2hC?=
 =?utf-8?B?ZXhJSmJiMklBU2RjTE9XNFVYNFA1TlBMMk5vWmtMSmplY0p1VDhEdG5xN1Fx?=
 =?utf-8?Q?xsTLcIWP+OKB0deRdoeCMWkSUrVEvOHEnbd/hK2qPGGr?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0716f3a9-b8ff-4be1-4649-08ddd625d4a8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 02:46:52.9003 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: t0I8QA9rnhbWGjVrwHkdER4bRsy0BxJD4BAJs/VQRWqiUm/WRKxO9BN/uxUkm2g1AiCPFIxwn4hQtIkvdAcFCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5600
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

Now that the vbios code uses a non-bound `Device` instance, store an
`ARef` to it at construction time so we can use it for logging without
having to carry an extra argument on every method for that sole purpose.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware/fwsec.rs |  8 ++--
 drivers/gpu/nova-core/vbios.rs          | 69 ++++++++++++++++++++-------------
 2 files changed, 46 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 0dff3cfa90afee0cd4c3348023c8bfd7edccdb29..d9b9d1f92880cbcd36dac84b9e86a84e6465cf5d 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -253,8 +253,8 @@ impl FalconFirmware for FwsecFirmware {
 
 impl FirmwareDmaObject<FwsecFirmware, Unsigned> {
     fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
-        let desc = bios.fwsec_image().header(dev)?;
-        let ucode = bios.fwsec_image().ucode(dev, desc)?;
+        let desc = bios.fwsec_image().header()?;
+        let ucode = bios.fwsec_image().ucode(desc)?;
         let mut dma_object = DmaObject::from_data(dev, ucode)?;
 
         let hdr_offset = (desc.imem_load_size + desc.interface_offset) as usize;
@@ -343,7 +343,7 @@ pub(crate) fn new(
         let ucode_dma = FirmwareDmaObject::<Self, _>::new_fwsec(dev, bios, cmd)?;
 
         // Patch signature if needed.
-        let desc = bios.fwsec_image().header(dev)?;
+        let desc = bios.fwsec_image().header()?;
         let ucode_signed = if desc.signature_count != 0 {
             let sig_base_img = (desc.imem_load_size + desc.pkc_data_offset) as usize;
             let desc_sig_versions = u32::from(desc.signature_versions);
@@ -382,7 +382,7 @@ pub(crate) fn new(
             dev_dbg!(dev, "patching signature with index {}\n", signature_idx);
             let signature = bios
                 .fwsec_image()
-                .sigs(dev, desc)
+                .sigs(desc)
                 .and_then(|sigs| sigs.get(signature_idx).ok_or(EINVAL))?;
 
             ucode_dma.patch_signature(signature, sig_base_img)?
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index b5564b4d3e4758e77178aa403635e4780f0378cc..6fc06b1b83655a7dec00308880dbdfc32d7105ce 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -9,6 +9,7 @@
 use kernel::device;
 use kernel::error::Result;
 use kernel::prelude::*;
+use kernel::types::ARef;
 
 /// The offset of the VBIOS ROM in the BAR0 space.
 const ROM_OFFSET: usize = 0x300000;
@@ -230,10 +231,10 @@ pub(crate) fn new(dev: &device::Device, bar0: &Bar0) -> Result<Vbios> {
             (second_fwsec_image, first_fwsec_image, pci_at_image)
         {
             second
-                .setup_falcon_data(dev, &pci_at, &first)
+                .setup_falcon_data(&pci_at, &first)
                 .inspect_err(|e| dev_err!(dev, "Falcon data setup failed: {:?}\n", e))?;
             Ok(Vbios {
-                fwsec_image: second.build(dev)?,
+                fwsec_image: second.build()?,
             })
         } else {
             dev_err!(
@@ -742,9 +743,10 @@ fn try_from(base: BiosImageBase) -> Result<Self> {
 ///
 /// Each BiosImage type has a BiosImageBase type along with other image-specific fields. Note that
 /// Rust favors composition of types over inheritance.
-#[derive(Debug)]
 #[expect(dead_code)]
 struct BiosImageBase {
+    /// Used for logging.
+    dev: ARef<device::Device>,
     /// PCI ROM Expansion Header
     rom_header: PciRomHeader,
     /// PCI Data Structure
@@ -801,6 +803,7 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
         data_copy.extend_from_slice(data, GFP_KERNEL)?;
 
         Ok(BiosImageBase {
+            dev: dev.into(),
             rom_header,
             pcir,
             npde,
@@ -836,7 +839,7 @@ fn get_bit_token(&self, token_id: u8) -> Result<BitToken> {
     ///
     /// This is just a 4 byte structure that contains a pointer to the Falcon data in the FWSEC
     /// image.
-    fn falcon_data_ptr(&self, dev: &device::Device) -> Result<u32> {
+    fn falcon_data_ptr(&self) -> Result<u32> {
         let token = self.get_bit_token(BIT_TOKEN_ID_FALCON_DATA)?;
 
         // Make sure we don't go out of bounds
@@ -847,14 +850,14 @@ fn falcon_data_ptr(&self, dev: &device::Device) -> Result<u32> {
         // read the 4 bytes at the offset specified in the token
         let offset = token.data_offset as usize;
         let bytes: [u8; 4] = self.base.data[offset..offset + 4].try_into().map_err(|_| {
-            dev_err!(dev, "Failed to convert data slice to array");
+            dev_err!(self.base.dev, "Failed to convert data slice to array");
             EINVAL
         })?;
 
         let data_ptr = u32::from_le_bytes(bytes);
 
         if (data_ptr as usize) < self.base.data.len() {
-            dev_err!(dev, "Falcon data pointer out of bounds\n");
+            dev_err!(self.base.dev, "Falcon data pointer out of bounds\n");
             return Err(EINVAL);
         }
 
@@ -978,11 +981,10 @@ fn find_entry_by_type(&self, entry_type: u8) -> Result<PmuLookupTableEntry> {
 impl FwSecBiosBuilder {
     fn setup_falcon_data(
         &mut self,
-        dev: &device::Device,
         pci_at_image: &PciAtBiosImage,
         first_fwsec: &FwSecBiosBuilder,
     ) -> Result {
-        let mut offset = pci_at_image.falcon_data_ptr(dev)? as usize;
+        let mut offset = pci_at_image.falcon_data_ptr()? as usize;
         let mut pmu_in_first_fwsec = false;
 
         // The falcon data pointer assumes that the PciAt and FWSEC images
@@ -1005,10 +1007,15 @@ fn setup_falcon_data(
         self.falcon_data_offset = Some(offset);
 
         if pmu_in_first_fwsec {
-            self.pmu_lookup_table =
-                Some(PmuLookupTable::new(dev, &first_fwsec.base.data[offset..])?);
+            self.pmu_lookup_table = Some(PmuLookupTable::new(
+                &self.base.dev,
+                &first_fwsec.base.data[offset..],
+            )?);
         } else {
-            self.pmu_lookup_table = Some(PmuLookupTable::new(dev, &self.base.data[offset..])?);
+            self.pmu_lookup_table = Some(PmuLookupTable::new(
+                &self.base.dev,
+                &self.base.data[offset..],
+            )?);
         }
 
         match self
@@ -1021,14 +1028,18 @@ fn setup_falcon_data(
                 let mut ucode_offset = entry.data as usize;
                 ucode_offset -= pci_at_image.base.data.len();
                 if ucode_offset < first_fwsec.base.data.len() {
-                    dev_err!(dev, "Falcon Ucode offset not in second Fwsec.\n");
+                    dev_err!(self.base.dev, "Falcon Ucode offset not in second Fwsec.\n");
                     return Err(EINVAL);
                 }
                 ucode_offset -= first_fwsec.base.data.len();
                 self.falcon_ucode_offset = Some(ucode_offset);
             }
             Err(e) => {
-                dev_err!(dev, "PmuLookupTableEntry not found, error: {:?}\n", e);
+                dev_err!(
+                    self.base.dev,
+                    "PmuLookupTableEntry not found, error: {:?}\n",
+                    e
+                );
                 return Err(EINVAL);
             }
         }
@@ -1036,7 +1047,7 @@ fn setup_falcon_data(
     }
 
     /// Build the final FwSecBiosImage from this builder
-    fn build(self, dev: &device::Device) -> Result<FwSecBiosImage> {
+    fn build(self) -> Result<FwSecBiosImage> {
         let ret = FwSecBiosImage {
             base: self.base,
             falcon_ucode_offset: self.falcon_ucode_offset.ok_or(EINVAL)?,
@@ -1044,8 +1055,8 @@ fn build(self, dev: &device::Device) -> Result<FwSecBiosImage> {
 
         if cfg!(debug_assertions) {
             // Print the desc header for debugging
-            let desc = ret.header(dev)?;
-            dev_dbg!(dev, "PmuLookupTableEntry desc: {:#?}\n", desc);
+            let desc = ret.header()?;
+            dev_dbg!(ret.base.dev, "PmuLookupTableEntry desc: {:#?}\n", desc);
         }
 
         Ok(ret)
@@ -1054,13 +1065,16 @@ fn build(self, dev: &device::Device) -> Result<FwSecBiosImage> {
 
 impl FwSecBiosImage {
     /// Get the FwSec header ([`FalconUCodeDescV3`]).
-    pub(crate) fn header(&self, dev: &device::Device) -> Result<&FalconUCodeDescV3> {
+    pub(crate) fn header(&self) -> Result<&FalconUCodeDescV3> {
         // Get the falcon ucode offset that was found in setup_falcon_data.
         let falcon_ucode_offset = self.falcon_ucode_offset;
 
         // Make sure the offset is within the data bounds.
         if falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>() > self.base.data.len() {
-            dev_err!(dev, "fwsec-frts header not contained within BIOS bounds\n");
+            dev_err!(
+                self.base.dev,
+                "fwsec-frts header not contained within BIOS bounds\n"
+            );
             return Err(ERANGE);
         }
 
@@ -1072,7 +1086,7 @@ pub(crate) fn header(&self, dev: &device::Device) -> Result<&FalconUCodeDescV3>
         let ver = (hdr & 0xff00) >> 8;
 
         if ver != 3 {
-            dev_err!(dev, "invalid fwsec firmware version: {:?}\n", ver);
+            dev_err!(self.base.dev, "invalid fwsec firmware version: {:?}\n", ver);
             return Err(EINVAL);
         }
 
@@ -1092,7 +1106,7 @@ pub(crate) fn header(&self, dev: &device::Device) -> Result<&FalconUCodeDescV3>
     }
 
     /// Get the ucode data as a byte slice
-    pub(crate) fn ucode(&self, dev: &device::Device, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
+    pub(crate) fn ucode(&self, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
         let falcon_ucode_offset = self.falcon_ucode_offset;
 
         // The ucode data follows the descriptor.
@@ -1104,15 +1118,16 @@ pub(crate) fn ucode(&self, dev: &device::Device, desc: &FalconUCodeDescV3) -> Re
             .data
             .get(ucode_data_offset..ucode_data_offset + size)
             .ok_or(ERANGE)
-            .inspect_err(|_| dev_err!(dev, "fwsec ucode data not contained within BIOS bounds\n"))
+            .inspect_err(|_| {
+                dev_err!(
+                    self.base.dev,
+                    "fwsec ucode data not contained within BIOS bounds\n"
+                )
+            })
     }
 
     /// Get the signatures as a byte slice
-    pub(crate) fn sigs(
-        &self,
-        dev: &device::Device,
-        desc: &FalconUCodeDescV3,
-    ) -> Result<&[Bcrt30Rsa3kSignature]> {
+    pub(crate) fn sigs(&self, desc: &FalconUCodeDescV3) -> Result<&[Bcrt30Rsa3kSignature]> {
         // The signatures data follows the descriptor.
         let sigs_data_offset = self.falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>();
         let sigs_size =
@@ -1121,7 +1136,7 @@ pub(crate) fn sigs(
         // Make sure the data is within bounds.
         if sigs_data_offset + sigs_size > self.base.data.len() {
             dev_err!(
-                dev,
+                self.base.dev,
                 "fwsec signatures data not contained within BIOS bounds\n"
             );
             return Err(ERANGE);

-- 
2.50.1

