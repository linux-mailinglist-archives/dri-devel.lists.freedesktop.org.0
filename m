Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DC6AEDF8B
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 15:50:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 599A610E44F;
	Mon, 30 Jun 2025 13:50:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="XvCmqhkh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2C9010E44F;
 Mon, 30 Jun 2025 13:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751291409; x=1782827409;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=rTF7TtUU2FKRBPv7abioSolpRb5vm/JTasVkhqR3l34=;
 b=XvCmqhkhuinmyd18Ngvjr+Z8numebioSP1gaOB3E+b9VsXjdviwr3gh5
 6LoDsHvAMKgeyEh3FTI01N99f8FpM9ed+gzQ5URhX9j5x5Dp4HIEFASQY
 v3LwFit0vaP8VTGnxcPpfbwBe7adHlALhx070dYNW9mglM4tRhqFQsBNF
 amgoJHXsGrI5Mjh+nkBlK6U8xH/8BzjnYzOAhQ5dRO1W3OKKuDzFIqJKN
 CNIiY7tf3EyorJS7ocNkvSO2mNnCMhqQtZcCt1QonmW9BBqo1UfQcoXV+
 3e1YUze5sCO4Dp/DIFIKQcTfaG4qoVpWVhh1+uYH9+upobGPM3qvcCY12 w==;
X-CSE-ConnectionGUID: QKgcIxTnTGCtCSYHdcLS6g==
X-CSE-MsgGUID: wdwzrCgvQa+xyFqhox9enQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="52747790"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="52747790"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 06:50:09 -0700
X-CSE-ConnectionGUID: q50F1Qm8SWSiJCK4a0dQag==
X-CSE-MsgGUID: a/vHduS6RwaMRiTqS/IOHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="152857524"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 06:50:10 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 06:50:08 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 06:50:08 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.41)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 06:50:08 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vT1t/ezqQJXDW8xphBJOFU3jXqB2hm3yQxM2n8flNzvCDvbMtZGMtLgHWQCrHzRqUbfHtuCzkS9ACihdDFa/My0IcP5Ac+u0cRtqT39fuIIafPkaTp0iuh1uLrkoNwDeSN27TfEnDhwaeJ6iaTiJINTyrGHC7Az6nc9hHBW54ArZM8aSuxs5yk884waq5o9eSXDHGg+Okv0nnEJwH9eVo7NInVOzFO/SjEHcu3aQfm9EVrf/ANUPjlfUhT1768FWEEEUnJPCb28nmsFpulPxx+DqiGFTnzcR7qdgYjbW2S0nTvQgKMeW00NOCPN2c+aCOSawJxaY2E8nDr+6fKFEBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5si86jlntHB9FcXS7KxhdJVCIA1axzY5yrVrzKyIeo0=;
 b=fhpScqUFrSjbmleJ+s7uZQXROFWKhQhuGDf7zpOj0uZvWbF3sUVWrKqbwRieDhKGhrk+KcHK+KKJTDZ3BPWX1k6vTZlvzLUvISgEarMk1ECC9Vqo8/cyANsuaI0L8Hqn9Yb73wQZAg5hAdkdwUn19eTgq4U1ytqf7OukPk5ebzOPa0UVUGHAVTYNuL2tFAtb49ZYpaWmk05lUlUHLP+hV0Qs95hqsZRNMeJeamyBZ9a9uBi09J0OiyCVn68wlkWjX8sfvtfSwGSdMI9SGd1wOFML4RoFQuGo0YQ/HWXQbG1An41EIe7Au+jAkuvsdoSS6kP62vMiP8RlZlnlYtOjPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by PH7PR11MB6905.namprd11.prod.outlook.com (2603:10b6:510:201::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.22; Mon, 30 Jun
 2025 13:49:39 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::13bd:eb49:2046:32a9%4]) with mapi id 15.20.8880.015; Mon, 30 Jun 2025
 13:49:39 +0000
