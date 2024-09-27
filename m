Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F1CF988ABC
	for <lists+dri-devel@lfdr.de>; Fri, 27 Sep 2024 21:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78D6D10E279;
	Fri, 27 Sep 2024 19:27:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FPHv5nhL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C820910E031;
 Fri, 27 Sep 2024 19:27:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S7agm+Z1643w+OATFQ8oVjc8KD8rvHaBxpzMbg/iA87B2uXP7Z4gKbhAJXVEudl2kq7hZ/1cNYaA49kbLD8aeNIkdm+YA9D82UPUjLsY4QJz/3ZHeNokGEK4eb96yYV/H2g9fsCdi5uZisLmk9VCsg0ekr4+J6XmtIDfjg8hEvKJacl7Bro5dHU1ifTjzpC+FL7Q6bLX1xvoKqaNSc5vT9x3UgnwOQtMJ8wvFPEFoBn52r10ahPrKdxqWgODbhT3tXOqO7xdgIxKjifi+GSxMsWAeHvqzfe/DFq3GC/55/uIUuHlExdi8p+zD5ZL6tss+PYpTAwa8m7dCgBhfIftjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KxyE72l74IqyAJfOeHDHgUShRmZZi3Xg/e8E2rO3yiI=;
 b=Xlq7JbQ1YeTtQLtLiptv2d2XEIxLsJSLF0EhAz3KgMcuPlquhuhdiFB1sHjy+7urJU57yrrxKIzhjUygJd0OYYd1ryyT+vuItH2M7cjNv5aNen9ofBlwIeBJkCNeqLH1EEJPy/k4SNKfiMEh6YSMGcViV//hVSbn+AyENCHFVRVPusKVaLYGkgdvmEQRrhzj9R8m6R28R0r5DjfyxknbgF1iAvJXj1hGIVl69V2CI20fssLyrfDWcAc9vzLs0oxoGKVVNTYf8qZHBAdyf/AvbAqVKt2lsu97LpJtVtYQi3sdQqV2xv8RmyvYiPJ+BOKK1yC591Fur6qy0Aqokdft9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KxyE72l74IqyAJfOeHDHgUShRmZZi3Xg/e8E2rO3yiI=;
 b=FPHv5nhLJO4VsUx6dktG6kdfuDujrwUk59iNfeqlChMFYWFodm7ZjqzVg3lpEn9g//2TE4fJnIgSGrRlDCPLhnD9gRUWI0GEgrZtGZaaCeQaS70pUk5KstPOdG6KKtb7bAGl8cS/CKQFIvod/wGWKRvlEwZqyr9ufSUW4loR2r0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by DM4PR12MB8449.namprd12.prod.outlook.com (2603:10b6:8:17f::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.28; Fri, 27 Sep
 2024 19:27:45 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%2]) with mapi id 15.20.8005.024; Fri, 27 Sep 2024
 19:27:44 +0000
Message-ID: <53d17411-f906-4a83-a44c-d8de22f11cbc@amd.com>
Date: Fri, 27 Sep 2024 15:27:42 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] drm: Introduce DRM client library
To: Thomas Zimmermann <tzimmermann@suse.de>, simona@ffwll.ch,
 airlied@gmail.com, javierm@redhat.com, jfalempe@redhat.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20240927144252.31813-1-tzimmermann@suse.de>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <20240927144252.31813-1-tzimmermann@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0102.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:4::35) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|DM4PR12MB8449:EE_
