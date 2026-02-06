Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mNKfBF41hmltLAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 19:39:26 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A56B5102156
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 19:39:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0463710E8F8;
	Fri,  6 Feb 2026 18:39:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="zGSOzCT0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012024.outbound.protection.outlook.com
 [40.107.200.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35F8610E8EE;
 Fri,  6 Feb 2026 18:39:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zGgdV8qHjMxCY/4Ii3PqanlhHDvPjfgJNjFOv0HcxGrR10kE4JgIhdyYTVP7QM/LYd22ORv3VIC5BJu2NfcFIFSA5QP5yEzf8aI2aHJiczQ+ni6+N30A6Rh2yuleBEDYLCpwtZKtU/kfDLWjQg4f0dn5bLSLivwze9YxVL0hRTNtzP5RrFceqRQKVUleYyXPwC1oMUEWD5WkgiX4H0kgm0QoPpGs962DwJ2WvHXAwjld6dP9TSn21dXI2CQnR9gckWSt0LyNTF8CHOQs5E5XM9q71jsRIUpT0ggc9wOgrxJZsXo1ga7ZCyhJ2yL6lNaOtrfuozEKnoVENhOV2oqoyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vy8RT5MmDe6GXHYrIer/6XxgS6VSLrjp7//LmIe11F0=;
 b=ei4zk4g/S7mdlMf82vS/KbOoAsOjOvlXyfabnINrU7S5UjbKJDy5KJIwl2XoWHVwVxUC+fM7Ua85fsMGyYk+Gfa6xKIhfvlBip1dh5MAI37Zd/Cj7LW7DispdyBtbjh2fJ0AXEmoE4X3CM5RPoazMXa9FK0J0/Zp85hY3liMcsulyvTuhxck1GS9L8ix/kpNC4GycJ9DluK3Yb1nnL/Hn2rl+sNrU0XrucMK+zLrYzUTdDTzsVvb+3Iw7+irb+dN3pRAaRNITzl34hrdVN2/BE4czFYxyOrSSkBzhC5tS3sb0qD4caPxsNFNE4u2QBaX06m0hrhW5aGZpd/6ZcRUaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vy8RT5MmDe6GXHYrIer/6XxgS6VSLrjp7//LmIe11F0=;
 b=zGSOzCT00iGhnbcYXTGKvNpmzNwtv2mpo+/OyICaQk2XJ4HdUK5yLo1cp8ffaWus0D62ifuG+iRoXgjTAhgLZ8BCk903dxSFojvDO1bJsYTymLqrotbeMuDFlRbxluCT2O1qUmlM9QZOjnisxKD6v4VRg7QIlLQc8PnYaFeYUeE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 by IA0PR12MB7649.namprd12.prod.outlook.com (2603:10b6:208:437::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.14; Fri, 6 Feb
 2026 18:39:11 +0000
Received: from BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe]) by BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 18:39:11 +0000
Message-ID: <0d56fa79-94b3-414e-a3c9-5b142d116ec9@amd.com>
Date: Fri, 6 Feb 2026 13:39:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/19] drm/amd/display: Refactor PCON VRR compatibility
 check
To: =?UTF-8?Q?Tomasz_Paku=C5=82a?= <tomasz.pakula.oficjalny@gmail.com>,
 alexander.deucher@amd.com, sunpeng.li@amd.com
Cc: maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 siqueira@igalia.com, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bernhard.berger@gmail.com, michel.daenzer@mailbox.org, daniel@fooishbar.org,
 admin@ptr1337.dev
