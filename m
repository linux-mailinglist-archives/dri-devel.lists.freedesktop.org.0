Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UC8kDJZrnWnhPwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:12:54 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85EAD184553
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 10:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE07710E52D;
	Tue, 24 Feb 2026 09:12:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ksu6xFpK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010018.outbound.protection.outlook.com [52.101.201.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4EC210E52D
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Feb 2026 09:12:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xu+zRHon8C3PLvjEaPPs2zmavI+/0dVzvImCHgFOhWUxri6Ubbl25ERYwf5b2ICliq0v5Xgr+va96lKiPDVi3mUdHS50taxg+n85UdGLv/wYxfgKkAZQ1nitdYA1QT0mw4rFqI1YojDrb9OI1aHgY36+tPEUGkRAOn067N1FGtG/AWDuPzBxACaeTKoDncZdH6PC5JLddgUUrdTDdbPBHjucSB2LPfupWfDDys9rZLZKS4h/D8BEto//wzFn2LV405ocgEdNvm3HjSb66K6wRH7R85rSGUdFcQq3sB34xQu14kN9UacXiIXwBoidY31ZzcYerCFPxW1tl/zX59Yt+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ufXzMOHWxUJ0luDL7bPzACkdeeYGPmoemAe4BDfcByw=;
 b=o0I+3/ld58zW9r+SOuqZx8kqwIPNZ1Uxw7a9MkeBjO8UYxw3y+8dvMeUTc52m1UYHw/o03I8tOJVrh3AY3IUMAFM/KreZBekn3bHvf8pzTYTwyzYN6KM1jb/dCksZOWJv8FS63dph0ce2ngbfVxX5ULNwIBGoVqjT8bpMwAMWY5I83mo84ewT+9QBAwVRnMzPlGgN7oM/OXu6yi/cnal7F8l1IEQh6sPpnHeipif+6I0ullqgfhc1HEh5zcpTR/RdUvucC51c+Vv/8sscTNgq8HGggAND3aFaH7z/E3uYGZzIROeILVsUYPNtVzzjpnCj9hIZd1/BQpGImy3UK8UTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ufXzMOHWxUJ0luDL7bPzACkdeeYGPmoemAe4BDfcByw=;
 b=Ksu6xFpKNVDwnT0JxwWDAnnwtXryiPfTRdt68XJhTRzX/cIBzxZ6Gz1QbK8PP9IdFWZvMZBsMxaz6/5XKsk9FagmIYDiqsqUOQCXtLiC4k2g248ZbKxzc0q5kS2yMf/u4SYqvKWcyPOjmFjNzKm3yewGCuAQa9WbRpipZOI6HP4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB7780.namprd12.prod.outlook.com (2603:10b6:8:152::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Tue, 24 Feb
 2026 09:12:45 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 09:12:45 +0000
Message-ID: <e87c0c1d-82f1-4a03-9a56-9bf3e03273cf@amd.com>
Date: Tue, 24 Feb 2026 10:12:31 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 12/18] accel/qda: Add PRIME dma-buf import support
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
 Oded Gabbay <ogabbay@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 iommu@lists.linux.dev, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bharath Kumar <quic_bkumar@quicinc.com>,
 Chenna Kesava Raju <quic_chennak@quicinc.com>
References: <20260224-qda-firstpost-v1-0-fe46a9c1a046@oss.qualcomm.com>
 <20260224-qda-firstpost-v1-12-fe46a9c1a046@oss.qualcomm.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260224-qda-firstpost-v1-12-fe46a9c1a046@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB7780:EE_
X-MS-Office365-Filtering-Correlation-Id: 3087b48c-007d-4800-db5a-08de7384df4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2hOTXpBWXYwVXVuRE9hNXEwK3gySi9VcFhDcFFtWjRUWVdldE5OWFZyM0hm?=
 =?utf-8?B?OUtIUGU4SnM5QkhpMlJuYlBEbzNnMEo3NHE0KzZZdllXTUlCVnI0T2J5MTRQ?=
 =?utf-8?B?Um16YzJNSmZOY0FDN1dXclg2WUFRQ2tLem1pL3pYNlBKbmhWbEVDaHZ0UjBw?=
 =?utf-8?B?S3I3MDZ1a05xMmNLa1lRencyRG5FUjdhSURqZXlxNFBvZzZPZ0JyOXZiQ01N?=
 =?utf-8?B?eXRCZkdqc05DenZVVkdIUFZBMllBdEo5QVBXWkhCTzk2NEdMWEZtNDUvdEVY?=
 =?utf-8?B?ejFVcjU0azhvL09yalBuMzFYRlUrVmdpZisyS1c3My9DOFJkNlcwL1JhS0x1?=
 =?utf-8?B?cnZ6WVlxMFhoK3Y1aUp6QkcrUW5ZVitIU0E2V1hLZXlDUkkzTGJBZE5LQ1NS?=
 =?utf-8?B?TFZEL1orbWpUcnZXY1l0eWdHam91Rm53c04vdGlEN2xqYzkyWTBYem1RU0Ru?=
 =?utf-8?B?akVtMDNZV1hQaTloVUg0b1B2TFNiR3RwSlRpYVVlVGNOdDB3TkxOdkZ6MTZr?=
 =?utf-8?B?bVlOakd2SWJUcWYwWm5meTVuY3ZyMWhxc2lHUEVndWIweXM1bmJ2RHEvdVRJ?=
 =?utf-8?B?dG5RbDU2NDR1RmdJNVhrNUFxQjM2c00rOTQ2U3ZQdEhaVTRGZlpKVkFiMzhv?=
 =?utf-8?B?UUtaQ3dtd0pDOGR3Zm9XYXJYa0tlVE9YZVozLzBpMWd0THVrOFllY2RacDJz?=
 =?utf-8?B?U3UwaTJXeW1iSHJQRkhjZHFpN2tUY1ZDbUVGdnBzNDVKV0NZU2NqdXprQnNu?=
 =?utf-8?B?RGZIOTdubVlKcFNjcHAzZHhJZW14UjJtb01Lamx2cG5mNjhDNkpPUDVLSjlC?=
 =?utf-8?B?eG5KdEhkWmw5cE5Id0d1ZEJKR1RZY0VOS2xKaE56bWdGckpJTloxZk9Bc0NG?=
 =?utf-8?B?dXhBR1JMTVZSTTd1SU9oM0doVWl3eE1yVzArV2lqNDRDTm1RbC95VWdmLzho?=
 =?utf-8?B?LzNhMnVaeTRLa3BNaGxSRmt6NXl3bk5aMElZVUpvekRmeUdBcjA3eTZkaW1F?=
 =?utf-8?B?eGdxcjAwWEl2OXNYdkJ2RzhkMjI5S1A4ZEdmYkZGcU9kQWw4aExoZ2o3SDFG?=
 =?utf-8?B?cGtZd29GMUJTMXlhYTkzdjd4WHlPSVZrbFZLeFkrdnQ4OUtOL012UmVBSC9t?=
 =?utf-8?B?cFN4ZFFTRjVKRFhkQkg3Vkw0ZjFXOVRXQ3dPdmNKaE9zVmQ4QXIrNkhlWUQ1?=
 =?utf-8?B?Nmp4cXI2UVcvWGwrMHNIbUhwSHI0bVBZdnFLc1RrT2UzS3l2YmpNUDZOd3Ur?=
 =?utf-8?B?elNMQ1NaOU03T0N0VE1pM0V4dFFMc2NEMVh1RUZwRS9ta3RtYUFLN2c4N0pk?=
 =?utf-8?B?R2lEQUpVd1B4bk5td0swV1Z6THVtY2Q5MnVZOXIxUC9xZVllRVRpK2kzUFYw?=
 =?utf-8?B?TE1QY2FVYjF0TCtobWNTOEdPWThYUENCTDBMWHFKVG9JVGlHQkJNaEZHS0Yz?=
 =?utf-8?B?bXFSWk5HQVR4QUhjNncrY1d0SGFNUmlnT3NaOHFTeUZQcE5hSE1jc2xBSDlD?=
 =?utf-8?B?OEpqTUhYbmFwbFRkYUpjdzdVWS84cGdrWUsrTDlKM0ZmOWpHMlFXeVBjVUJ6?=
 =?utf-8?B?K3NRWjJGSUxRTUY4S21ReldORUVXMjlPZ0d0eUJjODlrMDQyWjRtTUxxQysz?=
 =?utf-8?B?b0x6YWJLQTNJYUlsVnh4aDhhcVhSM0l1U0ZNQkFqVFFaUE1YMjlSMFhtOTNI?=
 =?utf-8?B?S3lmV1VzZkxYbmtIdFN5R2pxQjlPUHU4WDlTLytGT2d0OUlHNk9tTllIYytu?=
 =?utf-8?B?Sm9rQXBibkFQNEdxdC9yczg0SkZvYVdjRCswMW9zOUwxMUc4VW9RTEZROXVI?=
 =?utf-8?B?MFJ2eUdqQ1lQa2xETW9mQ0tDdzd1VlhzaVUzM0orQytWUGFYMHZYMjJrcmxu?=
 =?utf-8?B?M200MGppdTF2eC9hT2hJVy92R0dHOGhnYlZrc0s3bWVFVnlzZGI3UGRBOERr?=
 =?utf-8?B?blJiYkk5bnd6SnJXbGo2KytSR3JDSSt3Z2Rpb25TMkppa09PRHVKbEo1MDNC?=
 =?utf-8?B?SVdiajlEV3BjUW1aTm9JQ1k4VGNPeHYwVzRQZHJVUHA3QnoxZStzQUV1L01P?=
 =?utf-8?B?dXM4MjE2Z2lMMzBDNXpoZjRzVU1hWVlKVjJyMXZFdTVVQTNRN1o0U3lJWmc3?=
 =?utf-8?B?Y1B0V1dtVzd3RnIrdnZlb2xHYjNFUnAzVm00dkVBK1huK0RBWktzbXBmbUd2?=
 =?utf-8?B?cEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OE1jUXVSMVdnd2V6SzFZSkUxVU44M0hpQnZmOHlTL0sybW0wWmU4WExLelF0?=
 =?utf-8?B?UHM2OUtxTVJHV2dtTXlDZ3lDYzRLV1dQMTUyb2RyRFJ2QkErK29kWkFVdjlY?=
 =?utf-8?B?cUVSczlrOVBHQmIxeEVLWW9tWUJmQjhBbW5rZ2N0YUwvOHN6anViUjZHblky?=
 =?utf-8?B?VUJhejVmQ0NvcDdOMUFwc1VvMDhBcnRiakVtemJQcmNKWS9TWCtSTDZmaUVU?=
 =?utf-8?B?S3lUSCtOMUhKRGkxbTNsYUdRYzNGNU1zU29QNUkwaVhobHI0UDd3VUNsekNy?=
 =?utf-8?B?VTl4YUFqKy9GTktqODc5Y1V1cCtEc2tUUXZEWmxEMjVkL1JWcTZSbG0vQlRo?=
 =?utf-8?B?SHBiTjFLbElRbWxGUndIb3BBUkdXWEZ0L01Hc2tiNUQ5bmNPL09Nc3BiMXlz?=
 =?utf-8?B?TDBMY3FmeHNQODBnT3BEK2Jnd1ZwcFlzN0tVNDlhNll1NXFtK3MwMlpxd1Rn?=
 =?utf-8?B?NkFhVXp0U1kxc1VHR3U2L0hzeVBGYmJPMm5VcS80MGxwcUZpN0cxQWdTWEpu?=
 =?utf-8?B?Q2tDbXZsQmhieVhERUNKVVdGQUY2RjFiRUFVdERXNFd6eHpNM2FTenZuc3hK?=
 =?utf-8?B?ZWlZdktuRE5FSFp6K1drRFRMMjB2am1uL2hYZFB3UmdGQysxemZaUTBML3Zo?=
 =?utf-8?B?Z0NmcGJwMmFabWEwZkRJSVU2WXd6RGRTZzFLb3dCMHpLL1pabUZHaHRJdUYw?=
 =?utf-8?B?d0FGbnBCU1JCTXg1dThEZVpUeXM1RkxzNU9rSG93THNIUlh5cndQNlpwZGR4?=
 =?utf-8?B?SHNzT3lFdWNMVE5EQnIyaXhiZDNSV29vQk1Sd0kxemtGcGh0aXNLNkdOYzM3?=
 =?utf-8?B?WEV1QkJZbEdOd25NSlF5SEYrRmVyb2hISms5dk1XVmtLSGdQMWUxVUpOck9P?=
 =?utf-8?B?R2g1c3dBenBXZEltdXp4c3JTMWFPSTlsM29ZQnRNZk5zdFBzSXgzWXBBYWdM?=
 =?utf-8?B?c0N4d28yODhvQSthRXhnRTVjQXJ0TjBiYTVpdjJ5cjR1aHN5NlJhWHBvcGM3?=
 =?utf-8?B?S3VmV0RjdHNSN3o0bUVmbUtaUGVudU5Ici9TTlVocVc4MmZtWENPQkc5bzBN?=
 =?utf-8?B?bVZhdmFoMUVXaDVVQ2hCRXZLdDliQ3BmZlFMVk9PakNtTkVxVjF5ZHNqTDBn?=
 =?utf-8?B?RCtXWkdudmxxK2sxVTdpSTNyVUhXaU5jTGtqZ0NqdU1hT0Y2R3hvWlBpQWdJ?=
 =?utf-8?B?RWQyZnFoT3AwME5oNXZuL1ppMDJQeE5iN3RTeTA3ZTI1S2pPSml0SEZYWm1L?=
 =?utf-8?B?dGN0OVBqTFZ0T0RnNHozZ3picFUrYVNQN3BtQVpMRHAreVV4ZlladHpTaFhB?=
 =?utf-8?B?c0RaQVJwTVZXY0hQeXV0MFdqUVU3NmZjZS9Dak9yd3RFTHR1V2FpMXdNYjA4?=
 =?utf-8?B?NEVzU0duc2VrTFFZZFhKRXh4ekhpT3h0U01pdGo0bVRkQUpoa1BSWldOYVJk?=
 =?utf-8?B?VU4wS3ZURUpobUgwUmZwME5zMDhjUXdzQi9aNm9haTl0WWg1S3U3WjNFbGcr?=
 =?utf-8?B?aWZVakpVOHpRdHM0YWJiT1hGdzZJYmswb2tHNUZKbnNURkFiY2FqbDVLdTg4?=
 =?utf-8?B?d1N4SlY4ZzAzMWY4L0lpQkx4MGhRMHgwQjRPT3JZVGI3RzZoc21jR0VIbnlK?=
 =?utf-8?B?TC9iTzhTbGIzQlMyZzVoVDRoNGxLTGsvaGRFVTRwek8vSnVEbW5tZG0wV2R4?=
 =?utf-8?B?aFRFN2dXWDErNlpkRUlxSXJBWFNEUFE4Sm1OYytBWXpXaGlibkR4QmlEeHM5?=
 =?utf-8?B?K3I2bTMzK25BNXEvZy90V05VVktQYnhkTXliT01yTEYwSWFLd1ByVDlsNmVy?=
 =?utf-8?B?aXA0aUVsd0JWVWdHa2UzK0VZemw1VW50anBpK2xvb3g2SU1mV0N4YlRyallZ?=
 =?utf-8?B?RjNuOWpBYlhUZFFWd0RvL3l6L0ovWnhuTXhWeGorcjRUem0zdGdZeUhIeXdE?=
 =?utf-8?B?NmNsODlXalluY09JS2xPdTJFWnNkRHQ2dFR1VWN5bFREay9FWHR5dENLcUxl?=
 =?utf-8?B?VlJGTGpKZmpacWVKUkE1QjJ1NHZCNXBQTXdHV3lUYXArOTN5Z1lmMGJyUWpM?=
 =?utf-8?B?SHRKUFRlb3pEanN6V2pTV1lxWHh5QW4wK2dvV3Rmc2hROGtNVkpCMlpNUFRj?=
 =?utf-8?B?V0E2QWJ2UG1XQ04zUTlwQlNtUkZucEQrL0F4MVB1clA0UUJKOTNDSjFqVXpL?=
 =?utf-8?B?ODVyR2x3WHE3WUV1OEZlWWxlTHRXNGpTekNzNHBWUC84bHBvQWIxVUgzMEVk?=
 =?utf-8?B?NWVxUXlpaFkwdlpRb0xhTUFzZVczS1Y1SFdSNVZjb28wVWcrZVZmbWtDb0Mv?=
 =?utf-8?Q?aXudlNRcegXfr2L2P5?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3087b48c-007d-4800-db5a-08de7384df4d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 09:12:45.4844 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pThJ454xjrTKAvNLyN2kpz9PJ548iMi8kzcnY9B/V2EOQWZklJ586CP/5LaZrE18
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7780
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
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ekansh.gupta@oss.qualcomm.com,m:ogabbay@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:joro@8bytes.org,m:will@kernel.org,m:robin.murphy@arm.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:linux-doc@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:srinivas.kandagatla@oss.qualcomm.com,m:dmitry.baryshkov@oss.qualcomm.com,m:quic_bkumar@quicinc.com,m:quic_chennak@quicinc.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,lwn.net,linuxfoundation.org,8bytes.org,arm.com,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim,aka.ms:url,qualcomm.com:email]
X-Rspamd-Queue-Id: 85EAD184553
X-Rspamd-Action: no action