X-MS-Office365-Filtering-Correlation-Id: 654f958e-888f-457a-1c62-08dcdf2a7603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VFRqdHpDRVBnejZmbUFrV0swcEFMVnpTLzRtc0pocmNYcE9tYVlxUjN2Z2Zq?=
 =?utf-8?B?SHV1UGppK0lQRXJLVHBnVER3NWFNZHRTQTRCTWI2a21pMC9zcmtXSGp3cVBX?=
 =?utf-8?B?U3R5N3NEVGo2eHdDZHB5bmk4cHBoU0JtRDBjSmorVU5Ma1hvK0xaWG1iZGtH?=
 =?utf-8?B?cHFBOENqTWFWQTN5eHZ2R3hHeFBpREFMSHlJNWNhaWU3cFVua1NCVEpPR3lO?=
 =?utf-8?B?cm5aTnlwaXVUdE9GdHA1Z0RpNFQ4VzhGTXIyb1MrVzNXMGd2RU1iNEJRNEVY?=
 =?utf-8?B?Tkh6MENEVE5lU0RhVTlPbFpSTEErVFU5bW5jR2IxWGExNlpjVHowZmlaM1Fk?=
 =?utf-8?B?TENkeCsvRlJLNjg2MDFMUTVnTXgxNzZFLzh4eXpYR3M5UGVhT1g0RmE0QjN4?=
 =?utf-8?B?RWJIOTNlQTBkbFNnelBBd2tJUGRZUWpkWEd6K3Z0cVpVTEFCNkJGRTVmWlB0?=
 =?utf-8?B?S0ZsZ2U5ajd2QWRTQ1gxZ3lYbFZTejdCazdwZGVFR2xnU2N3NVZkOFFjcmxU?=
 =?utf-8?B?dHFOdmpKb1pXTTRjZkY3ZHlvQ1c0aG1GRFh5YUR5NnJaa2grY1RJRVN1VDJC?=
 =?utf-8?B?L3VHSzRGRjhvbFhTZ0dPM2tQSlVrTlZ5Q09vaitneWw2eU1uQm9vY0JDUlZI?=
 =?utf-8?B?OTQ0R3hOMElpdFNUVHVSQlVSRSt0TXFxK201dmVBenZoZCtlcEJTVGxoVk5w?=
 =?utf-8?B?RVp6YklQK1JqbDdCamNtUnlrOUdUNmowYjhYZ2VKMGVGK3gvQ1pLaUMyNGFJ?=
 =?utf-8?B?QXVyU2h5LzQ4aHZhWU5Jbis3cm9JeHVIeEtCSlpIelQwSDBwOEFkcGJrcXg5?=
 =?utf-8?B?RTIzeXIwYXBkTzl6SHFVellzNXBaSHNwMC9RNmM3a2p2RmdkNlhqVENGNW16?=
 =?utf-8?B?VnJKcDdWWndLblQ2akNWTzRjU3ZXb3hIWTZqTW5MVktUZGNrNmNpMEhNWHNi?=
 =?utf-8?B?bTV5TlVBMkhDMVdFbzlDNjZIeW1xSlFtL3Z0VXM1MDIyUVBldjk4QXJ2QVlM?=
 =?utf-8?B?UXh6cUlRakVLbDZwRCtmQ0gvbXhTazd2cEVBM2k1K25ZTTRKbDJxYTl5dndX?=
 =?utf-8?B?UTlPT2NJY2doS0VTS2lKMlA4VitSVDg2a1k4MDFiSEM1aTZabWdkQU9uRi9m?=
 =?utf-8?B?dG5SVXA1aEowVnRhUlFQeTZQY2FIWGk2QXZyd2lGVXNidDdLN2RVbHd1QXpi?=
 =?utf-8?B?VEFJdlB0bGJtam9WbG4wZkJnamVYbUpMcFpEMGcyd0lFYjBHajJ0RldpZU5z?=
 =?utf-8?B?UDFEYXg1TWVFQlFjMzMwUFRuSGFCcHVDSkl4QlFkMWZ4S3VKeWhTZ3FzU3RK?=
 =?utf-8?B?bjZMbURyakxDTzJFbVlhWXdXb3hidnIxYVVVRy8wZW9MLysyMTRyMWFlelJC?=
 =?utf-8?B?bC9BNmc0NzBoN2ZoZVlsU0hZN20vZk5JcVB1V29XbkJyZThxT29uT2ZiSHVu?=
 =?utf-8?B?NVV6Y2tEOVY2Z1NmZDNTRFhZUjYxOG0zVnp6ZXkzeDlHOEg1SDBqazR0TzJi?=
 =?utf-8?B?NW8wL0xQV1hFWXFSckpFbXEwZ0xNekNjV2poQzgwYkJhMWZ2bGdvOUFNNkNx?=
 =?utf-8?B?RkRMRllzRzg4eitIVWVxdFlLTmN0QmRiSFNKMkI1emNkZGhHc2ZQSEM0TWE1?=
 =?utf-8?B?c0NuSEtneEpsWWlUVUxDc29sQ09sOHY1VlVHaDVIOG9mSllqdWkzTEh3a3Rl?=
 =?utf-8?B?T0VmSVFVck1MZmMwU2pkVkhSaXNDeGkrbUo0cUI5VDlDRWpDOWJRSnE3MGNR?=
 =?utf-8?Q?TGsvzXCCENawz2G69I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S20rU1E3WFRYRS9CWXdqTTRkQ1ErYnowZnRQUkpQM0NZbks5Um1LZDZDZ0JZ?=
 =?utf-8?B?bUNJemdvQmJCbHBTOUp6NmdFd0xYMVNIMGJzenk0YWlYV054VW1ieDVaMlhT?=
 =?utf-8?B?c2NZT1ZwWmZoWkpXRFJma0IxWkN4cVFPaUFKV1pCdDJ1djZmVEpyVEFlWEhB?=
 =?utf-8?B?aytEbi95WkMveUdVcVRtdmxYV21oVytGRk1Wa3NZMm9WRlMveHZ5NzdRMlhk?=
 =?utf-8?B?Q1QyL2ZhdExaVmpjdC9XQ242M29MMk1yM1VqNHpsckY4djcvb1daZjRKeVBY?=
 =?utf-8?B?RnJ4YTgzcTZyMlZnY1FIK2xybVJVZytkaThLN1E2VTFrNEoxaG5tbWw1RUtq?=
 =?utf-8?B?aVRDSzREZHRxYkllMXQ3MWFDaVh1SU1zbGdtM29uVjhBdFJDN3lyamtKeldE?=
 =?utf-8?B?QkRESXhISmxIeVA3UHZVNy92RkN4YzdxNi9WSHAyNXlWTk9mZDREakhTNFpp?=
 =?utf-8?B?OXArNDU3ZVR3Wk5NYVRIY2NIYW9rN3p4Rkg3S0FZMXFvRjczcCtOZTFxNVl2?=
 =?utf-8?B?aTJHcmtWcXNxcE0ycTlYM1U1V3BPVTdBcUdNNDZUU1JPOVQwWWtBeG5ndXZr?=
 =?utf-8?B?aHpZUDhQbHlJSGw4bllNcmtodlJnK3A0cTJ6NVNDZGE2emc1bDk1NHV5V0ZS?=
 =?utf-8?B?TTcxWkxBRW9BaHcvSFE2RWVUZVFLZk9STi9oMnNnU1dIUlIxSk5XTUJHYXFw?=
 =?utf-8?B?OXR4STVjS0l3TUtiWTJHcVA3dUdRbCtFZHp1SUpvcUJuWVBDaUo0YVhVUEd6?=
 =?utf-8?B?S1lMM2hDRFJsb3JQcEV3N2phMXRyR2tnSXkwSHRQbmZDZDBCNjJ2UmxyRS82?=
 =?utf-8?B?UWJPT0xFcmptdkJuMXUxTXhCYVJqYXIzZHlnbHM0cDdiNlEzTHZzbzBCVGlh?=
 =?utf-8?B?NlY0MDM4WTBmSEx3Zy9qNHV0QVFjMlc3QlZObWRvYkk3eTFQb3l5Q1ZhcERS?=
 =?utf-8?B?U2dRL0QrSjdqcUh2clpKUDc3TWZSVVBTVFVFdzl6ZTk0NXZjcUlCeHVRTTdL?=
 =?utf-8?B?TGErVUZYTlFiUjFFSzAvTnFHWnhFZlRndUc4SlpVaUNHeUo1QThXUTF3dHpl?=
 =?utf-8?B?NlhpTDFNVU5Pb1ZyOVhCaFdSdkVGQjBFNHRheHBzdU1hWU9iNE9yMUdZd3NT?=
 =?utf-8?B?WW54NnlheDdkOHVMTDR2UUtXcTV6QW82NFoyNVZUQUFEYmVJK05rMmhKbm5K?=
 =?utf-8?B?QTY2NVBzNXcyQm4vQWNLakJsNlVRTkJJbDQ5MG9jMmRMZG9DMmloaFlhdTdw?=
 =?utf-8?B?WWxuUjdTM3VteDJ0Uk1hV0lkaDlveEJLcElYNFh4Tm45OFlVZ01xMWVWVVlH?=
 =?utf-8?B?akpQY0d5TldsSERDTEVzeWlhWDNmREJ4WnVLSGY3cWl3TjRSUGJJRVAwb2tS?=
 =?utf-8?B?a05rOW9RNVBzWWtqNm5XTkljbWhOeTByYkxpTmJmdTl1RHRsUGFlSzJ0QTVo?=
 =?utf-8?B?WHBSTDlFdDVZaFZFakl5NmhKampxQnp5cVo4bWxDTGRCR0xvZ1ovNFp0V21O?=
 =?utf-8?B?QWxGU0h2WXBCTGE1ZXNKR2NsOXlqRENoM0ZDZkxqSThlekRDbk1sZmNVRmcx?=
 =?utf-8?B?T2h1dnlKTTVINkJqWXMyWUVOeUJhMjhETGwyQnY2eWRBTlowZU5QVjlxd2xa?=
 =?utf-8?B?SzBWMk9pZ3ExNFA4d2owZ0dwd2dZZ0wrYk5zejUyRXR4NC85eW1JMzQyZVJ5?=
 =?utf-8?B?UU1LZ3NxVHlKMWhaQXhmRGZvUG44N21PR2duU3BsczBpOTByTzF3WGFrOFJ3?=
 =?utf-8?B?dXhqYkFreDdhU1ZVRmEvOEE3TlRVMGVsT2JKaWVjVEVadGxSOHZwdlBsdlBp?=
 =?utf-8?B?Rk1ZcnJDMnZaUFlIRFZPb3diT3pocWh3eGhnRGZURWVhOThXeW8zNENGSTBW?=
 =?utf-8?B?cXJPVzBjRnJuejE2dHQvL3d4RXBtcnBmc1E0VFRwU2JjUVRuY0NjclBENHpm?=
 =?utf-8?B?RnFLQmZtVVJ6YVpYSTBzZ010N3FLa1dMd3QybjEwNUtKTm5SbElOWm5GdWh4?=
 =?utf-8?B?azNsWVBqZFBMa2ZWZFhFZ0RzMW0rK3pxMm1MR09oaU8wUG5LL2lpcjYrLzA1?=
 =?utf-8?B?Qk16UUd2ZlhlY2JVK1c0blkzWDJyQUZhSTFtSzBSN2tRRyt3TnNPMm5XMFRl?=
 =?utf-8?Q?vKFc24A4AC6e0SrX/3l3Vfix6?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 654f958e-888f-457a-1c62-08dcdf2a7603
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 19:27:44.5486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gA/zteJ7zkTOv51PKNHnGrsgB2RTTTqvplBURLLNLpYj/JOynGHc6L9vnyNXKRqvPXdfDBYhubcbFATrkiOiFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8449
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


