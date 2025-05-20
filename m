Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E453FABE7EA
	for <lists+dri-devel@lfdr.de>; Wed, 21 May 2025 01:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B21810E62F;
	Tue, 20 May 2025 23:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ea3shUd0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2079.outbound.protection.outlook.com [40.107.92.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E423B10E5E4;
 Tue, 20 May 2025 23:13:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=H25qH040RgecXdYMVHkTqgsrqZLeNRmQnRhEGP66MTWV3FONuXgjEjTbSKbfd1Fh72FFBXiw+vg1soyt76om5WXS4iVhn4Jh8k0ZMfFgKMAESAqz3BXjuR2LIN5nGj4zU1vpS7hrwa4xK6lJ2ctR/SaIiWiEZGNL4yaRaSNMYUBCTxtAiAWtZ5v4cjps7U3pFxndGWlXKaYrySRlFWhCUv3MX7LnEeuC/+pU54N9rY4Fv4qJrsVINUgai0EWIKEqq01y2Y+dGYyiCEI7WnJiLI5EjZ20FJ6OvyYp6M7TVYBl6j+RxISrsUb8Jya528sinqIXcA+ktnAPRXr25ni+uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U6/vhJO1f5tQvKcAqYPGfLl3GBt3yjTuQcRG4mf7eIo=;
 b=W2zsAhwFuWUVYZSVhuyNNOjHjiQqwWpnJq004NyB9x5athcR332xAjCG0vSVOqvBiXyq9bcO8HBDpuuBulxHNZv09XGJaGAzvDCWX8PcGP4gHktfeI+d4bsxbltNvTSvIis++yDjnsOkuOl5WdMzN5LzUO9OvgCSC9JuewWfqHeI1Gzic4QXYnuwV9HMa9XC/jEMj5uVEF1TKCPQlMhhEnO78UtBNnaJu/XeyB8/ZiVobHmStGjDoE7ucTsmjTfNXqfHUMfkrUgrFnuDEoC/PdxxEaxDZDBFvOkTZ75OX9k/cietN8s5S5mOCVwKtVX+nL0s2n/PpuWth/FY2e95Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U6/vhJO1f5tQvKcAqYPGfLl3GBt3yjTuQcRG4mf7eIo=;
 b=Ea3shUd05LvmKDClN/Z19Fh7d8zQuLUd/Uxwh4/EGlXeHJLl+3hwDt8ZtwE1qUjGKjG3TiCZn3ANN+e+kxgZPhLftaVNq68yfuayFGx4o5MLdf2c/BOh0xplFaQgzZVLjyCdBfA8BEmChkTSH935/Rom7137RDMtbUc9Dl2qeZs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by SJ1PR12MB6267.namprd12.prod.outlook.com (2603:10b6:a03:456::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 20 May
 2025 23:13:49 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2ed6:28e6:241e:7fc1%5]) with mapi id 15.20.8746.030; Tue, 20 May 2025
 23:13:48 +0000
Message-ID: <24bbb5b6-6812-471b-af0d-2b16ff964078@amd.com>
Date: Tue, 20 May 2025 17:13:44 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd/display: no 3D and blnd LUT as DPP color caps for
 DCN401
To: Melissa Wen <mwen@igalia.com>, harry.wentland@amd.com,
 sunpeng.li@amd.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 airlied@gmail.com, simona@ffwll.ch
Cc: Michel Daenzer <michel.daenzer@mailbox.org>,
 Simon Ser <contact@emersion.fr>, Xaver Hugl <xaver.hugl@gmail.com>,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250425205236.318520-1-mwen@igalia.com>
 <83af5681-7061-427b-a429-785b70a14652@igalia.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <83af5681-7061-427b-a429-785b70a14652@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQXPR0101CA0046.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c00:14::23) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|SJ1PR12MB6267:EE_
