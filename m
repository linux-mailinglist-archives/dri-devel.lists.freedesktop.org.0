Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72196BAF25D
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 07:30:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E9910E664;
	Wed,  1 Oct 2025 05:30:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TwmtAmVp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B9BC10E659;
 Wed,  1 Oct 2025 05:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759296608; x=1790832608;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=lCJRqbVFkgp3ocHw1av8vi6KEoKvk5wTodABmSaQBWk=;
 b=TwmtAmVpktaw/hsF6s4Az1dzgVMwndvcSaSpdpeeTHqFu2sx3rTMhKpo
 3VxJbPeqa232bajIeXRGk0qd7RtWN3z19AJuyBfZU6Ui9OvskfzAC2voj
 F2UnP/pa+KldA43ZJRBoFuCRZysX6ZHQ00UMzD8ImHdEcU7IwLv1GqgLW
 rAY3oVWmOPhxOJYgoP1ljgVB8X/txkixJywV0H29C5ttckKl9ZIxnWxgZ
 PRVhEQ6H+iHcw/FWL8TnWuO6WpaK5J6AT9MlKju4bbDF8ljJEMSpyhkbn
 fVzSVtP62Qu8GFKR1ZFnuTq/7L/YCDQb0E8sLxRhmVAglod0F6aHwkJ2T A==;
X-CSE-ConnectionGUID: zAwM8mJ4RN6eASYJEAzj2w==
X-CSE-MsgGUID: fv0iepvEQtC3/jyaEMdIbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11569"; a="60776703"
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="60776703"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 22:30:08 -0700
X-CSE-ConnectionGUID: 5kI98RG8RwSTOIwpRUchLA==
X-CSE-MsgGUID: /XdGZWPUQZi2TlC4I6PPyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,305,1751266800"; d="scan'208";a="183962398"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2025 22:30:08 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 22:30:07 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 30 Sep 2025 22:30:07 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.65) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 30 Sep 2025 22:30:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m0o2/MBJFhyc1TDL+sqRxIOK4bSoX3OOe/tn/tQ/pIYfQBgphNcjh4LYLejHCVYbDzBxlT0oWfBEYULz/zLDnLzHVEj+gQLaFUu8Wj/iqe4ycvy6xHIHobR7Z1eAbJUgkWmhaAJhZmQKWL1zP9BuvFHrAIa8TajnYiTlNMZqnc8hLKAi9lGRHkrWWrR62dgUj6uZrMaS6VOD0E9bZ3hrZjju1+kd3Pg3LjyZCBxta9rSu8wl5lx0wDE1C4xLuYNrNiWflAMjhpywGpADSXo8aJX2GvpqYcJDka5m+mk8ERPo2nX4COtdCLVErAoIvdE5kr6EEwYlVtk2EgLlo+qKhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5UzLYzI47lx+IJLVr1/5BymS5MKxYlZbsTJE65nQ5gE=;
 b=BlryIqFkdq9YG84/WdEgomCyK36xmV7GCznyF9lgBix6K3jr/mxvmWmpvKoiLt/8XZM+PqjccAyc/Cn8xSZuPoUkuMOgc5Y5Ru94ILhQuliXLCfQwwN32xwW0pNJKw4qgTWvN/yy0uuWtPyD/hNaIYHS4j1XX+zin4gq8dBGllXuyGWR3bxtxDtADjWjqGvoJOGLerbXm6HJnL1gX9fI/QoL3rnBZPEcL5n7jHXzZZdm6IQu1d4FOo6qMqPnzL40kCYs5FEfYtb7Bz9jKP4Ym0+Cmt+imQo/pFtE2Q4BZiA5O7ZCzmGQIXJVA4e++vYvromlAaRPu5d7AgEKVGWlcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5341.namprd11.prod.outlook.com (2603:10b6:5:390::22)
 by BL4PR11MB8872.namprd11.prod.outlook.com (2603:10b6:208:5a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 1 Oct
 2025 05:30:00 +0000
Received: from DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839]) by DM4PR11MB5341.namprd11.prod.outlook.com
 ([fe80::397:7566:d626:e839%7]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 05:29:58 +0000
Message-ID: <24db7ad0-de95-44ef-9ca6-82a5bc190e90@intel.com>
Date: Wed, 1 Oct 2025 10:59:51 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/10] drm/i915/display: Add strength and winsize register
To: Nemesa Garg <nemesa.garg@intel.com>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
References: <20250926113728.606315-1-nemesa.garg@intel.com>
 <20250926113728.606315-4-nemesa.garg@intel.com>