On 2024-09-27 10:37, Thomas Zimmermann wrote:
> With the next DRM client coming soon (drm_log) and most of DRM's
> fbdev emulation consolidated in a few places, it's time to provide
> a single place for the clients.
>
> The new module drm_client_lib.ko stores most of the common client
> code. It's designed such that drivers can opt into client support,
> but the presence of the client module depends on the user's kernel
> configuration. Without selected clients, no client module will be
> build.
>
> Thomas Zimmermann (5):
>    drm/i915: Select DRM_CLIENT_SELECTION
>    drm/xe: Select DRM_CLIENT_SELECTION

BTW, we are using drm_client in amdgpu, as well: 
https://elixir.bootlin.com/linux/v6.11/source/drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.c#L155

Regards,
   Felix


>    drm: Move client-device functions in to drm_client_dev.c
>    drm: Select fbdev helpers for modules that require them
>    drm: Add client-lib module
>
>   Documentation/gpu/drm-client.rst   |   3 +
>   drivers/gpu/drm/Kconfig            |  34 +++++--
>   drivers/gpu/drm/Makefile           |  20 +++--
>   drivers/gpu/drm/amd/amdgpu/Kconfig |   1 +
>   drivers/gpu/drm/drm_client.c       | 122 +------------------------
>   drivers/gpu/drm/drm_client_dev.c   | 138 +++++++++++++++++++++++++++++
>   drivers/gpu/drm/drm_dumb_buffers.c |   2 +
>   drivers/gpu/drm/drm_file.c         |   2 +
>   drivers/gpu/drm/drm_framebuffer.c  |   2 +
>   drivers/gpu/drm/drm_gem.c          |   2 +
>   drivers/gpu/drm/i915/Kconfig       |   1 +
>   drivers/gpu/drm/xe/Kconfig         |   1 +
>   12 files changed, 196 insertions(+), 132 deletions(-)
>   create mode 100644 drivers/gpu/drm/drm_client_dev.c
>