X-MS-Office365-Filtering-Correlation-Id: e6989d8b-3d49-46e6-ec7d-08dd97f3fa2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Zk1vK3lpQmJRZTdiV2QrVllaK242ZndWTkRmUzI0OVZjVFFxOEt2eE9UUjk3?=
 =?utf-8?B?clFaVGlUUFk4ZTJldGx0a00zeFZCZnI1eEhJYm1nSmFJMHB5a0Q1aFo0OWZw?=
 =?utf-8?B?NEQwZG1Tc2lBdktqc2pPNVhXaVBmdGdDamVHT1ZQaC9QQnVqeFM0dG5CcVlh?=
 =?utf-8?B?Y2hzOUhxVHRvREYwQk52R1UzeG1yK1JUSlpwNVMxN1RXQWNNcEliTUxEZk52?=
 =?utf-8?B?WkQ1cDVXazdxMitVOVNRZmoyWG81TDNZZVRka1pRUVpLWEdTZk11WVRUQ3Nr?=
 =?utf-8?B?anptdFp0VW4wVzAzMG92c2F2YzJPbkN3ZUlYcitIOHFGVDhpL0VRaHBXS3l2?=
 =?utf-8?B?NytjWXUxUk5FaVdrTUIzc0txcjVxTCthYVdaaEJiWXN5Q2JaYUZBQTZFRTc5?=
 =?utf-8?B?SHZDN3NjM003VzJ3ZVpRYVZMbHlaeTdNbFVVNmZ5SU1rVXd5QkFRSTJRWHl2?=
 =?utf-8?B?RzhpSHVKcUpjYXA1NHJxT2hhcXVzR0FLSzFoSnNVNXJhRFpjaWNrNVJ3WVY0?=
 =?utf-8?B?Y1hnZUdLdXFsWmFUTzk4ekhxMzk0M2NJOXYyd3ZLUXpTcklJQmlINy9naGcz?=
 =?utf-8?B?V3BKaWNlNG5KcUMwOEh0Q1pvelQvTXJvNzgwMFhGWXdkQVhjV1Rub042akdL?=
 =?utf-8?B?eDFwZXdNNGh0NXdidmhZMFB2SE1LRnVsb3RnYkJ4dXBSYkIrTy8zN3BiV09U?=
 =?utf-8?B?WnBxTmU2U2p6ZUFub05UWmtrcThKVDFwZkJBc3lzenRKL004SkhzalF2VG04?=
 =?utf-8?B?R29WYUtLUkcwSEt3UFpuQ1IyNWFkcjlMN1RkaDE0cXNjcUxSVHVaRVhmOTY0?=
 =?utf-8?B?UGc2THpHSHVwZGtPVWZmZ0Z1TVdnK1YzZmFZeWFUbi9Yd0VnYThaV3RUaXVY?=
 =?utf-8?B?UExYUC8zTndkbENGczVBUVRUeFJyQkU3UTlvanBJWDIreVhQZk55anUxNDBi?=
 =?utf-8?B?WGtST2wxSTBDdWhNajZ3K09NTTJlYUZwNDkydm0xV0RyVVQyQmdERDNTdkp5?=
 =?utf-8?B?Vk5iUDRjcy8xTjJLdWhHY3REY0VSNk8vQ3hWc25oSEZKZEhxZ1VjaUMreWJX?=
 =?utf-8?B?NUJGdGp6TE9IS3p4VzJrazVUZkh5dUxhZktDRDJkTzdLYTdMNzFrenVCRHRD?=
 =?utf-8?B?YnMwZUJjUmhRVHNMa2Q5VHVSeEU3WVU4T0tHMitlN1JoY2habnkrckdOTWJp?=
 =?utf-8?B?citNMG9ycEUwemNKUlQ4dk1CNmwyZk1ZY3VCWXpKOWpBdDNxQXNtM1hRUE4r?=
 =?utf-8?B?Nk9Pc0RqVUJFUzVuanBwc1pYa0RTSkRpZVN6QXY5NUgxNE04QXk3N2Fmd2RY?=
 =?utf-8?B?WFZyZE1uVXlSdTFNdWJqTXErK2ZJRXlzdXpkMllmVHdUQkVsQzU3Q3kzckly?=
 =?utf-8?B?dmQ3TEhZM2MxRUEyNGVVMG5uemRjRDdENnBpNExEeXltMEtacnZXZzA1QWNQ?=
 =?utf-8?B?bFdxL0h3ZnRuT0F1aGdDNm5EaFRXWUZiTTEvVjJxZUMvMDI5Zk4vYzhIaS84?=
 =?utf-8?B?dCs0NnpENVRpK1JlMWgxdDR4OUJJT0hvNDNyQkxuVVhvUXBOQTBDUTBhbFZJ?=
 =?utf-8?B?eTBZdE9GWkV1RXVhRDZYZkV5WXRXZktjNDZLcURrUncrTjh6L0wvdVlsTlRM?=
 =?utf-8?B?aFNHSDJqOUU0TkxBMlAzSTZBYkJQclROTXpyK3JXakpZYUVpRWxidnJnQklL?=
 =?utf-8?B?UnFDLzBSNnpGVzNZSVVDNGl5YitRQ29xZ0JHQ0xLZ1A1QTBqK1ptY0ZIT213?=
 =?utf-8?B?bDRMdEdjMjFiVVNkRkZWdWxsa21qb1NQVjVqN0c3c0kxRHNPdDVHZlJ4TGo5?=
 =?utf-8?B?NExKUjV2SFRES08wcVJMdm5LKytNaDFFZjZjZ0djbWsrSzRISzZNdmFIbzIv?=
 =?utf-8?B?UEEzNzZNMzVkckdFbUJZNFlRSjJES21nbDNrWFQ5bWJUU3VNSTd2MHdaeTUz?=
 =?utf-8?Q?fHreijoA/GQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MFVSS2VGazBYMzVmc2hPQWZnNmxlWXJlb0tLTU85OTBRdWIxVXg1Ti8vTm9w?=
 =?utf-8?B?bG1UWVFsUWZ6a3grRTNOTHc2NHdxNGptc1M3em5nb240T2I2bWtmc29JbnVW?=
 =?utf-8?B?aEtVM25wTDY2TW0rY3ZhOEZoYXUvd2RRV0RxaE5PRDU2N0pjckFYN0hZWHdY?=
 =?utf-8?B?THF4bEtwdDlHYXJqR2s4b3BVZSsyWGFDOWtoeHFFMGllZ1RBTEd2dVJFb3dv?=
 =?utf-8?B?TUdFYzNtKzcvQW92ZlB5a3hjYzFwY2NZKzYrRHAxNHErNXozenpjQ05WL29p?=
 =?utf-8?B?Qmp4bEVtdEJzbnltdGNlVmtia2loTDBPbzcrbHdjcVUyc2YzTjJZdkdmTjJE?=
 =?utf-8?B?ZFNKUUl4Mm5WK0x1N3dwK0tXOTJwaklITGRydXlqb0dpL3Nja0dJd2Y2Wlp6?=
 =?utf-8?B?RmNuWkpxUm81ZHZ4bndtNHRsOHg3ekhYUmlLSEdNZHpMVFZLWUhLRVAzbyt5?=
 =?utf-8?B?bGJSRjVqL3p6YzUvTkhSaElVTXk3MGI3YlptRTVMYUJ4Y1VKQVRITlJxNnY4?=
 =?utf-8?B?YklGb29YSHE5bW5laUVza1V4UDBseHU5UlNjUDRXUUtzVnRSeG1tNW9nbWo4?=
 =?utf-8?B?MFZqZHhYZjNLeTFsTVV4aGF5anpzUWw0MzMxN1hJVXg1SThNOE9hNWZDNXVK?=
 =?utf-8?B?YXYrQUFXL3o2VUlXTjRHcmdQN3FCRTU1L2hNTFRaQzM3TTFpU1RwSjY4NDBr?=
 =?utf-8?B?aGFkZHNTZ08xeGUrR0FpZlg1VXdoZzV3MEMxMUtTQjF4WVh3SEVoZE5JMXVw?=
 =?utf-8?B?TFVreXpuQ3YxVEkzdHVOLzEyUXdCK1pxL29US0pxazhBbVRpT3ExRzZLSkJ0?=
 =?utf-8?B?MHhiWGdlcGw3dmZ5Y2dhc21mMWFNWVYyQkg1Z3VFWDZsNk5qOWF6UUN3N3VL?=
 =?utf-8?B?czdieU9PcTlpZWdtbjZKZGVJdUpUa3lLQTFtTGx6K3FLN3BTUFVZMW9lZFRq?=
 =?utf-8?B?ZmQ5SHZSclh1MGgzOXBtcmVkUkZubVRVY054SVVuN2VPWm1aUGVhWWxNOHZv?=
 =?utf-8?B?TDdraFYvdFJPTUFkUWNkK1BLMTRFZlZkMUNwT3M0T24vSGNraXpVbk12YWFt?=
 =?utf-8?B?aUMrc2I2bEtGWS92azBPdlhBNG9rQW5yNTIyUmlORENSL2JJN0tGVkhYRk1F?=
 =?utf-8?B?TDZ5d3ovb1pXcnFrb0lDSG9DaTRmRUJ1SEpvRUVTcitoUnUrV083cG9rcXky?=
 =?utf-8?B?cG0zMVVRZncySDJSNGJSL3cxeVA4RW1wSTFDNFlQSDV0bCtoemh1OHJrL2hO?=
 =?utf-8?B?SVZlWWNsZ1MzR0d6TlZOZFJuQ28xVXIrQWt6T1hGaUJKaGQ3bUl2S2svVGhK?=
 =?utf-8?B?U2Y1bXlJb0gvN1E4KzFoMUJvV25jQmRyaEhTbmk4WU02VXB4M0Q5bmJRWHBp?=
 =?utf-8?B?TkVUUDR5UTNPNzVwajgrUVAvZmlVcXNMajZIZzFpd3R1d0pRbEwvVHkzaXBK?=
 =?utf-8?B?RDJrbVNja21wZUNuYS9wcHh3Y0kvMkx0Y3BZR3liT2tDMU91c29MR05Hd01U?=
 =?utf-8?B?dXc0Z2F5U29TM2FVR0lkWktxdDluaFVXQmcvTWxGMHFkUk16WTFvalFpc1l2?=
 =?utf-8?B?MjJDTHEwczdnRUtkOUtySTJ5bldsRDlEYXBUNjRETnJpUHB2dnowUkplQnRQ?=
 =?utf-8?B?T2ZYNDdLOThxQmNyVTAwMy9VUDdHREFMaTYvWEU1a05wcnhpMmxxS2tKSnl4?=
 =?utf-8?B?R0s2alpoM0gyUTg2dlc3VmN1TE1XVFEraFViQ2w5YkJwaHowSGVjQmtTZG9a?=
 =?utf-8?B?c1BsTm10Nm1WYVM3clcxVjlzYUNjWFdydFBpbnBNN1hkdi8yQkdHNjd2M1oy?=
 =?utf-8?B?bGR2VE5KT0pMejNTOFNLZmdHeXd0R1RsUWthVmdxTktiSkEyWUx6OVNYbTJx?=
 =?utf-8?B?TFh4QmRQeEFDRHJHcnZHR1IrNS9lL1lOTXp0RjJnYXMxTnhUSHF3MlBSS0xu?=
 =?utf-8?B?Wk5qRy9QSm8rbHc3c002WDIvLzlsOHpSU2VNb0ZIbUFHQlk1cHAzSkVEY01R?=
 =?utf-8?B?S0k0bXdlaXZVN1VoYTJMRmJoUjVDOUVXMFh1QVN5WERLSjJRYUVtRm1kREto?=
 =?utf-8?B?THpRb29CbUNuQ3h2NldjTUY3K1VnME1kUzUzdTlNWEQ4dFRncGJFWTEwRjgy?=
 =?utf-8?Q?HeAtExHFZur8izdw/rnl6zWWK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e6989d8b-3d49-46e6-ec7d-08dd97f3fa2f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 23:13:48.8862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bRwg6GPYPpMqhBVLJhKNUYh6CgBPKlvfYp9pXW7fzbhe036Rv6B5Xq9tHCX47idEEIYxdzETZg9AF/p4QlzAMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6267
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