References: <20260203185626.55428-1-tomasz.pakula.oficjalny@gmail.com>
 <20260203185626.55428-6-tomasz.pakula.oficjalny@gmail.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20260203185626.55428-6-tomasz.pakula.oficjalny@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0048.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:2::20) To BL1PR12MB5126.namprd12.prod.outlook.com
 (2603:10b6:208:312::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:EE_|IA0PR12MB7649:EE_
X-MS-Office365-Filtering-Correlation-Id: c685f124-929e-4cc1-2a5a-08de65af0525
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eXFOUWw4T242QUFXSTNIWnovT0tnYzQ4YnZXWVZWa2FEaFhpQ2dWZDRUUmZT?=
 =?utf-8?B?S05jeG1JWjdUR1pPVitZNTUzRElkNTlNU3BwVTJLaUorRG1Pa2hsTnRwY2JC?=
 =?utf-8?B?OXA1SVN6NDNjQ1lPWUZ0R1NNWkFXU3JWWkwzbHZTRm1JNzRtTmVyVEZjUDRZ?=
 =?utf-8?B?Nys1QTRoREh3SUdhTFRNUXVLb3pLcWRXYWNTSkJaK2RRd01EYkVTdEd6dnZG?=
 =?utf-8?B?MFJ1MzFVQ3BQSGFhSVBmNTAwdk9sallaRUp0VnpEdW90TmFLem9VRWpNZjkv?=
 =?utf-8?B?eDQvMWJyMnpYVjEvSGZQdCt3Q0dZYkpBYzBGOXV4YUM4WTU0U3RUMnBvakRW?=
 =?utf-8?B?cjk3M2NsdkFvWEd6eXY2NU96V0U5VHNrNHhGNnB4TlUvTTZuOVNQSG0xR3BN?=
 =?utf-8?B?QjgxYXNVVVZoS25JQ2o4SEhqQWg4RE1VME4wdGVWVWxOclN2Y3hDV1Y1aHNy?=
 =?utf-8?B?MGJtaFJ5Zi9qVTQ1TjZqUDdlandMZUdraHVNWWhYWTJUN2hidUtkN0cyR0Rv?=
 =?utf-8?B?OXNzc0Q3UUh3TlVoWFpIMkxlL05keUtKbUtjVzMxbVFTZHZNV2IzWTRLL25l?=
 =?utf-8?B?NWIxcmE4cGtYckdneE5NK3Y0RldRcXhtclMwTkdVRnlQazdCTENCTkVZQ3k2?=
 =?utf-8?B?T2RPMFRSWkVwbUl2UzdkemVGR0hZdlVZSDl4SjJYU09oKzZONklVL0dSVFpX?=
 =?utf-8?B?T3Q1UzZ5NzVjaHF1bWxERGpBVEVLUDRnOUVSTVYyUVdaZGRoWE5xMVdPVTNx?=
 =?utf-8?B?QWpsbnNTNjFJM3F6L082Zm4zcjFZV3dZTDZEZ04xLzVacFhFWEVQSmVHNzJC?=
 =?utf-8?B?NlBxNzRQWldGczVyOVJnN2VIQ1dLbWRucXY5UnZHY3NsY1dLYzFZMUljM3NR?=
 =?utf-8?B?Y283dzN0Ym55ZEo2b0gvK0Z6MjY5Z2wyYkl2eW9hZWRaMkorcVNPV1dQaTJi?=
 =?utf-8?B?eXNSSk8zWlJDeWNCUXdnTHJ0NDdTNjhjOUpwczg4a1hLS0NaelZ4V1RPMy9G?=
 =?utf-8?B?aGY5S2plUVdybUxhaUZXV1kzV1hmQnRzc2plckhpZEhQZU5CTk9DZitZTEJC?=
 =?utf-8?B?MTdVa1AwT1pyQTUyb1M0Z01PMUVmVEZOV3dPOTBhaVFBQlg2R3cyaWk5VVVu?=
 =?utf-8?B?WUtvZUtnZDRxL2xsQjFPQ0x3cjlhOWpnUFhVUHFIR0Nnckl6UzQwckQ5WXlP?=
 =?utf-8?B?eStnSGY2S3c1Y2tYMXF2cHd5L1lhL3kxM3N2Qkl0cXZlZ3hDT0VDSElKUGRJ?=
 =?utf-8?B?a1hNWURXZW45bTFaNXdNeHhnWmRxU3FKV1pCNmZ3bXZrSjVzblZyMDQrTDZJ?=
 =?utf-8?B?YXQ2Yk9PaUhHQU9qRWNBaFFaK1dEeEVEanJhTDJ3WXZyYVoxNExkQ0V5dFMy?=
 =?utf-8?B?UTZLQnE5K3g4YTdhenJ3Q0pZdDd0aVV5QVNjT2pVU0UwVkVaQVZrRkJwWnpU?=
 =?utf-8?B?Y1VWdXl1ZmUzRjNVdkhJVU1yT05OTmpBaWF0VVcrTFh5TDBSVGtEU0JsVXRX?=
 =?utf-8?B?eVJUdWZDTXJzYnBvV2ZPcjRLWnNrT3lDQmdVZFZCaDcybHJOS2xMcW5HbjZW?=
 =?utf-8?B?Q3ZjaWRQYzN4M3pMbEJTZ3FBZm5mVDVNbFpEL2NOTU05aGNKaXJKKzduSmpG?=
 =?utf-8?B?NGU0UDFqb3VZc2JVQUk0dzB0SUxaSWlsQm1CZ3hzRHR4MHRDaklmc2pRa0xI?=
 =?utf-8?B?TXhocllIODdzZ2QyZEVnSFlDYUo1a29xbEhvZU4waklYa0RBM1RGNmxIM1ZL?=
 =?utf-8?B?WFJQaWJKRlNRakh2VHlCZmRDeDFYMkw4TzZKK1FNdFBhdStSKzMzeUM0RTUx?=
 =?utf-8?B?eE1CWTVKRGtzWEZhZTRYOFlKQ1ZWOVBYQzZMQ08ycWVjM0ViS2lDUnZFZnNy?=
 =?utf-8?B?bUZXeEYyMGFvczlvek9rNlNUS1NHUlVOUDExNjZ1ZFBsbFZHRmZvdjl5UlAx?=
 =?utf-8?B?UkFJeTRtV2VFcGxEK2JKc2c5YVJrNnR0ZGhNL0tmN0pTL2JRZm5UZlYyOW15?=
 =?utf-8?B?R1lTUFRQNWtvNm10aGRiMW43YTRVb2ZQblNLSjloU1d3Y2tHT0pUZ3RjdHJ1?=
 =?utf-8?B?RWdIbDc2eTVmM2VBRHdDRm9vak01cWtIdTFPQitzcWs4aWcvQlBTV2Nra0lO?=
 =?utf-8?Q?Aly4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5126.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkU1RHBTOVZ1NE5pMHFmRnZVQTVSaDRZS2pSdnBLNlBMZ0lBdFBuTTRIQmJC?=
 =?utf-8?B?ZEJDVlJzWTFYbmNhdVgwdGx6ekpGdWYxaUtsUW45QzJXaEoyR3h3Z0ZHOFBk?=
 =?utf-8?B?ZFhWUnp4Q054Y2doVHZWM3dYdlh0clJjcGFoQjR3akZQMk5uVzBSQ2dkSHlB?=
 =?utf-8?B?SUJZcE9WMlhMYzZHaUNVdERvK3lZQ0dlT1N6am1QSW1PckN4Zk9KNDlTL1pE?=
 =?utf-8?B?ekZ6SnJwZk5iMDdPR1lreCtIZndDZFVFUUhueXcwanM2TzJ2dXY2REl0d3BK?=
 =?utf-8?B?RlVTSmNEQkd0M0dzM0FxMlc0dUI3bWNXWjZHSTVKZGdWMURkZjJ6ck1yMFk2?=
 =?utf-8?B?RDkxTlhFWnJadTVFWDhrOGFMYklpaVNBTHhybStGdUQveHJMcnVtR2NKZGFx?=
 =?utf-8?B?NFhyb1lNcWtXYjZvODFpd1VFRDdXTTVheGZjWUR5S2JOVXhKZGZJZFMzZDNx?=
 =?utf-8?B?dWhRNm9mb01EWVdpOW91YytwNlBic0xrQ3ZiZlkyT25Mb2FrMnVBT281c3ZW?=
 =?utf-8?B?YnhoakFQQ1pCOVBRbmRybzlVQUtlOC9VOVBXaTRGcUYrWERRSmw0aEZpK011?=
 =?utf-8?B?NTUrOS9wNVdaVEdvcUp2VExDL3loNmRKUkNOOGFPcFBHcnB5TlRNWWdUNThK?=
 =?utf-8?B?WmNMNzJxQTNYZUNwVGdzK1R1ZG4rYkVxalJrdmlIY0hpTUs1emlNUFhjMHEv?=
 =?utf-8?B?MTAveitRc1F2eVZxZ0NEQmZQQkgyeWh6aE9XNTJpQmJGYTg5R296THAvUzVP?=
 =?utf-8?B?ZWRWWElJbE4xS1VvV2hBaVFuU0dTcGxiTEdUWW9nTXRROHJWaWVNSjZ0Wkls?=
 =?utf-8?B?ZzFObWs0WU5mSnl3alVweEpSaXgrbDh2a0xZTFB1TjZMQU1YdVJXYlRMK1c0?=
 =?utf-8?B?a3NLUjIyRVZDRjRnVVduUXhHK2dBMzl6MVg5QWRXUWVzN1BNS0xNSXZvVExW?=
 =?utf-8?B?SFpTc2w3bENNc2ZVZVlNc0pZakFOdFRTNzUzZVlpNHI4K2dGcmJWOGUxdksz?=
 =?utf-8?B?dVpKUElVLzRFUk9nYmVlUU1tclBIc29ML25mNnNOV0xDNUgwRDVBcEZSa3NC?=
 =?utf-8?B?ay9la25Ia1lISGdiZE12U2plTWFIendKNWxzOGpKb3hHNUNjWGkzakIxZEpG?=
 =?utf-8?B?TmJMTzNTTVJvd2xKa1pMdjRkTW9RTVh0MXcwRlJudXVnNkpGWWpCVUJ1M2Vz?=
 =?utf-8?B?SUNMaHBzZ05nVEM5TEpvKzlaTXVEODI0eFJaZTRhRGsxQkpKQ3E4RnNpWndS?=
 =?utf-8?B?d1UxYXlHNmFjVXhYWHpxZU1kQ01INmpvaWJvNnpvUmFiVVN1Q1ByUjJrcmJR?=
 =?utf-8?B?Ylp6TDMyTWc1eTg2UlByYld0dHdNZnpUZkwrT0puVFREaGRKZXlVeXR4S2FL?=
 =?utf-8?B?TXg4RDk3VXlkb0xVZzZyanJYV3RSenRxYVEwRFY2N3ZUZUhMVld0OU9XUjVO?=
 =?utf-8?B?WVpvUzA1T2g5ZU9xT01VS1Z4OERvTCs3ZVpqdGNLUC84Y0tsc0crYTZ6V2Jx?=
 =?utf-8?B?MnNTbXFxL1VwdFNWeENCeFdidHUzM1pCTHQ2d0lLb0Vvbzc2cUlQZHE2MU54?=
 =?utf-8?B?dDlYRFlNd3ZqUFJVNHRXbGY2bXFJTnR3NXRvVUZiSlFka2VPZHJRcTMxNWZB?=
 =?utf-8?B?QWhUa0VDR1Q3WXozUG1HcUEvZ2R1THJNeldOR2liVWNmL2FqOFNkb1B1SVNQ?=
 =?utf-8?B?MUxObmR0dXJTdTcrRkdMdDl1RG5HbnJHdDZNUzBQQ3hnMkJURHZ2cndHKzMy?=
 =?utf-8?B?b1oyNTdKUTJMSCt0MjRjbERXd2N5QnpERFdhMUxwcE1QVmZ6UFJjM2pqWVZv?=
 =?utf-8?B?WTlqNW1OQkJqVkx5b2tKVmtFdTN1SXoxbys2eUpFNENCNlk5ZnM3WkdwWG4r?=
 =?utf-8?B?VUFWbTkxbE8yc2w4SjZreUx1Z2V4ZDFqY28rNU9PSVA0TWNnNUFtVlJwYStJ?=
 =?utf-8?B?MDMzQ2d1OCt1dUsrak83RDhGalhLOEFGYm0wbWp0TFV4cmhhR0RJcDk0VW82?=
 =?utf-8?B?ODBKL1FhMjBVVzN5YXVjV3BkVWppd0RIVDJnbENBL1pid1oxcUluR3dkWnFB?=
 =?utf-8?B?UDBnaXZLS2cvNGx0SnR3VnlZNlBjaDAzOUFva0VjMnBjUlR1N2ZtSGxhVGQ5?=
 =?utf-8?B?YmdlTHBrQTRnMERvRDJkVTlmc2p4dnBOMS94Vy9ucm5NMlhOOGVvNmROaCtp?=
 =?utf-8?B?VzF3ZWdZUWlQdlRPMWUrdWIwYVJsQzlmVFBtaDdNQmE1RzZTekRiL1B4QnA4?=
 =?utf-8?B?ei84bXhzcFZyMVZrNkhLS0xodGlEWXFyRFI5eENGR2xydmJxYXpoKzJUQnNB?=
 =?utf-8?B?Y1VReG1DVE0zZEpUOGhyU1ZGTWRGWFA4RGRPNVFiNXNyTWZrYjZYdz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c685f124-929e-4cc1-2a5a-08de65af0525
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5126.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 18:39:11.5439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8OE59D4R1MCFck1M0p6MzrqH0Pm3fdMgQ/Nw2MQTBdndYannPGhn+85r/ZGNPYXd0yeFV3G8MKTZcwbdoFrTug==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7649
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com,amd.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[harry.wentland@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,igalia.com,lists.freedesktop.org,vger.kernel.org,mailbox.org,fooishbar.org,ptr1337.dev];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,amd.com:mid,amd.com:dkim]
X-Rspamd-Queue-Id: A56B5102156
X-Rspamd-Action: no action