On 2/23/26 20:09, Ekansh Gupta wrote:
> [Sie erhalten nicht häufig E-Mails von ekansh.gupta@oss.qualcomm.com. Weitere Informationen, warum dies wichtig ist, finden Sie unter https://aka.ms/LearnAboutSenderIdentification ]
> 
> Add PRIME dma-buf import support for QDA GEM buffer objects and integrate
> it with the existing per-process memory manager and IOMMU device model.
> 
> The implementation extends qda_gem_obj to represent imported dma-bufs,
> including dma_buf references, attachment state, scatter-gather tables
> and an imported DMA address used for DSP-facing book-keeping. The
> qda_gem_prime_import() path handles reimports of buffers originally
> exported by QDA as well as imports of external dma-bufs, attaching them
> to the assigned IOMMU device

That is usually an absolutely clear NO-GO for DMA-bufs. Where exactly in the code is that?

> and mapping them through the memory manager
> for DSP access. The GEM free path is updated to unmap and detach
> imported buffers while preserving the existing behaviour for locally
> allocated memory.
> 
> The PRIME fd-to-handle path is implemented in qda_prime_fd_to_handle(),
> which records the calling drm_file in a driver-private import context
> before invoking the core DRM helpers. The GEM import callback retrieves
> this context to ensure that an IOMMU device is assigned to the process
> and that imported buffers follow the same per-process IOMMU selection
> rules as natively allocated GEM objects.
> 
> This patch prepares the driver for interoperable buffer sharing between
> QDA and other dma-buf capable subsystems while keeping IOMMU mapping and
> lifetime handling consistent with the existing GEM allocation flow.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>

...

> @@ -15,23 +16,29 @@ static int validate_gem_obj_for_mmap(struct qda_gem_obj *qda_gem_obj)
>                 qda_err(NULL, "Invalid GEM object size\n");
>                 return -EINVAL;
>         }
> -       if (!qda_gem_obj->iommu_dev || !qda_gem_obj->iommu_dev->dev) {
> -               qda_err(NULL, "Allocated buffer missing IOMMU device\n");
> -               return -EINVAL;
> -       }
> -       if (!qda_gem_obj->iommu_dev->dev) {
> -               qda_err(NULL, "Allocated buffer missing IOMMU device\n");
> -               return -EINVAL;
> -       }
> -       if (!qda_gem_obj->virt) {
> -               qda_err(NULL, "Allocated buffer missing virtual address\n");
> -               return -EINVAL;
> -       }
> -       if (qda_gem_obj->dma_addr == 0) {
> -               qda_err(NULL, "Allocated buffer missing DMA address\n");
> -               return -EINVAL;
> +       if (qda_gem_obj->is_imported) {

Absolutely clear NAK to that. Imported buffers *can't* be mmaped through the importer!

Userspace needs to mmap() them through the exporter.

If you absolutely have to map them through the importer for uAPI backward compatibility then there is dma_buf_mmap() for that, but this is clearly not the case here.

...
> +static int qda_memory_manager_map_imported(struct qda_memory_manager *mem_mgr,
> +                                          struct qda_gem_obj *gem_obj,
> +                                          struct qda_iommu_device *iommu_dev)
> +{
> +       struct scatterlist *sg;
> +       dma_addr_t dma_addr;
> +       int ret = 0;
> +
> +       if (!gem_obj->is_imported || !gem_obj->sgt || !iommu_dev) {
> +               qda_err(NULL, "Invalid parameters for imported buffer mapping\n");
> +               return -EINVAL;
> +       }
> +
> +       gem_obj->iommu_dev = iommu_dev;
> +
> +       sg = gem_obj->sgt->sgl;
> +       if (sg) {
> +               dma_addr = sg_dma_address(sg);
> +               dma_addr += ((u64)iommu_dev->sid << 32);
> +
> +               gem_obj->imported_dma_addr = dma_addr;

Well that looks like you are only using the first DMA address from the imported sgt. What about the others?

Regards,
Christian.