Content-Language: en-US
From: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
In-Reply-To: <20250926113728.606315-4-nemesa.garg@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5P287CA0011.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:176::8) To DM4PR11MB5341.namprd11.prod.outlook.com
 (2603:10b6:5:390::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5341:EE_|BL4PR11MB8872:EE_
X-MS-Office365-Filtering-Correlation-Id: 9df2bb92-17e7-4143-9ff8-08de00ab8f9f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SytMVm1WWG9neXgrNExGbGg3Qng0dUkrYzFVbTUzSUZVZ011MFJsMDVhMjFJ?=
 =?utf-8?B?SFlsY2h1aXNiNGVLdDIyNm9WOWhJRG9WYTZlQmtRWk1lcGZpYlFUSXN2UmhB?=
 =?utf-8?B?MXRwbFc3WC9TaHVJWVVjYjJuejdGZUYrOUo3VG52dkNKbXZaSnZMa0V0MFhQ?=
 =?utf-8?B?cUZRNG9KVXN6ZVZRalBONXNqbHQ2L01WZGN1Ly9KOHMyc2w4K0tDR1hVK211?=
 =?utf-8?B?d2ErdGxTZ3ZITTNlU1k5TEpXb3ZUYkx6eHRURGZ4bnE2RGVMR0xzWFdUWkFB?=
 =?utf-8?B?SW1MWHZKUmpzYW93MTAvYldNZXl0Q1dWSitwZHo5Q0xDMzZ4QXdZOHA0T2g1?=
 =?utf-8?B?a1FCeGwxOWpJYnhDV1huS2ZqSHNVUkg4ZVNHRDZZOUFwK3ppQURQMThCOEQ1?=
 =?utf-8?B?ODZGVG1PMDY3S2RRYS84ZmRqNDhOQXFIMitWcjl5Uk95MUhOb3NxcGNOYm1E?=
 =?utf-8?B?Sk1VSGdyTUtXajRrQU8xdTZuUUdqdmc1NHZVWG1JNFQ4WXpaL2FIZG9tUzlQ?=
 =?utf-8?B?Zm0ySXVmcDdMSzhKS2Nocm0zR1pDdGsrR3pCY00zdzVnSXhrUVRUTEtCYndm?=
 =?utf-8?B?c0ZMVEkyZVZEN3VzaHBzbE14OHZpNjdWYUIvRDZSclhSalJvR1JsNTBON3VY?=
 =?utf-8?B?WDU0VEkyS285SSthZkZlWnVQbnlDcHZRZ3o4dVo3aW5Fa3FEbDI2TDJ5OGdG?=
 =?utf-8?B?RmV3TEFtWlU1T0pXWFBaMThYdE5mWWhIYTZha3pzSHpJWHNQY1BiMWZZblgz?=
 =?utf-8?B?b0xUdjM3dzQ1cEZxdHZRVXhpWFhObU5TcmF1S3VxbktpcmRqQU9mY24zWjds?=
 =?utf-8?B?c1d5WXhBUjFVR2RDaWMyY2JoVlVweDR6dTd1Wm5oL29GdnJjL2o2ZThwczgv?=
 =?utf-8?B?aWI1M055SitweTRxeHBycFhPa013S0RFbURzRDFKVnptUzN1VHF3YVRuTHAr?=
 =?utf-8?B?Uysyc05KRVd3bHVoQzNHUEZWWkpQcnRiZGp6NDQ2bzByS21LNVYwR3NGOWo4?=
 =?utf-8?B?YjA1WW4zUkFWV3hsaXlRbC9uYlViOHc2b3JnMUVhNVVhclVFRTVuOU9FcDY3?=
 =?utf-8?B?Qng0TlhSNjM1QStKVExqeTFiMk9DNlFCcEsyQzdzdzlraDN2Rjd0Q1NVdENj?=
 =?utf-8?B?OURiL2dSa09uQ2dSVG1jZTVJcEVFVjdMVlNJckdXckFwcXJVQWozRHRoOXdT?=
 =?utf-8?B?OUJZOVpiZDlFTm8vOFBEeFYvZ0p0cmlaS3dxOExMRGZ2c1dXR2phYW5OVTRt?=
 =?utf-8?B?dnRTS0s5SWtIRVdKV2s3ME1TNjB3dk1tZW9oSlc2cjNWbE1qZHJ4M2dVM3k0?=
 =?utf-8?B?RWkybVh3MTR0VHBUcFFML1J3K2tKRlRJV0hQSE9jamd1MkhVNTZWVlcrSFlH?=
 =?utf-8?B?S1Z2R24zTkVkY08wODhodldxLzFjWmlDdDNPbkFKbHY4dVNiQ20yNk1CK1hT?=
 =?utf-8?B?aVlEWmFtSDBLMWtNSEdDczlFcnNMTUVhM2FrbWxSNmx2VEJEbG9UZVRLKzdk?=
 =?utf-8?B?amg4M0ZQRGI3U3llNms1cVBEanFPd1RFZWpHSnViOEN6L29TYVhpeGFOcFdZ?=
 =?utf-8?B?NmVQb2NxU0l4UGJtSVUwci90SG9ERDZiTGJiSDJZVy9NazVGYlNyQ1g3QWQx?=
 =?utf-8?B?aE1xcUN2dXhaemFUay9wVjMySGt1SUNBbU5KT3g5NGtuRnNIeUtsczFOdFY1?=
 =?utf-8?B?T29tOURMbjFvU0FGamZjemFJMGgyeStDWjk4N1dkcHVmcnVGSVdDOWlxWVZC?=
 =?utf-8?B?LzZJWnhJZHhjdXJqbWhUUUMwRytId3FPYzV3eFdGNzArWWsyNzV1TjdjeW83?=
 =?utf-8?B?dEsxZUZ4M24wM2paZ3NqSXJnekN0a1VFMURXb3pVL3NyYkh5TkhrUEVvMUpX?=
 =?utf-8?B?TnZUZW5nalptVlN2MnNZSkJUc29na3pyVzFiVEgvbmI3Z0xJT0lSM2l2ano2?=
 =?utf-8?Q?ME70WNMRsO93HwsNgkS2CikLbhsjikwY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5341.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFdQTVZzbGkrcjNUNkw2eFMvWWpQN0lxcXFFSDQ5NFMyWk5FNDhFWDcvcW5z?=
 =?utf-8?B?MlFydFFCWW03RU5DK3I0V2xkelVOWkdJYnNWTDlRTDdlSW9iV1pOMTFuTTkr?=
 =?utf-8?B?Ti9sYVIreUhQWEFGZGxRTW1Sc3pjczUyaTZVaXlwZlhaLzBKZkxaWVhVWlYw?=
 =?utf-8?B?U1dBNm8xNDRobGs0WkVZNm50VWt1c29OVkJScUZiTVhydklxRlNJNmwwTHpa?=
 =?utf-8?B?ditEUExkcjc3U0plNEFTQ2E5UU12MU9NOXgzSmVldEordm5PUHJSNFJKKzY1?=
 =?utf-8?B?RXgxeVVnait1V1pZYWNJUGVrdGhCVmh1dUlwYnBZYjJlanR4TUwySjRtczFC?=
 =?utf-8?B?Y1hJTFBwQ3JGNHYxc2tydVVvdWFqaFNnOWpQbDdlaTFNNWFKMldIYkpCdk1U?=
 =?utf-8?B?eVNtUXNQUE9GbitCS3FIamFtNDJseExVQVBvNHdiY0pBTXhDNnFqcnNldkJ1?=
 =?utf-8?B?d2pVUkx5NkIwOC9KK0hIZ3NVTjk2cTA0UDY1WmNicDZvZGE0UDh6ODhkakhE?=
 =?utf-8?B?THBvUy8wcmZ2UXRxbnpUZS9OTGhMU1BoWFJPMmNCQUtINW9LWEhrQVRJQWQ1?=
 =?utf-8?B?NEd3YTkzaVoreVZmOUtLUjkxSjVGMFp1dDV0SHd5S2trME1DQktBZFFtZk1Q?=
 =?utf-8?B?VlgrRng2NGNIRWVnSUt1VG5nbzBRZktISWFpWXBHSUNGNUVPcUF6ZkVVU0Nw?=
 =?utf-8?B?SFlIdVNwR0hyK2FRc252WlVFVjV5ZFROb0xzUWg5d05hSjdMcXZMQlpiQ1VV?=
 =?utf-8?B?VGorbTluUkk5ZDdRZEhpNEh2WGpZM3RsaTczSkZMUTNDQklSTEJVdUhHVUdh?=
 =?utf-8?B?aGRQRzVkL3NiWEFHbGF0aUJ6eXh4cFMrUUlDdXJzeFNUYlc3ZFpkcExJRWFw?=
 =?utf-8?B?eGMvRmJRUFZtd3dLOXNIcDRJOVh1TlVvL2ZnVzVWU3FoUGhWem5sZjNJK2x5?=
 =?utf-8?B?bnBNenBNKzNsYzdtSUFEbVdRVHRWQkFaYXlwNVdqdFU4WDVHSDVEcFhCeDJF?=
 =?utf-8?B?aFEwQUE5bEZVbllJUGVJOTA1M1R4Y2lMenNCcnhMNy9wa2NSdlVxakQ0S3o1?=
 =?utf-8?B?ci9rQlBURVpwMmZpMXhsc3QyamU0YStKS21jNGJMa3M3Z20wa1R1aU1kUzNw?=
 =?utf-8?B?YWFFVURhaEpZNEhJb05TWXFuRk1JdXl0b0l1R1F4NEVlRlY1eHhDakx4S0dz?=
 =?utf-8?B?MzhpSVhmS3BsYnBTYS9NeUdEMEVXeURWem1ZMWFSMWk3NUpFQU9zTkJrdUQy?=
 =?utf-8?B?U3NOdHBGQzhQK0REZXI5RFhSR1pmeXBITjVCWW9sdUJWc1gwdmVxMVdpTnZI?=
 =?utf-8?B?NHZyV2R6OGZLTlpONUxHczczRVdqR3BFVDFCQ0lYZkdEek93RXRGVkJTUmVF?=
 =?utf-8?B?UW1ZdklaSzM4azY2aUZQYThrVzBsYjFiWExWTnplUDQyaTUrZmJLZXZHVU95?=
 =?utf-8?B?c1M4QTFSckhVOWJvODZNczViajF5WXlaR1NsZDVJTXpRUTdqS1NFZkRRdUNR?=
 =?utf-8?B?RFZlQkN6QUdtU2lIbWFyUHl3azJCbFpFSldlR0lLS3dmUEpTcS9hM0hQVVQ0?=
 =?utf-8?B?dEZ3VEYrVFgyQ0oxdHk1TjFmNGdiV01OU3AvOUFVaE5JdTM3SlU5cmttUngv?=
 =?utf-8?B?dWY0NVpPTHlEb1hLcVczN2JhdHZKdU1IT3N3dldYNEU4ajQ5MGwwMU85Wldl?=
 =?utf-8?B?eExHazdwWVlnWFRacEpPWkNxYkZhNkJGVnp0cWZXZjN5dTV6ZDRjcWVBWHhL?=
 =?utf-8?B?bUkrNENMTDNBenJQdE8vTm9kYitTMWt2dzh1OXR2REpaWnRqb1pzRUd4elZN?=
 =?utf-8?B?VmY1dDlxWS8ySVJob2pjek1Wam4zUnFDdEw5VVVScEtGQ2JDTlNHWDVMcHls?=
 =?utf-8?B?V2o0VzM0eHpTazIwZlVTSjEyc2cxTno4VTZ1V3RnY3pvWDBZb3BodCtlVjNZ?=
 =?utf-8?B?STBlWFhTRk43RjNnMDNJUmRZYW9WcVNWSS81SzZoNWZONUtDRFEreDBFSnJZ?=
 =?utf-8?B?Y2ZXRE9Kam5JZlRZSFgvQWRWbXYrbUxETkZoWEE5dHVlN1NvR0Y1bDBJL2FO?=
 =?utf-8?B?VXM0ZW9JWlRKbnlkd1A2NUNJQU8welpIZlZVaXdPUy9kQ1ZpMG1RejJKZ3px?=
 =?utf-8?B?NmFzWUhYWFlaaVhiZ1B0cHg1b1M2K1o4cVA3Z0FUT3M4TXBkc2JDdzFLK0hh?=
 =?utf-8?B?c0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9df2bb92-17e7-4143-9ff8-08de00ab8f9f
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5341.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 05:29:58.9227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: e+2FdbGqAc7JKWxaSxyhZsCvlkWVvcFRV7A5jDQn4TnhJuhyf4qE7k5+TtyDXALAhhfC9B53UweP9cDHiqO4UV3yermcOUx3L1MoRpDzE9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR11MB8872
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


On 9/26/2025 5:07 PM, Nemesa Garg wrote:
> The sharpness strength value is determined by user input,
> while the winsize is based on the resolution.
> The casf_enable flag should be set if the platform supports
> sharpness adjustments and the user API strength is not zero.
> Once sharpness is enabled, update the strength bit of the
> register whenever the user changes the strength value,
> as the enable bit and winsize bit remain constant.

The commit message and subject are no longer matching with the changes, 
so need to update these.


>
> v2: Introduce get_config for casf[Ankit]
> v3: Replace 0 with FILTER_STRENGTH_MASK[Ankit]
> v4: After updating strength add win_sz register
> v5: Replace u16 with u32 for total_pixel
> v6: Add the logging part here
>
> Signed-off-by: Nemesa Garg <nemesa.garg@intel.com>
> ---
>   drivers/gpu/drm/i915/Makefile                 |   1 +
>   drivers/gpu/drm/i915/display/intel_casf.c     | 110 ++++++++++++++++++
>   drivers/gpu/drm/i915/display/intel_casf.h     |  17 +++
>   .../gpu/drm/i915/display/intel_casf_regs.h    |  22 ++++
>   .../drm/i915/display/intel_crtc_state_dump.c  |   5 +
>   .../drm/i915/display/intel_display_types.h    |   7 ++
>   drivers/gpu/drm/i915/display/skl_scaler.c     |   1 +
>   drivers/gpu/drm/xe/Makefile                   |   1 +
>   8 files changed, 164 insertions(+)
>   create mode 100644 drivers/gpu/drm/i915/display/intel_casf.c
>   create mode 100644 drivers/gpu/drm/i915/display/intel_casf.h
>   create mode 100644 drivers/gpu/drm/i915/display/intel_casf_regs.h
>
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index 78a45a6681df..2aeb1da455d7 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -228,6 +228,7 @@ i915-y += \
>   	display/intel_bios.o \
>   	display/intel_bo.o \
>   	display/intel_bw.o \
> +	display/intel_casf.o \
>   	display/intel_cdclk.o \
>   	display/intel_cmtg.o \
>   	display/intel_color.o \
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.c b/drivers/gpu/drm/i915/display/intel_casf.c
> new file mode 100644
> index 000000000000..4597e576b6dc
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_casf.c
> @@ -0,0 +1,110 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright © 2025 Intel Corporation
> + *
> + */
> +
> +#include <drm/drm_print.h>
> +
> +#include "i915_reg.h"
> +#include "intel_casf.h"
> +#include "intel_casf_regs.h"
> +#include "intel_de.h"
> +#include "intel_display_regs.h"
> +#include "intel_display_types.h"
> +
> +#define MAX_PIXELS_FOR_3_TAP_FILTER (1920 * 1080)
> +#define MAX_PIXELS_FOR_5_TAP_FILTER (3840 * 2160)
> +
> +/**
> + * DOC: Content Adaptive Sharpness Filter (CASF)
> + *
> + * Starting from LNL the display engine supports an
> + * adaptive sharpening filter, enhancing the image
> + * quality. The display hardware utilizes the second
> + * pipe scaler for implementing CASF.
> + * If sharpness is being enabled then pipe scaling
> + * cannot be used.
> + * This filter operates on a region of pixels based
> + * on the tap size. Coefficients are used to generate
> + * an alpha value which blends the sharpened image to
> + * original image.
> + */
> +
> +void intel_casf_update_strength(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +	int win_size;
> +
> +	intel_de_rmw(display, SHARPNESS_CTL(crtc->pipe), FILTER_STRENGTH_MASK,
> +		     FILTER_STRENGTH(crtc_state->hw.casf_params.strength));
> +
> +	win_size = intel_de_read(display, SKL_PS_WIN_SZ(crtc->pipe, 1));
> +
> +	intel_de_write_fw(display, SKL_PS_WIN_SZ(crtc->pipe, 1), win_size);
> +}
> +
> +static void intel_casf_compute_win_size(struct intel_crtc_state *crtc_state)
> +{
> +	const struct drm_display_mode *mode = &crtc_state->hw.adjusted_mode;
> +	u32 total_pixels = mode->hdisplay * mode->vdisplay;
> +
> +	if (total_pixels <= MAX_PIXELS_FOR_3_TAP_FILTER)
> +		crtc_state->hw.casf_params.win_size = SHARPNESS_FILTER_SIZE_3X3;
> +	else if (total_pixels <= MAX_PIXELS_FOR_5_TAP_FILTER)
> +		crtc_state->hw.casf_params.win_size = SHARPNESS_FILTER_SIZE_5X5;
> +	else
> +		crtc_state->hw.casf_params.win_size = SHARPNESS_FILTER_SIZE_7X7;
> +}
> +
> +int intel_casf_compute_config(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +
> +	if (!HAS_CASF(display))
> +		return 0;
> +
> +	if (crtc_state->uapi.sharpness_strength == 0) {
> +		crtc_state->hw.casf_params.casf_enable = false;
> +		crtc_state->hw.casf_params.strength = 0;
> +		return 0;
> +	}
> +
> +	crtc_state->hw.casf_params.casf_enable = true;
> +
> +	/*
> +	 * HW takes a value in form (1.0 + strength) in 4.4 fixed format.
> +	 * Strength is from 0.0-14.9375 ie from 0-239.
> +	 * User can give value from 0-255 but is clamped to 239.
> +	 * Ex. User gives 85 which is 5.3125 and adding 1.0 gives 6.3125.
> +	 * 6.3125 in 4.4 format is b01100101 which is equal to 101.
> +	 * Also 85 + 16 = 101.
> +	 */
> +	crtc_state->hw.casf_params.strength =
> +		min(crtc_state->uapi.sharpness_strength, 0xEF) + 0x10;
> +
> +	intel_casf_compute_win_size(crtc_state);
> +
> +	return 0;
> +}
> +
> +void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state)
> +{
> +	struct intel_display *display = to_intel_display(crtc_state);
> +	struct intel_crtc *crtc = to_intel_crtc(crtc_state->uapi.crtc);
> +	u32 sharp;
> +
> +	sharp = intel_de_read(display, SHARPNESS_CTL(crtc->pipe));
> +	if (sharp & FILTER_EN) {
> +		if (drm_WARN_ON(display->drm,
> +				REG_FIELD_GET(FILTER_STRENGTH_MASK, sharp) < 16))
> +			crtc_state->hw.casf_params.strength = 0;
> +		else
> +			crtc_state->hw.casf_params.strength =
> +				REG_FIELD_GET(FILTER_STRENGTH_MASK, sharp);
> +		crtc_state->hw.casf_params.casf_enable = true;
> +		crtc_state->hw.casf_params.win_size =
> +			REG_FIELD_GET(FILTER_SIZE_MASK, sharp);
> +	}
> +}
> diff --git a/drivers/gpu/drm/i915/display/intel_casf.h b/drivers/gpu/drm/i915/display/intel_casf.h
> new file mode 100644
> index 000000000000..83523fe66c48
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_casf.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __INTEL_CASF_H__
> +#define __INTEL_CASF_H__
> +
> +#include <linux/types.h>
> +
> +struct intel_crtc_state;
> +
> +int intel_casf_compute_config(struct intel_crtc_state *crtc_state);
> +void intel_casf_update_strength(struct intel_crtc_state *new_crtc_state);
> +void intel_casf_sharpness_get_config(struct intel_crtc_state *crtc_state);
After refactoring and code movement some functions doesn’t appear to be 
at right place.