On 2026-02-03 13:56, Tomasz Pakuła wrote:
> [Why]
> DP->HDMI PCONs prevously entered the DP path

Again, not a fan of changing behavior in a "Refactor" commit.
Maybe drop refactor and put the functional change in the title
instead? And/or disentangle the non-functional and functional
portions of the change into two separate commits. Though I'm not
set on separating this into two commits.

Otherwise the change looks good.

Harry

> 
> [How]
> Restructure amdgpu_dm_update_freesync_caps() and move
> dm_get_adaptive_sync_support_type() to dm_helpers_is_vrr_pcon_allowed()
> to better reflect what this function does. It never actually gave us any
> other info.
> 
> Signed-off-by: Tomasz Pakuła <tomasz.pakula.oficjalny@gmail.com>
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 24 +++++++-----
>  .../amd/display/amdgpu_dm/amdgpu_dm_helpers.c | 39 ++++++-------------
>  drivers/gpu/drm/amd/display/dc/dm_helpers.h   |  2 +-
>  3 files changed, 27 insertions(+), 38 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> index 284f5b326c18..9346b62d981b 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> @@ -13278,7 +13278,8 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>  	struct dpcd_caps dpcd_caps = {0};
>  	const struct edid *edid;
>  	bool freesync_capable = false;
> -	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
> +	bool pcon_allowed = false;
> +	bool is_pcon = false;
>  
>  	if (!connector->state) {
>  		drm_err(adev_to_drm(adev), "%s - Connector has no state", __func__);
> @@ -13306,18 +13307,23 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>  	if (!adev->dm.freesync_module || !dc_supports_vrr(sink->ctx->dce_version))
>  		goto update;
>  
> +	/* Gather all data */
>  	edid = drm_edid_raw(drm_edid); // FIXME: Get rid of drm_edid_raw()
>  	parse_amd_vsdb_cea(amdgpu_dm_connector, edid, &vsdb_info);
>  
> -	if (amdgpu_dm_connector->dc_link)
> +	if (amdgpu_dm_connector->dc_link) {
>  		dpcd_caps = amdgpu_dm_connector->dc_link->dpcd_caps;
> +		is_pcon = dpcd_caps.dongle_type == DISPLAY_DONGLE_DP_HDMI_CONVERTER;
> +		pcon_allowed = dm_helpers_is_vrr_pcon_allowed(amdgpu_dm_connector->dc_link);
> +	}
>  
>  	/* Some eDP panels only have the refresh rate range info in DisplayID */
>  	if (is_monitor_range_invalid(connector))
>  		parse_edid_displayid_vrr(connector, edid);
>  
> -	if (sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT ||
> -	    sink->sink_signal == SIGNAL_TYPE_EDP) {
> +	/* DP & eDP excluding PCONs */
> +	if ((sink->sink_signal == SIGNAL_TYPE_EDP ||
> +	     sink->sink_signal == SIGNAL_TYPE_DISPLAY_PORT) && !is_pcon) {
>  		/*
>  		 * Many monitors expose AMD vsdb in CAE even for DP and their
>  		 * monitor ranges do not contain Range Limits Only flag
> @@ -13342,17 +13348,15 @@ void amdgpu_dm_update_freesync_caps(struct drm_connector *connector,
>  			amdgpu_dm_connector->as_type = ADAPTIVE_SYNC_TYPE_EDP;
>  		}
>  
> +	/* HDMI */
>  	} else if (sink->sink_signal == SIGNAL_TYPE_HDMI_TYPE_A && vsdb_info.freesync_supported) {
>  		monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
>  		freesync_capable = copy_range_to_amdgpu_connector(connector);
> -	}
>  
> -	if (amdgpu_dm_connector->dc_link)
> -		as_type = dm_get_adaptive_sync_support_type(amdgpu_dm_connector->dc_link);
> -
> -	if (as_type == FREESYNC_TYPE_PCON_IN_WHITELIST && vsdb_info.freesync_supported) {
> +	/* DP -> HDMI PCON */
> +	} else if (pcon_allowed && vsdb_info.freesync_supported) {
> +		amdgpu_dm_connector->as_type = FREESYNC_TYPE_PCON_IN_WHITELIST;
>  		amdgpu_dm_connector->pack_sdp_v1_3 = true;
> -		amdgpu_dm_connector->as_type = as_type;
>  		amdgpu_dm_connector->vsdb_info = vsdb_info;
>  
>  		monitor_range_from_vsdb(&connector->display_info, &vsdb_info);
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> index 1f41d6540b83..45a91df619d9 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_helpers.c
> @@ -1381,40 +1381,25 @@ void dm_helpers_dp_mst_update_branch_bandwidth(
>  	// TODO
>  }
>  
> -static bool dm_is_freesync_pcon_whitelist(const uint32_t branch_dev_id)
> +bool dm_helpers_is_vrr_pcon_allowed(const struct dc_link *link)
>  {
> -	bool ret_val = false;
> +	if (link->dpcd_caps.dongle_type != DISPLAY_DONGLE_DP_HDMI_CONVERTER)
> +		return false;
>  
> -	switch (branch_dev_id) {
> +	if (!link->dpcd_caps.allow_invalid_MSA_timing_param)
> +		return false;
> +
> +	if (!link->dpcd_caps.adaptive_sync_caps.dp_adap_sync_caps.bits.ADAPTIVE_SYNC_SDP_SUPPORT)
> +		return false;
> +
> +	switch (link->dpcd_caps.branch_dev_id) {
>  	case DP_BRANCH_DEVICE_ID_0060AD:
>  	case DP_BRANCH_DEVICE_ID_00E04C:
>  	case DP_BRANCH_DEVICE_ID_90CC24:
> -		ret_val = true;
> -		break;
> -	default:
> -		break;
> +		return true;
>  	}
>  
> -	return ret_val;
> -}
> -
> -enum adaptive_sync_type dm_get_adaptive_sync_support_type(struct dc_link *link)
> -{
> -	struct dpcd_caps *dpcd_caps = &link->dpcd_caps;
> -	enum adaptive_sync_type as_type = ADAPTIVE_SYNC_TYPE_NONE;
> -
> -	switch (dpcd_caps->dongle_type) {
> -	case DISPLAY_DONGLE_DP_HDMI_CONVERTER:
> -		if (dpcd_caps->adaptive_sync_caps.dp_adap_sync_caps.bits.ADAPTIVE_SYNC_SDP_SUPPORT == true &&
> -			dpcd_caps->allow_invalid_MSA_timing_param == true &&
> -			dm_is_freesync_pcon_whitelist(dpcd_caps->branch_dev_id))
> -			as_type = FREESYNC_TYPE_PCON_IN_WHITELIST;
> -		break;
> -	default:
> -		break;
> -	}
> -
> -	return as_type;
> +	return false;
>  }
>  
>  bool dm_helpers_is_fullscreen(struct dc_context *ctx, struct dc_stream_state *stream)
> diff --git a/drivers/gpu/drm/amd/display/dc/dm_helpers.h b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
> index 7014b8c2c956..e51f1e489129 100644
> --- a/drivers/gpu/drm/amd/display/dc/dm_helpers.h
> +++ b/drivers/gpu/drm/amd/display/dc/dm_helpers.h
> @@ -220,10 +220,10 @@ int dm_helpers_dmub_set_config_sync(struct dc_context *ctx,
>  		const struct dc_link *link,
>  		struct set_config_cmd_payload *payload,
>  		enum set_config_status *operation_result);
> -enum adaptive_sync_type dm_get_adaptive_sync_support_type(struct dc_link *link);
>  
>  enum dc_edid_status dm_helpers_get_sbios_edid(struct dc_link *link, struct dc_edid *edid);
>  
> +bool dm_helpers_is_vrr_pcon_allowed(const struct dc_link *link);
>  bool dm_helpers_is_fullscreen(struct dc_context *ctx, struct dc_stream_state *stream);
>  bool dm_helpers_is_hdr_on(struct dc_context *ctx, struct dc_stream_state *stream);
>  

