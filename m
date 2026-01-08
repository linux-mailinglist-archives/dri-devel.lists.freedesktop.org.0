Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4724D04CDD
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 18:15:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CAA210E7A7;
	Thu,  8 Jan 2026 17:15:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="DvjysEwU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010062.outbound.protection.outlook.com
 [40.93.198.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BF8910E7A2;
 Thu,  8 Jan 2026 17:15:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=liBaCDjLGLXvTGM49cZPJc/eW6VYu3d88zzOw0WjmGt2+EKkEt58wP+ZktqCGBQlmXDTarhkXqG9oPX6BaJUDT0ww1yPohI4GNYkxGeF1qeUKxbnntHYRkRx8BeUtuaTWZbb+wlImnpYhtKic+YsNFxaZXOfQpWJxMrn3AY3GnOF8NZhL0opOMX+wgp5HOdPnipH4aUn0Gz5uumHp28Qla8Cp0Kfdk0Oc3U0QNWR8D//bEkSvDWsJwNbg53OYdyuGqll0yP6TQ14zWIFptDd3airn2jBPFo9oVvV5b6lb1G7cI92AJsA2SLGzYX7IUAJzPCP0ckN5Q4ddFwxDghSDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BJ50JGs3nVXXAE8HNsm/IzTlWbFx+nUJNFWsKeIMN/8=;
 b=nkVwPZEFWMKUNdSJV91XPi6RbDEnlak7vdRSVwBrxKxjn7qUHYo/7GghFb7dEhUuMljeIhpN8Qt5o7JXRTD2bDIsL/T3zY6nY885GrWkSYGJyabn8bXguvBivBlGOf6XSfCGY4dGUjd3K2KVAYgZ8BVGT92yYJtP5asXPE09yuU1YQbWcDgQ93cC/+PIIYSdIeAgy9+YMYFp/3dFmWRpLluPL+UXwVZNyeye9sczxgPdD310msPls7KpH37pMiclhCJtFJHhiT10IZAT98Dym1pCZZi6SAvGNHBWOyI6Y7Y22Hmmt1OJ7hB4Iokh8Z7cssNtaNyQ6pcE0YWi9SxgrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BJ50JGs3nVXXAE8HNsm/IzTlWbFx+nUJNFWsKeIMN/8=;
 b=DvjysEwU8Nw1HQM7WkZUNpAYP/LhI7xA6Z8S1bbVAF9ccZelv+kKWZluqVy4RjFGm5zzPyEBwYMDk2rKIvHRXherf3FdJN0C3kUX/5XaBr/jKJO6sMftyT8sj9u1GNav+lYrlJxwoPJhu2FWYngqC6X/MSrZFjpkzWvY6EwU2To=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB8476.namprd12.prod.outlook.com (2603:10b6:8:17e::15)
 by DS7PR12MB8083.namprd12.prod.outlook.com (2603:10b6:8:e4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.3; Thu, 8 Jan
 2026 17:15:07 +0000
Received: from DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8]) by DM4PR12MB8476.namprd12.prod.outlook.com
 ([fe80::2d79:122f:c62b:1cd8%6]) with mapi id 15.20.9499.002; Thu, 8 Jan 2026
 17:15:07 +0000
Message-ID: <462edc00-1919-4925-b62b-1f9e55a6cbf3@amd.com>
Date: Thu, 8 Jan 2026 10:15:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/13] drm: Allow driver-managed destruction of colorop
 objects
To: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: harry.wentland@amd.com, jani.nikula@linux.intel.com,
 louis.chauvet@bootlin.com, mwen@igalia.com, contact@emersion.fr,
 daniels@collabora.com, uma.shankar@intel.com, suraj.kandpal@intel.com,
 nfraprado@collabora.com, ville.syrjala@linux.intel.com,
 matthew.d.roper@intel.com
References: <20251219065614.190834-1-chaitanya.kumar.borah@intel.com>
 <20251219065614.190834-6-chaitanya.kumar.borah@intel.com>
 <4b71d7cd-72d4-4666-8f9e-81a30ce1817f@amd.com>
 <96fd9dee-20f1-4e1d-84b1-6243251a1e40@intel.com>