IMO introduce the intel_casf_enable() and intel_casf_disable() in this 
patch and add code to write the strength and winsize in both.

Similarly in subsequent patches add register bits, functions to 
read/write and call them from the intel_casf_* functions.

Regards,

Ankit

Finally these will be called from appropriate places.


Regards,

Ankit


> +
> +#endif /* __INTEL_CASF_H__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_casf_regs.h b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> new file mode 100644
> index 000000000000..c24ba281ae37
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/display/intel_casf_regs.h
> @@ -0,0 +1,22 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2025 Intel Corporation
> + */
> +
> +#ifndef __INTEL_CASF_REGS_H__
> +#define __INTEL_CASF_REGS_H__
> +
> +#include "intel_display_reg_defs.h"
> +
> +#define _SHARPNESS_CTL_A               0x682B0
> +#define _SHARPNESS_CTL_B               0x68AB0
> +#define SHARPNESS_CTL(pipe)            _MMIO_PIPE(pipe, _SHARPNESS_CTL_A, _SHARPNESS_CTL_B)
> +#define   FILTER_EN                    REG_BIT(31)
> +#define   FILTER_STRENGTH_MASK         REG_GENMASK(15, 8)
> +#define   FILTER_STRENGTH(x)           REG_FIELD_PREP(FILTER_STRENGTH_MASK, (x))
> +#define   FILTER_SIZE_MASK             REG_GENMASK(1, 0)
> +#define   SHARPNESS_FILTER_SIZE_3X3    REG_FIELD_PREP(FILTER_SIZE_MASK, 0)
> +#define   SHARPNESS_FILTER_SIZE_5X5    REG_FIELD_PREP(FILTER_SIZE_MASK, 1)
> +#define   SHARPNESS_FILTER_SIZE_7X7    REG_FIELD_PREP(FILTER_SIZE_MASK, 2)
> +
> +#endif /* __INTEL_CASF_REGS__ */
> diff --git a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> index 0c7f91046996..ae2f4a660ad5 100644
> --- a/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> +++ b/drivers/gpu/drm/i915/display/intel_crtc_state_dump.c
> @@ -373,6 +373,11 @@ void intel_crtc_state_dump(const struct intel_crtc_state *pipe_config,
>   
>   	intel_vdsc_state_dump(&p, 0, pipe_config);
>   
> +	drm_printf(&p, "sharpness strength: %d, sharpness tap size: %d, sharpness enable: %d\n",
> +		   pipe_config->hw.casf_params.strength,
> +		   pipe_config->hw.casf_params.win_size,
> +		   pipe_config->hw.casf_params.casf_enable);
> +
>   dump_planes:
>   	if (!state)
>   		return;
> diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
> index 358ab922d7a7..a9642641f702 100644
> --- a/drivers/gpu/drm/i915/display/intel_display_types.h
> +++ b/drivers/gpu/drm/i915/display/intel_display_types.h
> @@ -946,6 +946,12 @@ struct intel_csc_matrix {
>   	u16 postoff[3];
>   };
>   
> +struct intel_casf {
> +	u8 strength;
> +	u8 win_size;
> +	bool casf_enable;
> +};
> +
>   struct intel_crtc_state {
>   	/*
>   	 * uapi (drm) state. This is the software state shown to userspace.
> @@ -982,6 +988,7 @@ struct intel_crtc_state {
>   		struct drm_property_blob *degamma_lut, *gamma_lut, *ctm;
>   		struct drm_display_mode mode, pipe_mode, adjusted_mode;
>   		enum drm_scaling_filter scaling_filter;
> +		struct intel_casf casf_params;
>   	} hw;
>   
>   	/* actual state of LUTs */
> diff --git a/drivers/gpu/drm/i915/display/skl_scaler.c b/drivers/gpu/drm/i915/display/skl_scaler.c
> index c6cccf170ff1..19aeb8d5b79c 100644
> --- a/drivers/gpu/drm/i915/display/skl_scaler.c
> +++ b/drivers/gpu/drm/i915/display/skl_scaler.c
> @@ -6,6 +6,7 @@
>   #include <drm/drm_print.h>
>   
>   #include "i915_utils.h"
> +#include "intel_casf_regs.h"
>   #include "intel_de.h"
>   #include "intel_display_regs.h"
>   #include "intel_display_trace.h"
> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
> index d9c6cf0f189e..90a118bc77de 100644
> --- a/drivers/gpu/drm/xe/Makefile
> +++ b/drivers/gpu/drm/xe/Makefile
> @@ -230,6 +230,7 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
>   	i915-display/intel_backlight.o \
>   	i915-display/intel_bios.o \
>   	i915-display/intel_bw.o \
> +	i915-display/intel_casf.o \
>   	i915-display/intel_cdclk.o \
>   	i915-display/intel_cmtg.o \
>   	i915-display/intel_color.o \