Reviewed-by: Alex Hung <alex.hung@amd.com>

On 4/29/25 16:39, Melissa Wen wrote:
> 
> 
> On 25/04/2025 17:52, Melissa Wen wrote:
>> Match what is declared as DPP color caps with hw caps. DCN401 has MPC
>> shaper+3D+blnd LUTs that are movable before and after blending (get from
>> plane or stream), but no DPP shaper+3D+blend LUTs.
> Correction: shaper+3D LUTs movable, and no DPP blend LUT.
>>
>> Signed-off-by: Melissa Wen <mwen@igalia.com>
>> ---
>>   .../gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c  | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/display/dc/resource/dcn401/ 
>> dcn401_resource.c b/drivers/gpu/drm/amd/display/dc/resource/dcn401/ 
>> dcn401_resource.c
>> index 5b7148bb1701..3b142e662c7b 100644
>> --- a/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
>> +++ b/drivers/gpu/drm/amd/display/dc/resource/dcn401/dcn401_resource.c
>> @@ -1937,8 +1937,8 @@ static bool dcn401_resource_construct(
>>       dc->caps.color.dpp.gamma_corr = 1;
>>       dc->caps.color.dpp.dgam_rom_for_yuv = 0;
>> -    dc->caps.color.dpp.hw_3d_lut = 1;
>> -    dc->caps.color.dpp.ogam_ram = 1;
>> +    dc->caps.color.dpp.hw_3d_lut = 0;
>> +    dc->caps.color.dpp.ogam_ram = 0;
>>       // no OGAM ROM on DCN2 and later ASICs
>>       dc->caps.color.dpp.ogam_rom_caps.srgb = 0;
>>       dc->caps.color.dpp.ogam_rom_caps.bt2020 = 0;
> 