Content-Language: en-US
From: Alex Hung <alex.hung@amd.com>
In-Reply-To: <96fd9dee-20f1-4e1d-84b1-6243251a1e40@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0248.namprd03.prod.outlook.com
 (2603:10b6:303:b4::13) To DM4PR12MB8476.namprd12.prod.outlook.com
 (2603:10b6:8:17e::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB8476:EE_|DS7PR12MB8083:EE_
X-MS-Office365-Filtering-Correlation-Id: 72d677a6-67d8-44a0-68ae-08de4ed97834
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YzdOekMvaFRYdmRJaGh4THJTSjM5N01NVWk4ejJySjc5S2Y1QXJsanBlOERB?=
 =?utf-8?B?a2h4bi9tMXJjcitrUWZ4K1pxcTRJSFUrL2dBU2FISFRaZHgvOHZ2RWZVRDZG?=
 =?utf-8?B?ZlR1ejVyQkxTaDcwUmhHYnJKcEN6aFFTSFZEaDIrejBrN2MrR2lsQU9EeHVa?=
 =?utf-8?B?ejMwcDQxTnQ0bkM4VHF1R3BveXNYbEJ3ZWp3RU1nek9RVlV3Vkt2UmV3QXNZ?=
 =?utf-8?B?NC9ZTnJqdDNtbTJpd2dZMkxWc1EyRDhRMzQ1bXFvaHNlWXpWV1RFRC9uU0Q1?=
 =?utf-8?B?cERwd25qNnRqNWpzdi9JL0ppR2V0ZVVObnVJZkh3NGVsVUNKNzhQbnEvMHhw?=
 =?utf-8?B?QlpTTU5qWjR4aWpHV3MxbTNqVkVjN1ozZnJoQlZpTnA4T2tKQll2aklhbSty?=
 =?utf-8?B?MGZ2UENtZktGczhmSmtpNzc2NXE3RTBTZ3BNMFRmNnVYclQrUDNFQmVFM2Vx?=
 =?utf-8?B?dm5USEp3M0pOOTgyekVrQjYwNXR6Mno4alp3ZTFvUHNYWExpL1pabUthbStP?=
 =?utf-8?B?SWlrdUxSVGgzOURhZ1JNd0RHS1JOUkdOMW1EVXlSVzdvdjRTQUVsZTBRbzBs?=
 =?utf-8?B?TnBVUUdsZUJUWHk4Y1FzVVVTS1l4bXBVY3RRMS93SmV4cFZPaTJtOUJBRG9H?=
 =?utf-8?B?Y2NtVWI3Z2tTVWxIcW9aOStjOW9rWmxmQ2lZUk1MVXN2V1RWUXpQdGdzK2Q4?=
 =?utf-8?B?NXZIMDBPV2RLYkx0TGJHb3UrRTJTcDl2a3Z0ak91S3NKdGMxTklWTVpreFNC?=
 =?utf-8?B?VHA3WURYNHJnV1dLaytvV2JEOUV6YkFWcnZ2NlJDUzFxb1FjQUtGdkVNQmll?=
 =?utf-8?B?cTZ4M2lGcjRhTHlXTWViaHc0d3JOTFMwYS9keWk0bTk2YVRURzZHN0dyNHN2?=
 =?utf-8?B?d2tNS1RYVUpiMzFVSWN4VXQrRDk0dUZ4LzViTStKWUtrc0V1UGt0ZVdLb3lz?=
 =?utf-8?B?R3FucVhYZEtINmNhMWtKSnhITDNWZmlVM2cwUTJvWmVFRjRmcXo0RHZOOWcw?=
 =?utf-8?B?WUgrRkF4RElscUpidVoyNkRjSnpCWmJST0NjbUZQcXp3V3IyNU9heGJXUWp4?=
 =?utf-8?B?Z1ZFblM1YkV0QXI4MU5ZVkFieXQ2Q2lrVHdlQkZJWUlQVFo4Rjk3NlN4WFBt?=
 =?utf-8?B?Zlo2YVpXNTRvdDZRRVdtdEI4b1pVdE5sN3NObHpjVkNMME4xT3lNclVyK2dr?=
 =?utf-8?B?cUUvUm5lQ2dZWUtNQzJWdzZlVC9TVThqOVdEM1p0dS9qMDN3R3QzSlM4MTlV?=
 =?utf-8?B?M2JOeDloSkRyTDZKbGxjb0NvKzVjRGp3TTZlNlkzN1g1U21XWlRQS2tvd0Jl?=
 =?utf-8?B?OEowR1Z2SStIUU9PQVJyVzlaZGFjTWE4cUFzQnhjcFdGU1RvdU1iQUwwN2E4?=
 =?utf-8?B?MTI0YUdMcTNlbGE0TUlhdDdJdjY0ajlSRFJBdW9RTmlCOGFldEo3Z1lqUnBv?=
 =?utf-8?B?Q1plaFloMys5VFJhUHBqODZ2QzBLNlBOREpjVVBScXRYY0R6UHZHZmhWSnJn?=
 =?utf-8?B?Qmh1cHFlWS8yMVord2l6cGJjMVQzR0tNbTd1S2JjVHhOVUduVU1wM1J6RHY1?=
 =?utf-8?B?dHA3R0d2K2IxR3AxU3hKd2l4MHFQSTVkc2xnbUQ1S2h2V1dWVXpFVUdkdUVm?=
 =?utf-8?B?N0dnSkcwS3BZMkU1NGFIV0xOcWhiZVJsMUhOTHVsOXRBdnZWUDVSVjRJT1RB?=
 =?utf-8?B?NUp6QkpkRWQ2bEg3WGZ5aW9RNDRPeVNhRjlCU3E5N084cHFJSkt5U2liRmdy?=
 =?utf-8?B?M0NIeFlSbWN2Y1ROL1N2WG42Wkh5dUhMSlBwQnhvQkx6S1VDVDB1Wm8xYmJD?=
 =?utf-8?B?eWpucVlqcG9jY0VvUWZQT3RGSXkzQ05xcmRCdkZYdTBWY3lZT1Z3UFg0Y0Mx?=
 =?utf-8?B?YkxNWnlKUUhrR0hpREZ3aDdhNG9UOUlNZUwzV0p5TEQrZFR5MWg1MjR3VFNX?=
 =?utf-8?Q?fEi8kYeIQ8JhE4Px+L8Jsh/6tj7m+szh?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB8476.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SE1YcnduRVEza1RNY2ZDQkxLVUpnQWdLdW11RzMvdWhTVmlRV2ZuWjRGNXJF?=
 =?utf-8?B?UHhtanlCVUlJdkNDTmMxRDl2STZWRDRyV2RzVllGejBIOHMxc083T2I3WERl?=
 =?utf-8?B?dzdhY3poVVVLdGxSVjFBWXRFTFNNa0VTNTAxWEM1TkpNVnc4Q1h0SmdENE53?=
 =?utf-8?B?Zy9iajlFc2kycXdHbGlhSjB1VHJFWjFGNi9JYlU1UjZ0ckxvS05yaUV2Rll6?=
 =?utf-8?B?dW5lSWFTODdzUHptcFU5SkN4akZ0MXhTeGhjTS9oTUhzKzNiK1BQalFZbXht?=
 =?utf-8?B?Q1J4T2ZYTndzWU54UjkzSzdQTTB0MmorYk1DeDJZUFFYeHdNMHFXZ2dpT3ll?=
 =?utf-8?B?eE5qUVE5ZlAweW5aZU9yMzhyb3RtYmczUUY5c3Z2VDBWTU80Y1Vudk1YMFNz?=
 =?utf-8?B?WVVMQk5KQVdZNzFCTEVhSE1WZlA3ODhKUjVkYktYV1YyQndFWFFIVm03aElM?=
 =?utf-8?B?clZueDdxQ2Q3dThTSVl5ajc5ZlNuWlMraWx0VEhqS0RkZjIrNDlQejlKRE1i?=
 =?utf-8?B?SkdQalhFV2lnSStmSkhmYkg0NmtuVTB6czU5ZDB5YXJtSExhSnFZTU9QQ2RD?=
 =?utf-8?B?VGZSeGpYRFROTFdjWktMZGRHOFlQQ1VNZ0xuZ2dseW1SM3ZBUS9LVzVvdERQ?=
 =?utf-8?B?Yk5SRDVYTWh4Z2RZMSt1akhOTExpVG13Z25KY2JuVmpINld0YkYvQ3BJZ1l3?=
 =?utf-8?B?QlZmZXpDVUlFTnB0VkpyM05hQ3dqTUJUYk4ycUlTcVN0ZzBia0R4WjdXdVgw?=
 =?utf-8?B?Z3FGdmtiZlMvVHlvMFhJeTRmNEQ3STVnUkRVQTBGZ200eG5wRDhHNC84MUU3?=
 =?utf-8?B?OUk1Y25IYktrRmllYUx6Q05hY1VWeVdHUGg3R0ZkT2NOWmROSitGbkQ3WTM0?=
 =?utf-8?B?N1Rka2c3ODljN3AyeStPOHVMQjdXbzkvY052R2pPQ2d3cm1WQ1l1a1F0TUtJ?=
 =?utf-8?B?cThxaSt1S3VneldwUHR5a2pvL0wydnplMGhiWHM4RXJrSGpDYjFDcVVvbjhV?=
 =?utf-8?B?MldZRFd3Vy8vRzJyWXBIaE9sbWoweGkxM2JnVjQ0MkxjY2swQzZ0YVN2YTJV?=
 =?utf-8?B?REFjWVRVcXFVVEdCL09pZ1lsS0dpOXo0SGhYa1pXQzVENW1lemtlTTAweDd5?=
 =?utf-8?B?TEpuaGlRbjRwNS8vcWk4amo0Y04xbHRGSTA2UjJDOER0bDlsV2VJUGlUK2xy?=
 =?utf-8?B?YnJLa2N4c0Mvb2pKSXUxNjhreXBLb2JIQU9CL3M0eVVaa0k2N2gvN2JPS0pk?=
 =?utf-8?B?c2NQVlR4WWd1dThWRjZHLzdiTVlyZHZLWlFoQllpL29zY2lpaUZzQnNUdFZS?=
 =?utf-8?B?cHp4cTVuTzNwRjJCKzVqZURDNlAzdHlMZ0NDYmRwZHpRYTlIa3hxZzZZTnpt?=
 =?utf-8?B?emxFMm8rN3o2dFAzQ0ZaSTVXR3RzUXdZbGxvd2V0ZHhFTS9YSCtqdFlTK2Nu?=
 =?utf-8?B?RW9yMjNoVUlaT1FIb092VU0xRkNYcFo3YWloUXlXL1RpT2VYNHRyWHNHZkts?=
 =?utf-8?B?bC9IU3dmUFM1NHlEdkRSK2hPWWxWS1EvZ2dVZjVwSSt4elMxY3VBVnZCcjgr?=
 =?utf-8?B?ckF3V0FCMGJ0YVNGd0w4QmhDeGNsVGdldGlpTDJ2K3ZOSmpHdTRzY0VxdnIy?=
 =?utf-8?B?eUIreGJTcXZXeG8zTGRRYnVLSnpRNnVLaFBJeHdzYXNSMGlCMWFiVFFGTjRN?=
 =?utf-8?B?NkZtSW44STF5bHNvbk5WSnJCa1hjd21lLy84ZU5tUU5aK2NCcGpvMVVCZHRF?=
 =?utf-8?B?ZFBBR2NPSGhQbXYzY1c3TEhrZU40eHdTbHlyQ0M5b25KZkpwaWlmOXNtV0lr?=
 =?utf-8?B?ZHBMcUs1OXlnbVprMkxzbTIycmphT2VpYkhjK0QrWXdhcC9EYjM4VEg5ei9u?=
 =?utf-8?B?cTROb2ZHaVhFWjhnTGcvdnV5TmFmTGVKNHdOa2RyL1hXVlp0c1B5UUExYlBj?=
 =?utf-8?B?NTVWSVRTWjNUUHZLTGhBc2dySjE4QzBzSnhpNjJUbWx1cUdsQVJiSGsyYU1L?=
 =?utf-8?B?NnNxUEpmQ1BWZEczbzlWcWkrNkNWMFNsQ3FEdXh4QzZVajVhWllVa25CVmRJ?=
 =?utf-8?B?RjF5ei96eXI3WXRmN29GQyt4SmNhY0dtWHQ5cHBpT2RhUldqcVNIWEYreEYw?=
 =?utf-8?B?K25RRVBPdjBUYklRL2tmNFlQSFVPZkRIWkd6aE0xN3BSZGdrU240TEtBZ0lD?=
 =?utf-8?B?bVpYSDJuTEtUc1M4d25saWQ0QnhZVWVlYWQ4alpQS3ZZdlJsMEYyRGF6bXJm?=
 =?utf-8?B?T3cxVGY5NW4vUUhhTHlrTFo1WnFNeVJIbUd6cEdLQk8xTkFwQnh5aFNrMEwx?=
 =?utf-8?B?K1lucGwySGQ5bjlZUHhLVW1JSWtQTjF0aDdsamZpcUYzajRRQkdwQT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 72d677a6-67d8-44a0-68ae-08de4ed97834
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB8476.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 17:15:07.0684 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Bo/4BdjSAr6XC9DtRbO6KRX18SJud9q1FE6L3zSLKOM1QTbcOxpXzbJ5PAve+Dpd3C5mYme3YOs9m3lgzSXJlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8083
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



On 1/8/26 07:11, Borah, Chaitanya Kumar wrote:
> 
> On 1/7/2026 5:32 AM, Alex Hung wrote:
>> It is a nitpick, but is it better to have patch 6 first, and then 
>> separate changes to drm to a single patch, and move the changes in 
>> amdgpu, vkms and i915 in the following corresponding patches (7, 8 and 
>> 9)?
>>
>> We can avoid passing NULL to struct drm_colorop_funcs *funcs.
> 
> Thank you very much, Alex, for the review.
> 
> I structured the patches this way to keep each patch buildable and to 
> keep the existing behavior intact until all changes are in place.
> 
> Once the prototypes of the init functions are changed, all call sites 
> need to be updated. I couldn’t find a way to keep the DRM changes 
> isolated while also preserving per-patch buildability. If I am missing 
> something here, please let me know. I can respin accordingly.
> 
> In any case, I can move patch 6 ahead of this one.

Sounds good to me.


> 
> ==
> Chaitanya
> 
>>
>> Otherwise it looks good to me.
>>
>> Reviewed-by: Alex Hung <alex.hung@amd.com>
>>
>> On 12/18/25 23:56, Chaitanya Kumar Borah wrote:
>>> Some drivers might want to embed struct drm_colorop inside
>>> driver-specific objects, similar to planes or CRTCs. In such
>>> cases, freeing only the drm_colorop is incorrect.
>>>
>>> Add a drm_colorop_funcs callback to allow drivers to provide a destroy
>>> hook that cleans up the full enclosing object. Make changes in helper
>>> functions to accept helper functions as argument. Pass NULL for now
>>> to retain current behavior.
>>>
>>> Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
>>> ---
>>>   .../amd/display/amdgpu_dm/amdgpu_dm_colorop.c | 18 ++++++-----
>>>   drivers/gpu/drm/drm_colorop.c                 | 31 +++++++++++++------
>>>   .../drm/i915/display/intel_color_pipeline.c   |  8 ++---
>>>   drivers/gpu/drm/vkms/vkms_colorop.c           | 10 +++---
>>>   include/drm/drm_colorop.h                     | 30 +++++++++++++++---
>>>   5 files changed, 66 insertions(+), 31 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/ 
>>> amdgpu_dm_colorop.c b/drivers/gpu/drm/amd/display/amdgpu_dm/ 
>>> amdgpu_dm_colorop.c
>>> index a2de3bba8346..dfdb4fb4219f 100644
>>> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>>> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_colorop.c
>>> @@ -72,7 +72,7 @@ int amdgpu_dm_initialize_default_pipeline(struct 
>>> drm_plane *plane, struct drm_pr
>>>           goto cleanup;
>>>       }
>>> -    ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
>>> +    ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
>>>                             amdgpu_dm_supported_degam_tfs,
>>>                             DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>>       if (ret)
>>> @@ -89,7 +89,7 @@ int amdgpu_dm_initialize_default_pipeline(struct 
>>> drm_plane *plane, struct drm_pr
>>>           goto cleanup;
>>>       }
>>> -    ret = drm_plane_colorop_mult_init(dev, ops[i], plane, 
>>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>> +    ret = drm_plane_colorop_mult_init(dev, ops[i], plane, NULL, 
>>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>>       if (ret)
>>>           goto cleanup;
>>> @@ -104,7 +104,8 @@ int amdgpu_dm_initialize_default_pipeline(struct 
>>> drm_plane *plane, struct drm_pr
>>>           goto cleanup;
>>>       }
>>> -    ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, 
>>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>> +    ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
>>> +                         DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>>       if (ret)
>>>           goto cleanup;
>>> @@ -120,7 +121,7 @@ int amdgpu_dm_initialize_default_pipeline(struct 
>>> drm_plane *plane, struct drm_pr
>>>               goto cleanup;
>>>           }
>>> -        ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
>>> +        ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
>>>                           amdgpu_dm_supported_shaper_tfs,
>>>                           DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>>           if (ret)
>>> @@ -137,7 +138,8 @@ int amdgpu_dm_initialize_default_pipeline(struct 
>>> drm_plane *plane, struct drm_pr
>>>               goto cleanup;
>>>           }
>>> -        ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], 
>>> plane, MAX_COLOR_LUT_ENTRIES,
>>> +        ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], 
>>> plane, NULL,
>>> +                            MAX_COLOR_LUT_ENTRIES,
>>>                               DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>>>                               DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>>           if (ret)
>>> @@ -154,7 +156,7 @@ int amdgpu_dm_initialize_default_pipeline(struct 
>>> drm_plane *plane, struct drm_pr
>>>               goto cleanup;
>>>           }
>>> -        ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, 
>>> LUT3D_SIZE,
>>> +        ret = drm_plane_colorop_3dlut_init(dev, ops[i], plane, NULL, 
>>> LUT3D_SIZE,
>>>                       DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>>>                       DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>>           if (ret)
>>> @@ -172,7 +174,7 @@ int amdgpu_dm_initialize_default_pipeline(struct 
>>> drm_plane *plane, struct drm_pr
>>>           goto cleanup;
>>>       }
>>> -    ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane,
>>> +    ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL,
>>>                             amdgpu_dm_supported_blnd_tfs,
>>>                             DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>>       if (ret)
>>> @@ -189,7 +191,7 @@ int amdgpu_dm_initialize_default_pipeline(struct 
>>> drm_plane *plane, struct drm_pr
>>>           goto cleanup;
>>>       }
>>> -    ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, 
>>> MAX_COLOR_LUT_ENTRIES,
>>> +    ret = drm_plane_colorop_curve_1d_lut_init(dev, ops[i], plane, 
>>> NULL, MAX_COLOR_LUT_ENTRIES,
>>>                             DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>>>                             DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>>       if (ret)
>>> diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/ 
>>> drm_colorop.c
>>> index 44eb823585d2..efe61bdd9b24 100644
>>> --- a/drivers/gpu/drm/drm_colorop.c
>>> +++ b/drivers/gpu/drm/drm_colorop.c
>>> @@ -93,7 +93,8 @@ static const struct drm_prop_enum_list 
>>> drm_colorop_lut3d_interpolation_list[] =
>>>   /* Init Helpers */
>>>   static int drm_plane_colorop_init(struct drm_device *dev, struct 
>>> drm_colorop *colorop,
>>> -                  struct drm_plane *plane, enum drm_colorop_type type,
>>> +                  struct drm_plane *plane, const struct 
>>> drm_colorop_funcs *funcs,
>>> +                  enum drm_colorop_type type,
>>>                     uint32_t flags)
>>>   {
>>>       struct drm_mode_config *config = &dev->mode_config;
>>> @@ -109,6 +110,7 @@ static int drm_plane_colorop_init(struct 
>>> drm_device *dev, struct drm_colorop *co
>>>       colorop->type = type;
>>>       colorop->plane = plane;
>>>       colorop->next = NULL;
>>> +    colorop->funcs = funcs;
>>>       list_add_tail(&colorop->head, &config->colorop_list);
>>>       colorop->index = config->num_colorop++;
>>> @@ -203,6 +205,7 @@ EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
>>>    * @dev: DRM device
>>>    * @colorop: The drm_colorop object to initialize
>>>    * @plane: The associated drm_plane
>>> + * @funcs: control functions for the new colorop
>>>    * @supported_tfs: A bitfield of supported 
>>> drm_plane_colorop_curve_1d_init enum values,
>>>    *                 created using BIT(curve_type) and combined with 
>>> the OR '|'
>>>    *                 operator.
>>> @@ -210,7 +213,8 @@ EXPORT_SYMBOL(drm_colorop_pipeline_destroy);
>>>    * @return zero on success, -E value on failure
>>>    */
>>>   int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct 
>>> drm_colorop *colorop,
>>> -                    struct drm_plane *plane, u64 supported_tfs, 
>>> uint32_t flags)
>>> +                    struct drm_plane *plane, const struct 
>>> drm_colorop_funcs *funcs,
>>> +                    u64 supported_tfs, uint32_t flags)
>>>   {
>>>       struct drm_prop_enum_list enum_list[DRM_COLOROP_1D_CURVE_COUNT];
>>>       int i, len;
>>> @@ -231,7 +235,7 @@ int drm_plane_colorop_curve_1d_init(struct 
>>> drm_device *dev, struct drm_colorop *
>>>           return -EINVAL;
>>>       }
>>> -    ret = drm_plane_colorop_init(dev, colorop, plane, 
>>> DRM_COLOROP_1D_CURVE, flags);
>>> +    ret = drm_plane_colorop_init(dev, colorop, plane, funcs, 
>>> DRM_COLOROP_1D_CURVE, flags);
>>>       if (ret)
>>>           return ret;
>>> @@ -288,20 +292,23 @@ static int drm_colorop_create_data_prop(struct 
>>> drm_device *dev, struct drm_color
>>>    * @dev: DRM device
>>>    * @colorop: The drm_colorop object to initialize
>>>    * @plane: The associated drm_plane
>>> + * @funcs: control functions for new colorop
>>>    * @lut_size: LUT size supported by driver
>>>    * @interpolation: 1D LUT interpolation type
>>>    * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
>>>    * @return zero on success, -E value on failure
>>>    */
>>>   int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, 
>>> struct drm_colorop *colorop,
>>> -                    struct drm_plane *plane, uint32_t lut_size,
>>> +                    struct drm_plane *plane,
>>> +                    const struct drm_colorop_funcs *funcs,
>>> +                    uint32_t lut_size,
>>>                       enum drm_colorop_lut1d_interpolation_type 
>>> interpolation,
>>>                       uint32_t flags)
>>>   {
>>>       struct drm_property *prop;
>>>       int ret;
>>> -    ret = drm_plane_colorop_init(dev, colorop, plane, 
>>> DRM_COLOROP_1D_LUT, flags);
>>> +    ret = drm_plane_colorop_init(dev, colorop, plane, funcs, 
>>> DRM_COLOROP_1D_LUT, flags);
>>>       if (ret)
>>>           return ret;
>>> @@ -339,11 +346,12 @@ int drm_plane_colorop_curve_1d_lut_init(struct 
>>> drm_device *dev, struct drm_color
>>>   EXPORT_SYMBOL(drm_plane_colorop_curve_1d_lut_init);
>>>   int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct 
>>> drm_colorop *colorop,
>>> -                   struct drm_plane *plane, uint32_t flags)
>>> +                   struct drm_plane *plane, const struct 
>>> drm_colorop_funcs *funcs,
>>> +                   uint32_t flags)
>>>   {
>>>       int ret;
>>> -    ret = drm_plane_colorop_init(dev, colorop, plane, 
>>> DRM_COLOROP_CTM_3X4, flags);
>>> +    ret = drm_plane_colorop_init(dev, colorop, plane, funcs, 
>>> DRM_COLOROP_CTM_3X4, flags);
>>>       if (ret)
>>>           return ret;
>>> @@ -363,16 +371,18 @@ EXPORT_SYMBOL(drm_plane_colorop_ctm_3x4_init);
>>>    * @dev: DRM device
>>>    * @colorop: The drm_colorop object to initialize
>>>    * @plane: The associated drm_plane
>>> + * @funcs: control functions for the new colorop
>>>    * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
>>>    * @return zero on success, -E value on failure
>>>    */
>>>   int drm_plane_colorop_mult_init(struct drm_device *dev, struct 
>>> drm_colorop *colorop,
>>> -                struct drm_plane *plane, uint32_t flags)
>>> +                struct drm_plane *plane, const struct 
>>> drm_colorop_funcs *funcs,
>>> +                uint32_t flags)
>>>   {
>>>       struct drm_property *prop;
>>>       int ret;
>>> -    ret = drm_plane_colorop_init(dev, colorop, plane, 
>>> DRM_COLOROP_MULTIPLIER, flags);
>>> +    ret = drm_plane_colorop_init(dev, colorop, plane, funcs, 
>>> DRM_COLOROP_MULTIPLIER, flags);
>>>       if (ret)
>>>           return ret;
>>> @@ -391,6 +401,7 @@ EXPORT_SYMBOL(drm_plane_colorop_mult_init);
>>>   int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct 
>>> drm_colorop *colorop,
>>>                    struct drm_plane *plane,
>>> +                 const struct drm_colorop_funcs *funcs,
>>>                    uint32_t lut_size,
>>>                    enum drm_colorop_lut3d_interpolation_type 
>>> interpolation,
>>>                    uint32_t flags)
>>> @@ -398,7 +409,7 @@ int drm_plane_colorop_3dlut_init(struct 
>>> drm_device *dev, struct drm_colorop *col
>>>       struct drm_property *prop;
>>>       int ret;
>>> -    ret = drm_plane_colorop_init(dev, colorop, plane, 
>>> DRM_COLOROP_3D_LUT, flags);
>>> +    ret = drm_plane_colorop_init(dev, colorop, plane, funcs, 
>>> DRM_COLOROP_3D_LUT, flags);
>>>       if (ret)
>>>           return ret;
>>> diff --git a/drivers/gpu/drm/i915/display/intel_color_pipeline.c b/ 
>>> drivers/gpu/drm/i915/display/intel_color_pipeline.c
>>> index 04af552b3648..d3d73d60727c 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_color_pipeline.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_color_pipeline.c
>>> @@ -25,7 +25,7 @@ int _intel_color_pipeline_plane_init(struct 
>>> drm_plane *plane, struct drm_prop_en
>>>       colorop = intel_colorop_create(INTEL_PLANE_CB_PRE_CSC_LUT);
>>> -    ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, 
>>> plane,
>>> +    ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, 
>>> plane, NULL,
>>>                             PLANE_DEGAMMA_SIZE,
>>>                             DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>>>                             DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>> @@ -39,7 +39,7 @@ int _intel_color_pipeline_plane_init(struct 
>>> drm_plane *plane, struct drm_prop_en
>>>       prev_op = &colorop->base;
>>>       colorop = intel_colorop_create(INTEL_PLANE_CB_CSC);
>>> -    ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane,
>>> +    ret = drm_plane_colorop_ctm_3x4_init(dev, &colorop->base, plane, 
>>> NULL,
>>>                            DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>>       if (ret)
>>>           return ret;
>>> @@ -52,7 +52,7 @@ int _intel_color_pipeline_plane_init(struct 
>>> drm_plane *plane, struct drm_prop_en
>>>           plane->type == DRM_PLANE_TYPE_PRIMARY) {
>>>           colorop = intel_colorop_create(INTEL_PLANE_CB_3DLUT);
>>> -        ret = drm_plane_colorop_3dlut_init(dev, &colorop->base, 
>>> plane, 17,
>>> +        ret = drm_plane_colorop_3dlut_init(dev, &colorop->base, 
>>> plane, NULL, 17,
>>>                              
>>> DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL,
>>>                              true);
>>>           if (ret)
>>> @@ -64,7 +64,7 @@ int _intel_color_pipeline_plane_init(struct 
>>> drm_plane *plane, struct drm_prop_en
>>>       }
>>>       colorop = intel_colorop_create(INTEL_PLANE_CB_POST_CSC_LUT);
>>> -    ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, 
>>> plane,
>>> +    ret = drm_plane_colorop_curve_1d_lut_init(dev, &colorop->base, 
>>> plane, NULL,
>>>                             PLANE_GAMMA_SIZE,
>>>                             DRM_COLOROP_LUT1D_INTERPOLATION_LINEAR,
>>>                             DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>> diff --git a/drivers/gpu/drm/vkms/vkms_colorop.c b/drivers/gpu/drm/ 
>>> vkms/vkms_colorop.c
>>> index d03a1f2e9c41..9e9dd0494628 100644
>>> --- a/drivers/gpu/drm/vkms/vkms_colorop.c
>>> +++ b/drivers/gpu/drm/vkms/vkms_colorop.c
>>> @@ -31,7 +31,7 @@ static int vkms_initialize_color_pipeline(struct 
>>> drm_plane *plane, struct drm_pr
>>>           goto cleanup;
>>>       }
>>> -    ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, 
>>> supported_tfs,
>>> +    ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL, 
>>> supported_tfs,
>>>                             DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>>       if (ret)
>>>           goto cleanup;
>>> @@ -48,7 +48,8 @@ static int vkms_initialize_color_pipeline(struct 
>>> drm_plane *plane, struct drm_pr
>>>           goto cleanup;
>>>       }
>>> -    ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, 
>>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>> +    ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
>>> +                         DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>>       if (ret)
>>>           goto cleanup;
>>> @@ -64,7 +65,8 @@ static int vkms_initialize_color_pipeline(struct 
>>> drm_plane *plane, struct drm_pr
>>>           goto cleanup;
>>>       }
>>> -    ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, 
>>> DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>> +    ret = drm_plane_colorop_ctm_3x4_init(dev, ops[i], plane, NULL,
>>> +                         DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>>       if (ret)
>>>           goto cleanup;
>>> @@ -80,7 +82,7 @@ static int vkms_initialize_color_pipeline(struct 
>>> drm_plane *plane, struct drm_pr
>>>           goto cleanup;
>>>       }
>>> -    ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, 
>>> supported_tfs,
>>> +    ret = drm_plane_colorop_curve_1d_init(dev, ops[i], plane, NULL, 
>>> supported_tfs,
>>>                             DRM_COLOROP_FLAG_ALLOW_BYPASS);
>>>       if (ret)
>>>           goto cleanup;
>>> diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
>>> index a3a32f9f918c..45d1b1d3faf9 100644
>>> --- a/include/drm/drm_colorop.h
>>> +++ b/include/drm/drm_colorop.h
>>> @@ -187,6 +187,19 @@ struct drm_colorop_state {
>>>       struct drm_atomic_state *state;
>>>   };
>>> +/**
>>> + * struct drm_colorop_funcs - driver colorop control functions
>>> + */
>>> +struct drm_colorop_funcs {
>>> +    /**
>>> +     * @destroy:
>>> +     *
>>> +     * Clean up colorop resources. This is called at driver unload time
>>> +     * through drm_mode_config_cleanup()
>>> +     */
>>> +    void (*destroy)(struct drm_colorop *colorop);
>>> +};
>>> +
>>>   /**
>>>    * struct drm_colorop - DRM color operation control structure
>>>    *
>>> @@ -362,6 +375,8 @@ struct drm_colorop {
>>>        */
>>>       struct drm_property *next_property;
>>> +    /** @funcs: colorop control functions */
>>> +    const struct drm_colorop_funcs *funcs;
>>>   };
>>>   #define obj_to_colorop(x) container_of(x, struct drm_colorop, base)
>>> @@ -390,17 +405,22 @@ void drm_colorop_pipeline_destroy(struct 
>>> drm_device *dev);
>>>   void drm_colorop_cleanup(struct drm_colorop *colorop);
>>>   int drm_plane_colorop_curve_1d_init(struct drm_device *dev, struct 
>>> drm_colorop *colorop,
>>> -                    struct drm_plane *plane, u64 supported_tfs, 
>>> uint32_t flags);
>>> +                    struct drm_plane *plane, const struct 
>>> drm_colorop_funcs *funcs,
>>> +                    u64 supported_tfs, uint32_t flags);
>>>   int drm_plane_colorop_curve_1d_lut_init(struct drm_device *dev, 
>>> struct drm_colorop *colorop,
>>> -                    struct drm_plane *plane, uint32_t lut_size,
>>> +                    struct drm_plane *plane,
>>> +                    const struct drm_colorop_funcs *funcs,
>>> +                    uint32_t lut_size,
>>>                       enum drm_colorop_lut1d_interpolation_type 
>>> interpolation,
>>>                       uint32_t flags);
>>>   int drm_plane_colorop_ctm_3x4_init(struct drm_device *dev, struct 
>>> drm_colorop *colorop,
>>> -                   struct drm_plane *plane, uint32_t flags);
>>> +                   struct drm_plane *plane, const struct 
>>> drm_colorop_funcs *funcs,
>>> +                   uint32_t flags);
>>>   int drm_plane_colorop_mult_init(struct drm_device *dev, struct 
>>> drm_colorop *colorop,
>>> -                struct drm_plane *plane, uint32_t flags);
>>> +                struct drm_plane *plane, const struct 
>>> drm_colorop_funcs *funcs,
>>> +                uint32_t flags);
>>>   int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct 
>>> drm_colorop *colorop,
>>> -                 struct drm_plane *plane,
>>> +                 struct drm_plane *plane, const struct 
>>> drm_colorop_funcs *funcs,
>>>                    uint32_t lut_size,
>>>                    enum drm_colorop_lut3d_interpolation_type 
>>> interpolation,
>>>                    uint32_t flags);
>>
> 