Message-ID: <db57e9a8-a6a2-40fd-a1d1-436b43d9f6bb@intel.com>
Date: Mon, 30 Jun 2025 19:19:31 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/10] drm/xe/xe_late_bind_fw: Introducing
 xe_late_bind_fw
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <anshuman.gupta@intel.com>,
 <alexander.usyskin@intel.com>, <gregkh@linuxfoundation.org>,
 <daniele.ceraolospurio@intel.com>
References: <20250625170015.33912-1-badal.nilawar@intel.com>
 <20250625170015.33912-4-badal.nilawar@intel.com> <aF8HWPn87kiP9-cO@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <aF8HWPn87kiP9-cO@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA1PR01CA0182.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:d::8) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|PH7PR11MB6905:EE_
X-MS-Office365-Filtering-Correlation-Id: d5ddf7af-3e4e-4a67-bb22-08ddb7dcf52f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NUVCa1hzdVdhM2xvVFNnVGk0bVNwL0VvTElCUWtVOHZHTXB4QW1WYXpXN1FQ?=
 =?utf-8?B?c1lMOFgvczY0QTdRcEhnd3U5cjR5SWl4NkV6Q2RrRkY0dWpLOUkwSTNLc0ZL?=
 =?utf-8?B?aE9wRFZtS0hnNHJUcGM0UC90SEpuYTlsdlpCYUJua2N1OXdxVmVSWmVWWE13?=
 =?utf-8?B?N1JUcjRCZmowVnhZdVVydnlUM211cmRPN3ZxT3Z0dHNmYzVzU1drN1p5aURU?=
 =?utf-8?B?aGVGTys1NHFicElpMHZZTFBtS1VkbUM2bWNMRGhYVWZrUGs4UW4xQW9tSzRM?=
 =?utf-8?B?SDN2enBTWU9sTFZZeDJldmsyYmgvVnRVSmZaakxCR3BYUnZrNW5mdXdZSFV3?=
 =?utf-8?B?ZDZoaTFIeGJBZGg4RmdoWjRpcEZZb0lZKyszV1RydVJwR0JZcjB1RzZ0VThW?=
 =?utf-8?B?SWptcUtuV0hVNldRQ2NPOVQ0bHg2b1BHVlJ5RHdWWnpaeWJKeVZEWVl6V1Bv?=
 =?utf-8?B?eHhLVnJqdkE3dVNGR28yaDlGaEhPTzlwbGNUVjFsMzEzbVArOXY0MWd2dFN1?=
 =?utf-8?B?OGpXL1RXeEc1d2FnS3JsYi8vK0crQWg5YTRDdzdCTWoyZGQyT3VTM05DV2Er?=
 =?utf-8?B?ai9GZXBCM0ZVZDhPenB3WVQ4QTVLMjJKdTBNZGhaekphOXREemk4NHdneXdi?=
 =?utf-8?B?cUFlQXpjMy8xMXJjQk1sblpOSHU5Ym9kdHhDdEVGYmFDRzJoYlJZNVRXM2pr?=
 =?utf-8?B?VndUa2wxaEQ4Slo5ZmdOcnl5cmVtSDNQaUUxSERBOE0zTWt4alZFUEVaYXpo?=
 =?utf-8?B?VzNjelNMc2grc0dtcHZVVnZqMC8xTGk4YjNhSS8xTWlZTUN6MlQzeVJrcTdK?=
 =?utf-8?B?TjhtMElNTTBKYVlxaTE1M0tqbjhjR2s1NzFwU2t5WVpNU045Ym5UdDBTQlVy?=
 =?utf-8?B?ZDluMjFJU3FHS1AvSHpvNTRrVVZlMnpCUXdvN0J0b1dsQTJaODlPdCt6ZVk1?=
 =?utf-8?B?L1pHZlVTS2Evd0hVazRTQm01b1NSeWcrZU90QS9rUzRhZTR5Y0M2OWlhMFFr?=
 =?utf-8?B?NmVmeFdIWGh3VkVqWjNPWGl1clpFUGxnOUllMHZGelFJbHRIWit6NjREbHMx?=
 =?utf-8?B?alRrUHZMSFlQOW5RdEc4UFRzSHRNTUVSRUg2NXNFQjVJRmIyQklTcFVLSUxE?=
 =?utf-8?B?Z3NkQldSOGlRNzVpNkxHczVnS3NsUStsN0tzdXhuK2k0ai8wOGZ6c25sY0Nv?=
 =?utf-8?B?UDJaT3NVazRtNWFuQVNrMksvVjkrTjdLR0wwYnZHTUNRMUZrTVhHRFlEc0RR?=
 =?utf-8?B?QXVXbGowdjFjTkRTQUF2TzlUT2Z4VUdrck4zYU4wV1JEOVJDQ3dLTTdHVWxw?=
 =?utf-8?B?R01PSDJBR3UxY3N4L1BSUUVmSmRSN244cU0vU09MaEg2aG9mN01ROGRudVdT?=
 =?utf-8?B?UVRmRWpieDV3TEhQbDJ6S3NJMXBRNXpjbHJPczgwVWZOdHU3K2Z3QnlRTEly?=
 =?utf-8?B?VjlPWnpNSUttNE1KZm5nY0ZZTzVtYmx3NDk3dVhqRWswNVcvN2VHNGxCY05t?=
 =?utf-8?B?aGZnVVlNaWk3elVTRkp6NWNHT2ZvM01VRVBsZGVmQ3V6bE1KZWtVK2pQNmFp?=
 =?utf-8?B?SzhyMzdQZWRhN2wzMmtVWjlYTkR3eE9rL2luSTVYVER5VkdMQXY2OTM2enlU?=
 =?utf-8?B?NHJiV0FpejA1dTc4UDZnemgxRHZEcUExeDA5a1lMbkxHbnB6cWpINlN0TXZo?=
 =?utf-8?B?eDBFSHVUTjg3WkhjRlA0U0t0cHJCSkxySDdnc3A3K2xYdkNnaVg4dWtvbXg4?=
 =?utf-8?B?VE1tVEs4bThTMnVjMWl2OHVCbE1YRVIrQjN4WjdxQ2IwVWxUSDlBUFFkZmVk?=
 =?utf-8?Q?eEbW2rs69QdCTBiJxM4FCF7J2ZXJWRUjqmUbc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OHdtUG1zaWd0WVAvYVRTYTNlWFZRWHV6TjJRdUtQdHNLNlVIT1ZIMnp4QkdE?=
 =?utf-8?B?dDFwbDNPZnJPV0hZemRIRUNYQzBrNkwrQkFlOHhYUXZTVXpUZldRS2toSlY5?=
 =?utf-8?B?bE9NWGN5VTVmTnR4THljdFlVcnkvTlpjdEdMOTJHc05TRkhWOHFVN0NjV3ho?=
 =?utf-8?B?WXk3K1QrV0ZUUXJTZHRVa2lJWEtlalE0MGVqVnI1VXU2Wm5sby9UaFBkd1hk?=
 =?utf-8?B?a2NBRDhyL2o2YWV3NHF1MXBYS0dna2JFMU1ocnZNWitFNDYvdEt5N3ZpQ3h3?=
 =?utf-8?B?dmROWS92UUZzRFBpQmV1RGlTak9KZHdIY3RoRkUvaFduTHVac0ZtSnJIT3RE?=
 =?utf-8?B?eG5UZW4rVFI3b3NnaEZ1WG5zOG1tbjdqSG52bXcwMHVQT0xKTzZsQVpEMlpH?=
 =?utf-8?B?VlM5WnFFb0VjT2lMNFhibHZpbHNhUFFURG9weEs0TWN1NFBlQlZYWmVjemJr?=
 =?utf-8?B?MGZSM285Q1R2UkVWNXBENWMvWHVSTnRBWWJFYjdCL1hSanNDZUYzZkVqaU5O?=
 =?utf-8?B?UkV6bnh6WHNSYmh0aFFJNDRkRjlidG1TYWw2YmNoMVBoTlBpQVBmNGsrYWwy?=
 =?utf-8?B?ZGN2aXJOT0ErdmpuRzN6Vm41blY4Sk5Mb1ByVUJnZFVoM1RVYUp6OTJVb0JU?=
 =?utf-8?B?SUpmRm5Mem1RSU8weEhwVVVvMTlUbnloOHd6blZOUGlEREpDWm1CZmU4UVVX?=
 =?utf-8?B?ZEZVSVF1MTUrcmVRQ0JIVUJkSnNQaVBuNUlrUnhOME0yZkMrNGxwbkN1MHl4?=
 =?utf-8?B?eUkrNElMOWxGSFArM3VCMkF3WEd3bXc4emNVOGw1ODJyTEc2Qmw0QXNXeVhk?=
 =?utf-8?B?TWlSNXd4SjdzQWRjSU1xMGZhZ0xmclAvWHNlTmZvSEwwdGlNK05tLy9JVGp3?=
 =?utf-8?B?bnJGaGlIcWxwVjJWQ0RTWW05QWRiMmVQTi90Sk5GN1ZVL3ZnYzkvVFZvZFQ3?=
 =?utf-8?B?WklEcVJFRHNkVmVQQjJDL0NteDk2S1k5dFQvaW9YSUZ4TzAzTXB2THRNNCtl?=
 =?utf-8?B?MHArZFpWM005UlNLcENia1N2aGkvbEtGcmlML1A1TjVVNnlJK1dhdE95MzlR?=
 =?utf-8?B?Vmc3QjRJd1pvNDllUEl5UEUxZ2VmUXNHbDlCblRZd1lFcTE4dWx5Z1dKdGpr?=
 =?utf-8?B?MFNRRWtEbjA2aFhNS2hMaTdpSm9LMVRYck4vYklkYU1CWElhV2JTL3VXMlFn?=
 =?utf-8?B?OFdNL0dMTFhwOVRXN09SRlRZNkowZGZyM01wYWJkL0dLdFA1QjlsdlNSR0Y4?=
 =?utf-8?B?Q1JYNS9zd2xxSnpXVXRydDhqQTFrWnNmMmJramNHQ1JtMElmUHZxeXdyV1hL?=
 =?utf-8?B?dHFiTU1QRFRuNWZ3QmdmOHFGRUxPRjVudWFIY0lKMzdBTkFKaXpwNm5MNERl?=
 =?utf-8?B?cUF5UmxiTkZMQjZ3WmNvVTdkZGk2MWZGTTQ4TURxSmlHcmJsUTdjeXVadndR?=
 =?utf-8?B?bGoweVBnNFZxb3VtNzFGbmFuTVB6OHBDeWZpVWtienppRzFZOEcrL2ErM2Fo?=
 =?utf-8?B?T1hjbUEwdy9Hc2ptTTM0NFZRUHNLLzhPckttWHdJVyt6RGJlRlVLNDNNejZZ?=
 =?utf-8?B?YVhMZFdRelA2RElJeEd4Y3NDZEswRzFZa1FINSttWlk4WXlOZjVIOVpHdGM4?=
 =?utf-8?B?UmdUaGFEam5tVkhENlBwMkRENFU3dGpFOURtNy8vT1VUTVZZeWVMQmZXUnoz?=
 =?utf-8?B?ZUZyY0hzcmUzVXNjdVQ2Y3pFTjV4cnZTQy9Sc1ZwTUpYT0FKa29XNlhKM1Vh?=
 =?utf-8?B?ZG03VHFYNytzSDVXeHVWSmxOSm44T0hpc095NVBzRitiNWdFTjZobDMrVW92?=
 =?utf-8?B?MjhEK2xqU1BaREYreU5RV3RlcTBFRm1rYmgrMEFHemQ3cVE4Qm11QnZpVjdG?=
 =?utf-8?B?cExpVy8zWXdySjh1VldSTSt4cFpjYm5CMXZIaTN5VUZMcUtRUG9XLzR1L2pi?=
 =?utf-8?B?eXNUNUkwNGhMTk9xQVVLVmFjblpqZDhwVlBPeklGbWJXaTk5b0kxMW52ZW5l?=
 =?utf-8?B?eko2aDhRWkVtQXhYcWlkenNucUwvTkZlZGpYSHJZaWd4RW9xWjl3NVBqb2Qr?=
 =?utf-8?B?QjRvWHZMU2xNVkZZWnl0ZWhVZXU4YnZ6WThiK2ljYXE3SG5sUllIN1QwNW05?=
 =?utf-8?B?R1R6eUY2WkZ4MnFmcUFTcmV2TXBtc3FOeVJud2xtODNYQ1BZdjlEMHZxeXNh?=
 =?utf-8?B?bXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5ddf7af-3e4e-4a67-bb22-08ddb7dcf52f
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 13:49:39.1994 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UXeoXiX5HmubQWgutEItXSdAE4o/0E//nUrZ6S0jZVm/E4VUGJ5ofiXPI371QBRKgroU1OAQt0Ub23lZ9psbTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6905
X-OriginatorOrg: intel.com
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


On 28-06-2025 02:34, Rodrigo Vivi wrote:
> On Wed, Jun 25, 2025 at 10:30:08PM +0530, Badal Nilawar wrote:
>> Introducing xe_late_bind_fw to enable firmware loading for the devices,
>> such as the fan controller, during the driver probe. Typically,
>> firmware for such devices are part of IFWI flash image but can be
>> replaced at probe after OEM tuning.
>> This patch binds mei late binding component to enable firmware loading.
>>
>> v2:
>>   - Add devm_add_action_or_reset to remove the component (Daniele)
>>   - Add INTEL_MEI_GSC check in xe_late_bind_init() (Daniele)
>> v3:
>>   - Fail driver probe if late bind initialization fails,
>>     add has_late_bind flag (Daniele)
>> v4:
>>   - %S/I915_COMPONENT_LATE_BIND/INTEL_COMPONENT_LATE_BIND/
>>
>> Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
>> Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile                |  1 +
>>   drivers/gpu/drm/xe/xe_device.c             |  5 ++
>>   drivers/gpu/drm/xe/xe_device_types.h       |  6 ++
>>   drivers/gpu/drm/xe/xe_late_bind_fw.c       | 90 ++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_late_bind_fw.h       | 15 ++++
>>   drivers/gpu/drm/xe/xe_late_bind_fw_types.h | 37 +++++++++
>>   drivers/gpu/drm/xe/xe_pci.c                |  3 +
>>   7 files changed, 157 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw.h
>>   create mode 100644 drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 7c039caefd00..521547d78fd2 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -76,6 +76,7 @@ xe-y += xe_bb.o \
>>   	xe_hw_fence.o \
>>   	xe_irq.o \
>>   	xe_lrc.o \
>> +	xe_late_bind_fw.o \
>>   	xe_migrate.o \
>>   	xe_mmio.o \
>>   	xe_mocs.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>> index cd17c1354ab3..584acd63b0d9 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -44,6 +44,7 @@
>>   #include "xe_hw_engine_group.h"
>>   #include "xe_hwmon.h"
>>   #include "xe_irq.h"
>> +#include "xe_late_bind_fw.h"
>>   #include "xe_memirq.h"
>>   #include "xe_mmio.h"
>>   #include "xe_module.h"
>> @@ -889,6 +890,10 @@ int xe_device_probe(struct xe_device *xe)
>>   	if (err)
>>   		return err;
>>   
>> +	err = xe_late_bind_init(&xe->late_bind);
>> +	if (err && err != -ENODEV)
>> +		return err;
>> +
>>   	err = xe_oa_init(xe);
>>   	if (err)
>>   		return err;
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 6aca4b1a2824..321f9e9a94f6 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -16,6 +16,7 @@
>>   #include "xe_devcoredump_types.h"
>>   #include "xe_heci_gsc.h"
>>   #include "xe_lmtt_types.h"
>> +#include "xe_late_bind_fw_types.h"
>>   #include "xe_memirq_types.h"
>>   #include "xe_oa_types.h"
>>   #include "xe_platform_types.h"
>> @@ -323,6 +324,8 @@ struct xe_device {
>>   		u8 has_heci_cscfi:1;
>>   		/** @info.has_heci_gscfi: device has heci gscfi */
>>   		u8 has_heci_gscfi:1;
>> +		/** @info.has_late_bind: Device has firmware late binding support */
>> +		u8 has_late_bind:1;
>>   		/** @info.has_llc: Device has a shared CPU+GPU last level cache */
>>   		u8 has_llc:1;
>>   		/** @info.has_mbx_power_limits: Device has support to manage power limits using
>> @@ -555,6 +558,9 @@ struct xe_device {
>>   	/** @nvm: discrete graphics non-volatile memory */
>>   	struct intel_dg_nvm_dev *nvm;
>>   
>> +	/** @late_bind: xe mei late bind interface */
>> +	struct xe_late_bind late_bind;
>> +
>>   	/** @oa: oa observation subsystem */
>>   	struct xe_oa oa;
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.c b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> new file mode 100644
>> index 000000000000..eaf12cfec848
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.c
>> @@ -0,0 +1,90 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#include <linux/component.h>
>> +#include <linux/delay.h>
>> +
>> +#include <drm/drm_managed.h>
>> +#include <drm/intel/i915_component.h>
>> +#include <drm/intel/late_bind_mei_interface.h>
>> +#include <drm/drm_print.h>
>> +
>> +#include "xe_device.h"
>> +#include "xe_late_bind_fw.h"
>> +
>> +static struct xe_device *
>> +late_bind_to_xe(struct xe_late_bind *late_bind)
>> +{
>> +	return container_of(late_bind, struct xe_device, late_bind);
>> +}
>> +
>> +static int xe_late_bind_component_bind(struct device *xe_kdev,
>> +				       struct device *mei_kdev, void *data)
>> +{
>> +	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
>> +	struct xe_late_bind *late_bind = &xe->late_bind;
>> +
>> +	mutex_lock(&late_bind->mutex);
>> +	late_bind->component.ops = data;
>> +	late_bind->component.mei_dev = mei_kdev;
>> +	mutex_unlock(&late_bind->mutex);
>> +
>> +	return 0;
>> +}
>> +
>> +static void xe_late_bind_component_unbind(struct device *xe_kdev,
>> +					  struct device *mei_kdev, void *data)
>> +{
>> +	struct xe_device *xe = kdev_to_xe_device(xe_kdev);
>> +	struct xe_late_bind *late_bind = &xe->late_bind;
>> +
>> +	mutex_lock(&late_bind->mutex);
>> +	late_bind->component.ops = NULL;
>> +	mutex_unlock(&late_bind->mutex);
>> +}
>> +
>> +static const struct component_ops xe_late_bind_component_ops = {
>> +	.bind   = xe_late_bind_component_bind,
>> +	.unbind = xe_late_bind_component_unbind,
>> +};
>> +
>> +static void xe_late_bind_remove(void *arg)
>> +{
>> +	struct xe_late_bind *late_bind = arg;
>> +	struct xe_device *xe = late_bind_to_xe(late_bind);
>> +
>> +	component_del(xe->drm.dev, &xe_late_bind_component_ops);
>> +	mutex_destroy(&late_bind->mutex);
>> +}
>> +
>> +/**
>> + * xe_late_bind_init() - add xe mei late binding component
>> + *
>> + * Return: 0 if the initialization was successful, a negative errno otherwise.
>> + */
>> +int xe_late_bind_init(struct xe_late_bind *late_bind)
>> +{
>> +	struct xe_device *xe = late_bind_to_xe(late_bind);
>> +	int err;
>> +
>> +	if (!xe->info.has_late_bind)
>> +		return 0;
>> +
>> +	mutex_init(&late_bind->mutex);
>> +
>> +	if (!IS_ENABLED(CONFIG_INTEL_MEI_LATE_BIND) || !IS_ENABLED(CONFIG_INTEL_MEI_GSC)) {
>> +		drm_info(&xe->drm, "Can't init xe mei late bind missing mei component\n");
>> +		return -ENODEV;
>> +	}
>> +
>> +	err = component_add_typed(xe->drm.dev, &xe_late_bind_component_ops,
>> +				  INTEL_COMPONENT_LATE_BIND);
>> +	if (err < 0) {
>> +		drm_info(&xe->drm, "Failed to add mei late bind component (%pe)\n", ERR_PTR(err));
>> +		return err;
>> +	}
>> +
>> +	return devm_add_action_or_reset(xe->drm.dev, xe_late_bind_remove, late_bind);
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw.h b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> new file mode 100644
>> index 000000000000..4c73571c3e62
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw.h
>> @@ -0,0 +1,15 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_LATE_BIND_FW_H_
>> +#define _XE_LATE_BIND_FW_H_
>> +
>> +#include <linux/types.h>
>> +
>> +struct xe_late_bind;
>> +
>> +int xe_late_bind_init(struct xe_late_bind *late_bind);
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_late_bind_fw_types.h b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> new file mode 100644
>> index 000000000000..1156ef94f0d5
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_late_bind_fw_types.h
>> @@ -0,0 +1,37 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2025 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_LATE_BIND_TYPES_H_
>> +#define _XE_LATE_BIND_TYPES_H_
>> +
>> +#include <linux/iosys-map.h>
>> +#include <linux/mutex.h>
>> +#include <linux/types.h>
>> +
>> +/**
>> + * struct xe_late_bind_component - Late Binding services component
>> + * @mei_dev: device that provide Late Binding service.
>> + * @ops: Ops implemented by Late Binding driver, used by Xe driver.
>> + *
>> + * Communication between Xe and MEI drivers for Late Binding services
>> + */
>> +struct xe_late_bind_component {
>> +	/** @late_bind_component.mei_dev: mei device */
>> +	struct device *mei_dev;
>> +	/** @late_bind_component.ops: late binding ops */
>> +	const struct late_bind_component_ops *ops;
>> +};
>> +
>> +/**
>> + * struct xe_late_bind
>> + */
>> +struct xe_late_bind {
>> +	/** @late_bind.component: struct for communication with mei component */
>> +	struct xe_late_bind_component component;
>> +	/** @late_bind.mutex: protects the component binding and usage */
> Please, before submitting another re-spin of this series, refactor
> this mutex. This is absolutely not acceptable.
>
> https://blog.ffwll.ch/2022/07/locking-engineering.html
>
> This is protecting the code and not the data. If binding or usage
> happens you need to have other ways of dealing with it.
>
> The lock needs to be reduced to the data you are trying to protect.
> Perhaps around the state/status or to certain register, but using
> a big mutex like you use in the patch 5 of this series and stating
> that it is to protect the code is not the right way.
>
> Sorry for not having looked at this earlier.

Sure Rodrigo, I will try to refactor mutex.  The intention was to 
prevent component removal during the push_config process and when a 
module unbind operation is performed
This is how it is implemented for xe_gsc_proxy.c and all the components 
in i915.

I was considering alternatives like wait_event_timeout or 
wait_for_completion. However, since we are already using flushing the 
work in xe_late_bind_component_unbind, the above scenario is unlikely to 
occur.

Regards,
Badal

>
>> +	struct mutex mutex;
>> +};
>> +
>> +#endif
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 08e21d4099e0..e5018d3ae74f 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -66,6 +66,7 @@ struct xe_device_desc {
>>   	u8 has_gsc_nvm:1;
>>   	u8 has_heci_gscfi:1;
>>   	u8 has_heci_cscfi:1;
>> +	u8 has_late_bind:1;
>>   	u8 has_llc:1;
>>   	u8 has_mbx_power_limits:1;
>>   	u8 has_pxp:1;
>> @@ -355,6 +356,7 @@ static const struct xe_device_desc bmg_desc = {
>>   	.has_mbx_power_limits = true,
>>   	.has_gsc_nvm = 1,
>>   	.has_heci_cscfi = 1,
>> +	.has_late_bind = true,
>>   	.needs_scratch = true,
>>   };
>>   
>> @@ -600,6 +602,7 @@ static int xe_info_init_early(struct xe_device *xe,
>>   	xe->info.has_gsc_nvm = desc->has_gsc_nvm;
>>   	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>>   	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
>> +	xe->info.has_late_bind = desc->has_late_bind;
>>   	xe->info.has_llc = desc->has_llc;
>>   	xe->info.has_pxp = desc->has_pxp;
>>   	xe->info.has_sriov = desc->has_sriov;
>> -- 
>> 2.34.1
>>
