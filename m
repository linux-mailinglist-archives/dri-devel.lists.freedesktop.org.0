Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MO4KNv5foGmMiwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 16:00:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BF371A825D
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 16:00:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB28410E968;
	Thu, 26 Feb 2026 15:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="aX9SBK1b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012015.outbound.protection.outlook.com [52.101.48.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7746710E05D
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 15:00:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ipXDqFrEuvgVUzEYbaXC+VVvSuzMhWqYqg+8csOytL8J1btxq6O1GV1c33FFM2ty2jmSeuTxANC+2YG0eEKICXi2cSRGNfeSvIG3riWukWrMYYBMfyRS/M0Gqp/EYJMIgrIMLcqwXWuyk105VG+A/kyMsqlDp7WiEqOSukH3iigbIHv7EB6XDzg7TH/H0HWoBEzBNZpq1CaLSsItkIncfPGI6lki2W6hNGw3LalbmME4pRUQgBkXJ57eqMB8VpHRKnGJ1757paOREvHiysGALOLD7UsXL8reW05uStLVeez9nwLYqz5FCwZebzFTFSMrhcFvYKiKpPQOQ8hz77KofA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=48F6svqXtC5Sy2nl5H2DF7sub791rjWNKqQweOaNt+4=;
 b=EOT47zpLK15KsYHZ+zopBcoBa3J+Z+WfvdZWaoSRl6HpXPNuF6ge690uiqRFdMaYEsPHvxX8x7GOIP8eEVNEkjklgS0xW3sAIN/SFc9VE+NgekJkJHy3sCDzN73A2E/DOFQROYHLaE6uhZYmsxtnFojWjiT2PetWbaqBF76xBUZ4Dbf26/Vp0fYB7sAXq44XhnkQv2uXlFSUdT1vLMEwDOxcX6nmcCbGdir15xvoDF/fQY+ZKTopGGqsM8wqsPENq6hM5su42m2HLDxPUQYO8k62/+L9coOg8p9VO+fcOv2ekMQUcx9H00NJkauFZh7gZLwLKfk1pX33CObkk+tbfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=48F6svqXtC5Sy2nl5H2DF7sub791rjWNKqQweOaNt+4=;
 b=aX9SBK1bATl6BhiWLyR364PJfxVPD3VFL2cC6dk8u5vcqBH/3Tgktp9LjopodeZGQHhqXfusD/OqIqHJsX/IkKOpscDoiDjOt5WzYnDwhiDRWQur7FteZ3sgSNeQoeYq+5jpsmZuNvlynBBJK3dJ5n/HJ6qwwQ7luYUe83AK98k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7322.namprd12.prod.outlook.com (2603:10b6:806:299::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 15:00:03 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9632.017; Thu, 26 Feb 2026
 15:00:02 +0000
Message-ID: <09364420-1044-4c9b-9907-b92b06653eaf@amd.com>
Date: Thu, 26 Feb 2026 15:59:49 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 7/9] accel/neutron: Add job submission IOCTL
To: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>,
 Oded Gabbay <ogabbay@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>,
 Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>
References: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
 <20260226-neutron-v1-7-46eccb3bb50a@nxp.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20260226-neutron-v1-7-46eccb3bb50a@nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4P288CA0045.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d3::18) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7322:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b162715-8dab-4b79-94ab-08de7547b75b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: lK8mN3gBWhDTEvgt2/8RxX0UHMJhbu7pPFSrM5wuOFKXr3RTstIS72JRChvKHSq713vcB/blDNptdSQkR0LVQYoRzH8LXZo/e4SsLZSBGJG1scCuwg7apFhDK84++FRG+AHW6Vv7nnrDduwM5cFJHKiQAYaux5uHFyNRlty+H1AVBXjYN+IJV8Y27jaCUSPkl1bk/EIXNR8Xxl24qxixgKwFnbMp1pB0diT6AChFdUf6Ek0jD5Ak+FlXQK/kugRViTfIybaxArrjAxOOIrDmwKPkKebo9rUHV20374Yl9WGvb60PkwCC7p+wns6yDd+KlwOt+Hn25JCrhFjN2R93IlnOn7+CU+7/zqLVm5adiePLLzuKWI40Jjaok20Xkr+EHTwFXpsnA3l4bdHhiogV3RRWPvF+x5iI4LcLUzpwvcodqppHGKtCPPfGY2hEVdzvD4OJivBvBFTPIugNPlZsG5++LRTxT11KLbupBqOrcKKN8COqxjYbf5cIMpc4oxFmOla4QdfP+jg/L+Iao+g0d73lYllwPeLCZDWo1WoZ0+d5ydg3ceKNZ0anWwpVKfRaF8MN3wlVQeIFKXYxs2B9Pl4QquxO72WEGWvnXqio2SlrKc++f2bctrMnBum55S+SXopgqPcwZEdUYQL0nsoWEuUKluSbLWryFfFOJnXu2ySIaNyIhvQ3x7Ny+PcRdekVcG/85k+TaFfTzstqVs+e9ie4iPmkSvJ99tQLNIZqX9MO+AdrFC5sT5xB/Y3iPQ3OffSOACbC4R09CQ8++bDnJg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?djVOWjU5LzYxQUdtN2hDZU1FL1VFdGhCNEU1NDVLOHVZZWtBeDZLSlloYXdG?=
 =?utf-8?B?WXczV3lGSkxIcmlDc2RHUXFNUVFsaitVditCOTh2R3N6NmZTNFdjeU9ZWmNL?=
 =?utf-8?B?eEVVNDNESlVSa1hFd3V2cVEvMHd5RVhRanN1RUovaklVaDhLRUt4TXRoNEds?=
 =?utf-8?B?UWdBM2FrK1hWaStFVUpsQnZkaEc1NjFiZVIybGlNbWpQdldSUEZVUXEzSFVs?=
 =?utf-8?B?akhVNGFXV21hWWRyUXJ2cjRNTDVjSXRxL0pnWkFnR0RGNWpKbk00MzF6VTFw?=
 =?utf-8?B?em9iSWI3dTBIcEFBQ3pDWFJuZmpOVllkbzJqd08zWVdyRjBCbXVVb1ZvUkNy?=
 =?utf-8?B?L2F4V2hTT1FGSVFvM3NicXd0NE1TdEM2NlBEcjZzSUJBSXlXZkJrby9wNWsw?=
 =?utf-8?B?VGRONXJyamJXM0lUbkZZeVhBZHJjdEVpNTh5ZGNUL1lmdjYydFhFbkpXUWYx?=
 =?utf-8?B?dnRuSnV4N2dTYXJ2Nmc0dFJKaVRQNjZaZDRyYUVQU2xTdDZCbkdIQjBKZk11?=
 =?utf-8?B?aGV3R0J3TEM4SC9kamUzOTc3cUZWMHQwbVNROTNSbU5RMlViblB6RStOTG5B?=
 =?utf-8?B?S3FULzRJblF6UXZQUjdVZkxMaHphSkE3VFFoS0szZkdmZWVzUHZxUkxWZDlI?=
 =?utf-8?B?Z0c1VW5aQUZ5eFJiemUySEgrWE53bEd1RHA0YlVUSWJNSUliOWdQdWlXYnNY?=
 =?utf-8?B?UlZvVjhtL05CZytjUWhKRlY5Q0VYbStYTGV1L25BcVlxeEZkNzNMUXNBQmFH?=
 =?utf-8?B?ekxtVDQ1K2RGN01zOEt3dW5uTzZXT1lLT1ZlaUxBM3VvakFXc0N5V2RqUTFi?=
 =?utf-8?B?TTdLKzJKTklEVWdBZkUwb0FzdE9IK1hCNXRSM0dCVmsrV0lWTDl0ZFM3NlBa?=
 =?utf-8?B?RDJPZTBQS2RCY2pUVHhwS3lnVGZ6dGlBTzBmV2JyRGV0b244Q0dsdkh4a1lv?=
 =?utf-8?B?bjFCTjl5ZXhYamZzVi9jcytRb0tLUVA5OUgrSEVtaC9LZ1BpV0NZSFF3dEI3?=
 =?utf-8?B?aWZzdVRySDFXbUEwcG4zVlduUmRKazU1WEVGekxTMEdrODNIanUwWXhMalBD?=
 =?utf-8?B?WmZNNzJqQ1diRGxRdU45Z3k5ajJ4dXJDaG9OMnQvMDR6TEVjM3N4ZjZXSS9G?=
 =?utf-8?B?ZHM0cE1neGhveEtTSi9DWWRmQ1dZWGtSNXZmQ2k1YlVsU3lTN3ByM0FVWk1L?=
 =?utf-8?B?ZHV1OW12Ly8veHgyc092aUxxZTlNcHA4L3JBRWlOQWI5Wm9KWWxGSG1DQzBh?=
 =?utf-8?B?M0QyK3RMdWh4ajhqMjJrQ0hEdlVxaUhMZExnSTJKM0g3RittQmdPRXBVajlX?=
 =?utf-8?B?bXUrZFlzV2NEejMwYmdNOEJVL3RnZjY2ZjlMTW9UM25ObUxpV1VGMFVtT0R5?=
 =?utf-8?B?akhJT1dscExocTU3Z0J3ZGQyVEpXd2hQQWxWNUNBdVh1dHdKM3dLc1Y5SGlS?=
 =?utf-8?B?cDNPYklsaVJmUzdFUDhBR0pUSlloYTAxUUZ3VW5lRUMxWTRqeWI2T3dqTlF2?=
 =?utf-8?B?a3hXTEJXVXdNdGpLbFRXTWwrZG5SWEhwMExKWmtzbEhHSkppU2xDdTEycWQy?=
 =?utf-8?B?NHNGekdPVE1RbWV1ckhLQTA5VUpwaS9XOEEwQzBldldJeFhYMlpWWVdHZnpE?=
 =?utf-8?B?REhmSDB3MXFzSG8rRzlvdk5wUkozY0xvUnNkZjd5blJ0WURCdjRpcXlsNW9a?=
 =?utf-8?B?VU5ISFFHeUR6bmd2aXRyZWdrUmFuZ1hjVEo0MWR4bXFKWFhQeVpPdkJlMktW?=
 =?utf-8?B?SHFKUGliSGoyNGwyVTlOdzE0a3V1NjQzUS8vSmU1TWx3ZC9QSDYvcUV0WDJB?=
 =?utf-8?B?MEx1bThKYUVJNjg0akFBZGx2N0ZRd1pxWlJ6Nm5lY2tuQzNUU2tuWmI3ZkRG?=
 =?utf-8?B?eThJeHJWUXZVQTlFUDhwMjRBbjVveG5jekhyMzFNNlBxRkpSc1Vxa2M5QkQ5?=
 =?utf-8?B?TDZBcG8zVXNwMUc3TU1nT0huNVVGNUNvUUxORk40VlZRSkNIU3BEOEwrdytw?=
 =?utf-8?B?NHM1eFprQVI4ZGMyVC81WWEzZ0phdTFjTjZycTFpV2dIQTFwRk5nOTFIakND?=
 =?utf-8?B?UzhLYVZCN0lXcmJCdkN2WWlhNURJY0d2d0lCbkoxRE1uNjcxTHVSWlQ2QkZ0?=
 =?utf-8?B?bENWeGg0aU5vcndLejNiU1NhM2NpQlMzV3lzeDN2TFBNUlI5aE5UVEk3K05j?=
 =?utf-8?B?T0Y2MkcraHF4amJ3N0puTnJHaUVtRmtuR1M1SlRMUFNRTEpRNXdva3VHcmJG?=
 =?utf-8?B?N2Y2Y0lJOU9HNVd0bnFXU2J5NHpobEphWlpOVFM2VG1OdjBvTE8vM0k4MSsw?=
 =?utf-8?Q?2JMu3zNpU16MJixqoh?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b162715-8dab-4b79-94ab-08de7547b75b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 15:00:02.6199 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ujwAhCbT/Fj92rix5dOwPGPjabe/a/iLgW3W1IQEOJQOfzaCLlJ3Wg0eUYMG3fru
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7322
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ruxandra.radulescu@nxp.com,m:ogabbay@kernel.org,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Frank.Li@nxp.com,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:devicetree@vger.kernel.org,m:imx@lists.linux.dev,m:linux-arm-kernel@lists.infradead.org,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:jiwei.fu@nxp.com,m:xuelin.shi@nxp.com,m:alexandru.taran@nxp.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[nxp.com,kernel.org,linux.intel.com,suse.de,gmail.com,ffwll.ch,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[23];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.958];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[amd.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	REDIRECTOR_URL(0.00)[aka.ms];
	DBL_BLOCKED_OPENRESOLVER(0.00)[aka.ms:url,nxp.com:email]
X-Rspamd-Queue-Id: 1BF371A825D
X-Rspamd-Action: no action

On 2/26/26 14:40, Ioana Ciocoi-Radulescu wrote:
> [Sie erhalten nicht häufig E-Mails von ruxandra.radulescu@nxp.com. Weitere Informationen, warum dies wichtig ist, finden Sie unter https://aka.ms/LearnAboutSenderIdentification ]
> 
> Neutron can execute a single job at a time. For now, only inference
> jobs are supported. Each job has exactly one BO associated with it.
> 
> When submitting a job, user also provides a syncobj handle on which it
> will wait for job completion.
> 
> We use the DRM GPU scheduler for job management. Large part of the job
> submission code is based on the example of the ethosu driver.
> 
> Signed-off-by: Jiwei Fu <jiwei.fu@nxp.com>
> Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
> ---
>  drivers/accel/neutron/Makefile         |   1 +
>  drivers/accel/neutron/neutron_device.c |   8 +-
>  drivers/accel/neutron/neutron_device.h |  21 ++
>  drivers/accel/neutron/neutron_driver.c |  28 ++-
>  drivers/accel/neutron/neutron_driver.h |   3 +
>  drivers/accel/neutron/neutron_job.c    | 367 +++++++++++++++++++++++++++++++++
>  drivers/accel/neutron/neutron_job.h    |  45 ++++
>  include/uapi/drm/neutron_accel.h       |  51 +++++
>  8 files changed, 519 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/accel/neutron/Makefile b/drivers/accel/neutron/Makefile
> index 192ed896a9f9..ac6dd576521c 100644
> --- a/drivers/accel/neutron/Makefile
> +++ b/drivers/accel/neutron/Makefile
> @@ -6,4 +6,5 @@ neutron-y := \
>         neutron_driver.o \
>         neutron_device.o \
>         neutron_gem.o \
> +       neutron_job.o \
>         neutron_mailbox.o
> diff --git a/drivers/accel/neutron/neutron_device.c b/drivers/accel/neutron/neutron_device.c
> index e5c09105be99..571ec906ad72 100644
> --- a/drivers/accel/neutron/neutron_device.c
> +++ b/drivers/accel/neutron/neutron_device.c
> @@ -7,6 +7,7 @@
>  #include <linux/iopoll.h>
> 
>  #include "neutron_device.h"
> +#include "neutron_job.h"
>  #include "neutron_mailbox.h"
> 
>  void neutron_enable_irq(struct neutron_device *ndev)
> @@ -32,9 +33,14 @@ void neutron_handle_irq(struct neutron_device *ndev)
>         /* Write 1 to clear */
>         writel_relaxed(appstatus & APPSTATUS_CLEAR_MASK, NEUTRON_REG(ndev, APPSTATUS));
> 
> -       if (appstatus & APPSTATUS_FAULTCAUSE_MASK)
> +       if (appstatus & APPSTATUS_FAULTCAUSE_MASK) {
>                 dev_err(ndev->dev, "Neutron halted due to fault: 0x%lx\n",
>                         FIELD_GET(APPSTATUS_FAULTCAUSE_MASK, appstatus));
> +               return neutron_job_err_handler(ndev);
> +       }
> +
> +       if (appstatus & APPSTATUS_INFDONE)
> +               neutron_job_done_handler(ndev);
>  }
> 
>  #define neutron_boot_done(appctrl) \
> diff --git a/drivers/accel/neutron/neutron_device.h b/drivers/accel/neutron/neutron_device.h
> index 8e4df7462d82..0ed72965774d 100644
> --- a/drivers/accel/neutron/neutron_device.h
> +++ b/drivers/accel/neutron/neutron_device.h
> @@ -9,8 +9,10 @@
>  #include <linux/spinlock.h>
>  #include <linux/bits.h>
>  #include <drm/drm_device.h>
> +#include <drm/gpu_scheduler.h>
> 
>  struct clk_bulk_data;
> +struct neutron_job;
> 
>  #define NEUTRON_FIRMWARE_NAME          "NeutronFirmware.elf"
> 
> @@ -92,6 +94,13 @@ enum neutron_mem_id {
>   * @clks: Neutron clocks
>   * @num_clks: Number of clocks
>   * @flags: Software flags used by driver
> + * @fence_lock: DMA fence lock
> + * @sched: GPU scheduler
> + * @sched_lock: Scheduler lock, for neutron_push_job
> + * @fence_context: Fence context
> + * @job_seqno: Job sequence number
> + * @job_lock: Job lock, for active_job handling
> + * @active_job: Currently active job
>   */
>  struct neutron_device {
>         struct drm_device base;
> @@ -103,6 +112,18 @@ struct neutron_device {
>         struct clk_bulk_data *clks;
>         int num_clks;
>         u32 flags;
> +
> +       /* For dma_fence */
> +       spinlock_t fence_lock;

I've just pushed a patch set to drm-misc-next which makes the fence_lock superflous in most cases. Just provide NULL as lock when calling to dma_fence_init().

> +       struct drm_gpu_scheduler sched;
> +       /* For neutron_push_job */
> +       struct mutex sched_lock;
> +       u64 fence_context;
> +       u64 job_seqno;
> +
> +       /* For active_job handling */
> +       struct mutex job_lock;
> +       struct neutron_job *active_job;
>  };
> 
>  #define to_neutron_device(drm) \
> diff --git a/drivers/accel/neutron/neutron_driver.c b/drivers/accel/neutron/neutron_driver.c
> index c9a18bf52037..ceae1f7e8359 100644
> --- a/drivers/accel/neutron/neutron_driver.c
> +++ b/drivers/accel/neutron/neutron_driver.c
> @@ -19,40 +19,53 @@
>  #include "neutron_device.h"
>  #include "neutron_driver.h"
>  #include "neutron_gem.h"
> +#include "neutron_job.h"
> 
>  #define NEUTRON_SUSPEND_DELAY_MS 1000
> 
>  static const struct drm_ioctl_desc neutron_drm_ioctls[] = {
>         DRM_IOCTL_DEF_DRV(NEUTRON_CREATE_BO, neutron_ioctl_create_bo, 0),
>         DRM_IOCTL_DEF_DRV(NEUTRON_SYNC_BO, neutron_ioctl_sync_bo, 0),
> +       DRM_IOCTL_DEF_DRV(NEUTRON_SUBMIT_JOB, neutron_ioctl_submit_job, 0),
>  };
> 
>  static int neutron_open(struct drm_device *drm, struct drm_file *file)
>  {
>         struct neutron_device *ndev = to_neutron_device(drm);
>         struct neutron_file_priv *npriv;
> +       int ret;
> 
>         npriv = kzalloc_obj(*npriv);
>         if (!npriv)
>                 return -ENOMEM;
> 
>         npriv->ndev = ndev;
> -       file->driver_priv = npriv;
> 
> +       ret = neutron_job_open(npriv);
> +       if (ret)
> +               goto err_free;
> +
> +       file->driver_priv = npriv;
>         return 0;
> +
> +err_free:
> +       kfree(npriv);
> +       return ret;
>  }
> 
>  static void neutron_postclose(struct drm_device *drm, struct drm_file *file)
>  {
>         struct neutron_file_priv *npriv = file->driver_priv;
> 
> +       neutron_job_close(npriv);
>         kfree(npriv);
>  }
> 
>  DEFINE_DRM_ACCEL_FOPS(neutron_drm_driver_fops);
> 
>  static const struct drm_driver neutron_drm_driver = {
> -       .driver_features        = DRIVER_COMPUTE_ACCEL | DRIVER_GEM,
> +       .driver_features        = DRIVER_COMPUTE_ACCEL | DRIVER_GEM |
> +                                 DRIVER_SYNCOBJ,
>         .name                   = "neutron",
>         .desc                   = "NXP Neutron driver",
>         .major                  = 1,
> @@ -151,19 +164,25 @@ static int neutron_probe(struct platform_device *pdev)
>                 return ret;
>         }
> 
> -       ret = devm_pm_runtime_enable(dev);
> +       ret = neutron_job_init(ndev);
>         if (ret)
>                 goto free_reserved;
> 
> +       ret = devm_pm_runtime_enable(dev);
> +       if (ret)
> +               goto free_job;
> +
>         pm_runtime_set_autosuspend_delay(dev, NEUTRON_SUSPEND_DELAY_MS);
>         pm_runtime_use_autosuspend(dev);
> 
>         ret = drm_dev_register(&ndev->base, 0);
>         if (ret)
> -               goto free_reserved;
> +               goto free_job;
> 
>         return 0;
> 
> +free_job:
> +       neutron_job_fini(ndev);
>  free_reserved:
>         of_reserved_mem_device_release(&pdev->dev);
> 
> @@ -175,6 +194,7 @@ static void neutron_remove(struct platform_device *pdev)
>         struct neutron_device *ndev = platform_get_drvdata(pdev);
> 
>         drm_dev_unregister(&ndev->base);
> +       neutron_job_fini(ndev);
>         of_reserved_mem_device_release(&pdev->dev);
>  }
> 
> diff --git a/drivers/accel/neutron/neutron_driver.h b/drivers/accel/neutron/neutron_driver.h
> index cd52b5eb2d27..b709de74105a 100644
> --- a/drivers/accel/neutron/neutron_driver.h
> +++ b/drivers/accel/neutron/neutron_driver.h
> @@ -4,10 +4,13 @@
>  #ifndef __NEUTRON_DRIVER_H__
>  #define __NEUTRON_DRIVER_H__
> 
> +#include <drm/gpu_scheduler.h>
> +
>  struct neutron_device;
> 
>  struct neutron_file_priv {
>         struct neutron_device *ndev;
> +       struct drm_sched_entity sched_entity;
>  };
> 
>  #endif /* __NEUTRON_DRIVER_H__ */
> diff --git a/drivers/accel/neutron/neutron_job.c b/drivers/accel/neutron/neutron_job.c
> new file mode 100644
> index 000000000000..316e361166a2
> --- /dev/null
> +++ b/drivers/accel/neutron/neutron_job.c
> @@ -0,0 +1,367 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/* Copyright 2025-2026 NXP */
> +
> +#include <linux/delay.h>
> +#include <linux/pm_runtime.h>
> +#include <drm/drm_file.h>
> +#include <drm/drm_print.h>
> +#include <drm/drm_gem_dma_helper.h>
> +#include <drm/neutron_accel.h>
> +
> +#include "neutron_driver.h"
> +#include "neutron_device.h"
> +#include "neutron_gem.h"
> +#include "neutron_mailbox.h"
> +#include "neutron_job.h"
> +
> +#define NEUTRON_JOB_TIMEOUT_MS 5000
> +
> +static const char *neutron_fence_get_driver_name(struct dma_fence *fence)
> +{
> +       return "neutron";
> +}
> +
> +static const char *neutron_fence_get_timeline_name(struct dma_fence *fence)
> +{
> +       return "neutron-npu";
> +}
> +
> +static const struct dma_fence_ops neutron_fence_ops = {
> +       .get_driver_name = neutron_fence_get_driver_name,
> +       .get_timeline_name = neutron_fence_get_timeline_name,
> +};
> +
> +static void neutron_hw_submit(struct neutron_job *job)
> +{
> +       struct neutron_device *ndev = job->ndev;
> +       struct neutron_mbox_cmd cmd = {0};
> +       u32 base_l, base_h;
> +       u64 base_addr;
> +       int ret;
> +
> +       switch (job->type) {
> +       case DRM_NEUTRON_JOB_INFERENCE:
> +               cmd.id = NEUTRON_CMD_INFERENCE;
> +               cmd.args[0] = job->inference.tensor_offset;
> +               cmd.args[1] = job->inference.microcode_offset;
> +               cmd.args[2] = job->inference.tensor_count;
> +               break;
> +       default:
> +               dev_WARN(ndev->dev, "Unknown job type: %d\n", job->type);
> +               return;
> +       }
> +
> +       base_addr = to_drm_gem_dma_obj(job->bo)->dma_addr;
> +       base_l = lower_32_bits(base_addr);
> +       base_h = upper_32_bits(base_addr);
> +
> +       writel_relaxed(base_l, NEUTRON_REG(ndev, BASEDDRL));
> +       writel_relaxed(base_l, NEUTRON_REG(ndev, BASEINOUTL));
> +       writel_relaxed(base_l, NEUTRON_REG(ndev, BASESPILLL));
> +       writel_relaxed(base_h, NEUTRON_REG(ndev, BASEDDRH));
> +       writel_relaxed(base_h, NEUTRON_REG(ndev, BASEINOUTH));
> +       writel_relaxed(base_h, NEUTRON_REG(ndev, BASESPILLH));
> +
> +       ret = neutron_mbox_send_cmd(ndev, &cmd);
> +       if (ret) {
> +               /* Nothing we can do here, we'll reset the device on timeout */
> +               dev_err(ndev->dev, "Failed to submit job, device is busy\n");
> +       }
> +}
> +
> +void neutron_job_err_handler(struct neutron_device *ndev)
> +{
> +       guard(mutex)(&ndev->job_lock);
> +
> +       if (ndev->active_job)
> +               drm_sched_fault(&ndev->sched);
> +}
> +
> +void neutron_job_done_handler(struct neutron_device *ndev)
> +{
> +       struct neutron_mbox_state state;
> +
> +       neutron_mbox_read_state(ndev, &state);
> +       if (state.status != NEUTRON_FW_STATUS_DONE) {
> +               dev_err(ndev->dev, "Inconsistent firmware state: status 0x%x, err 0x%x\n",
> +                       state.status, state.err_code);
> +               return neutron_job_err_handler(ndev);
> +       }
> +
> +       if (state.err_code != 0)
> +               dev_warn(ndev->dev, "Job finished with error: 0x%x\n",
> +                        state.err_code);

Not mandatory but you might also want to forward that as error to your dma_fence, see dma_fence_set_error(). 

> +
> +       /* Reset Neutron internal state to prepare for next inference */
> +       neutron_mbox_reset_state(ndev);
> +
> +       scoped_guard(mutex, &ndev->job_lock) {
> +               if (ndev->active_job) {
> +                       dma_fence_signal(ndev->active_job->neutron_fence);
> +                       ndev->active_job = NULL;
> +               }
> +       }
> +}
> +
> +static void neutron_cleanup_job(struct kref *ref)
> +{
> +       struct neutron_job *job = container_of(ref, struct neutron_job, refcnt);
> +
> +       pm_runtime_put_autosuspend(job->ndev->base.dev);
> +
> +       dma_fence_put(job->neutron_fence);
> +       dma_fence_put(job->sched_fence);
> +       drm_gem_object_put(job->bo);
> +       drm_syncobj_put(job->syncobj);
> +
> +       kfree(job);
> +}
> +
> +static void neutron_put_job(struct neutron_job *job)
> +{
> +       kref_put(&job->refcnt, neutron_cleanup_job);
> +}
> +
> +static void neutron_free_job(struct drm_sched_job *sched_job)
> +{
> +       struct neutron_job *job = to_neutron_job(sched_job);
> +
> +       drm_sched_job_cleanup(sched_job);
> +       neutron_put_job(job);
> +}
> +
> +static struct dma_fence *neutron_run_job(struct drm_sched_job *sched_job)
> +{
> +       struct neutron_job *job = to_neutron_job(sched_job);
> +       struct dma_fence *fence = job->neutron_fence;
> +       struct neutron_device *ndev = job->ndev;
> +
> +       if (unlikely(job->base.s_fence->finished.error))
> +               return NULL;
> +
> +       dma_fence_init(fence, &neutron_fence_ops, &ndev->fence_lock,
> +                      ndev->fence_context, ++ndev->job_seqno);
> +       dma_fence_get(fence);
> +
> +       scoped_guard(mutex, &ndev->job_lock) {
> +               ndev->active_job = job;
> +               neutron_hw_submit(job);
> +       }
> +
> +       return fence;
> +}
> +
> +static enum drm_gpu_sched_stat neutron_timedout_job(struct drm_sched_job *sched_job)
> +{
> +       struct neutron_job *job = to_neutron_job(sched_job);
> +       struct neutron_device *ndev = job->ndev;
> +       struct neutron_mbox_state state;
> +
> +       /* We assume Neutron is stuck, retrieve current state and reset */
> +       neutron_mbox_read_state(ndev, &state);
> +       dev_err(ndev->dev, "Neutron timedout, status: 0x%x, err: 0x%x\n",
> +               state.status, state.err_code);
> +
> +       drm_sched_stop(&ndev->sched, sched_job);
> +
> +       scoped_guard(mutex, &ndev->job_lock)
> +               ndev->active_job = NULL;
> +
> +       pm_runtime_force_suspend(ndev->dev);
> +       pm_runtime_force_resume(ndev->dev);
> +
> +       drm_sched_start(&ndev->sched, 0);
> +
> +       return DRM_GPU_SCHED_STAT_RESET;
> +}
> +
> +static void neutron_cancel_job(struct drm_sched_job *sched_job)
> +{
> +       struct neutron_job *job = to_neutron_job(sched_job);
> +       struct neutron_device *ndev = job->ndev;
> +
> +       guard(mutex)(&ndev->job_lock);
> +
> +       if (!dma_fence_is_signaled(job->neutron_fence)) {
> +               dma_fence_set_error(job->neutron_fence, -ECANCELED);
> +               dma_fence_signal(job->neutron_fence);
> +       }
> +}
> +
> +static const struct drm_sched_backend_ops neutron_sched_ops = {
> +       .run_job = neutron_run_job,
> +       .free_job = neutron_free_job,
> +       .timedout_job = neutron_timedout_job,
> +       .cancel_job = neutron_cancel_job,
> +};
> +
> +int neutron_job_init(struct neutron_device *ndev)
> +{
> +       const struct drm_sched_init_args args = {
> +               .ops = &neutron_sched_ops,
> +               .num_rqs = DRM_SCHED_PRIORITY_COUNT,
> +               .credit_limit = 1,
> +               .timeout = msecs_to_jiffies(NEUTRON_JOB_TIMEOUT_MS),
> +               .name = dev_name(ndev->dev),
> +               .dev = ndev->dev,
> +       };
> +       int ret;
> +
> +       ret = devm_mutex_init(ndev->dev, &ndev->sched_lock);
> +       if (ret)
> +               return ret;
> +       ret = devm_mutex_init(ndev->dev, &ndev->job_lock);
> +       if (ret)
> +               return ret;
> +       spin_lock_init(&ndev->fence_lock);
> +
> +       ndev->fence_context = dma_fence_context_alloc(1);
> +
> +       ret = drm_sched_init(&ndev->sched, &args);
> +       if (ret)
> +               dev_err(ndev->dev, "Error creating DRM scheduler\n");
> +
> +       return ret;
> +}
> +
> +void neutron_job_fini(struct neutron_device *ndev)
> +{
> +       drm_sched_fini(&ndev->sched);
> +}
> +
> +int neutron_job_open(struct neutron_file_priv *npriv)
> +{
> +       struct neutron_device *ndev = npriv->ndev;
> +       struct drm_gpu_scheduler *sched = &ndev->sched;
> +       int ret;
> +
> +       ret = drm_sched_entity_init(&npriv->sched_entity,
> +                                   DRM_SCHED_PRIORITY_NORMAL,
> +                                   &sched, 1, NULL);
> +       if (ret)
> +               dev_err(ndev->dev, "Error creating scheduler entity\n");
> +
> +       return ret;
> +}
> +
> +void neutron_job_close(struct neutron_file_priv *npriv)
> +{
> +       drm_sched_entity_destroy(&npriv->sched_entity);
> +}
> +
> +static int neutron_push_job(struct neutron_job *job)
> +{
> +       struct neutron_device *ndev = job->ndev;
> +       struct ww_acquire_ctx acquire_ctx;
> +       int ret;
> +
> +       ret = drm_gem_lock_reservations(&job->bo, 1, &acquire_ctx);
> +       if (ret)
> +               return ret;
> +
> +       ret = dma_resv_reserve_fences(job->bo->resv, 1);
> +       if (ret)
> +               goto out_unlock_res;
> +
> +       ret = drm_sched_job_add_implicit_dependencies(&job->base, job->bo, true);
> +       if (ret)
> +               goto out_unlock_res;
> +
> +       ret = pm_runtime_resume_and_get(ndev->base.dev);
> +       if (ret)
> +               goto out_unlock_res;
> +
> +       scoped_guard(mutex, &ndev->sched_lock) {
> +               drm_sched_job_arm(&job->base);
> +
> +               job->sched_fence = dma_fence_get(&job->base.s_fence->finished);
> +               drm_syncobj_replace_fence(job->syncobj, job->sched_fence);
> +
> +               kref_get(&job->refcnt);
> +               drm_sched_entity_push_job(&job->base);
> +
> +               dma_resv_add_fence(job->bo->resv, job->sched_fence,
> +                                  DMA_RESV_USAGE_WRITE);
> +       }
> +
> +out_unlock_res:
> +       drm_gem_unlock_reservations(&job->bo, 1, &acquire_ctx);
> +
> +       return ret;
> +}
> +
> +int neutron_ioctl_submit_job(struct drm_device *drm, void *data, struct drm_file *filp)
> +{
> +       struct neutron_device *ndev = to_neutron_device(drm);
> +       struct neutron_file_priv *npriv = filp->driver_priv;
> +       struct drm_neutron_submit_job *args = data;
> +       struct neutron_job *job;
> +       int ret;
> +
> +       if (args->pad)
> +               return -EINVAL;
> +
> +       job = kzalloc_obj(*job);
> +       if (!job)
> +               return -ENOMEM;
> +
> +       job->ndev = ndev;
> +       kref_init(&job->refcnt);
> +
> +       job->neutron_fence = kzalloc_obj(*job->neutron_fence);
> +       if (!job->neutron_fence) {
> +               ret = -ENOMEM;
> +               goto out_free_job;
> +       }
> +
> +       switch (args->type) {
> +       case DRM_NEUTRON_JOB_INFERENCE:
> +               memcpy(&job->inference, &args->inference,
> +                      sizeof(args->inference));
> +               break;
> +       default:
> +               dev_dbg(ndev->dev, "Invalid job type %d\n", args->type);
> +               ret = -EINVAL;
> +               goto out_free_fence;
> +       }
> +
> +       job->bo = drm_gem_object_lookup(filp, args->bo_handle);
> +       if (!job->bo) {
> +               dev_dbg(ndev->dev, "Invalid BO handle\n");
> +               ret = -ENOENT;
> +               goto out_free_fence;
> +       }
> +
> +       job->syncobj = drm_syncobj_find(filp, args->syncobj_handle);
> +       if (!job->syncobj) {
> +               dev_dbg(ndev->dev, "Invalid syncobj handle\n");
> +               ret = -ENOENT;
> +               goto out_put_gem;
> +       }
> +
> +       ret = drm_sched_job_init(&job->base, &npriv->sched_entity, 1, NULL,
> +                                filp->client_id);
> +       if (ret)
> +               goto out_put_syncobj;
> +
> +       ret = neutron_push_job(job);
> +       if (ret)
> +               goto out_sched_cleanup;
> +
> +       neutron_put_job(job);
> +
> +       return 0;
> +
> +out_sched_cleanup:
> +       drm_sched_job_cleanup(&job->base);
> +out_put_syncobj:
> +       drm_syncobj_put(job->syncobj);
> +out_put_gem:
> +       drm_gem_object_put(job->bo);
> +out_free_fence:
> +       kfree(job->neutron_fence);
> +out_free_job:
> +       kfree(job);
> +
> +       return ret;
> +}
> diff --git a/drivers/accel/neutron/neutron_job.h b/drivers/accel/neutron/neutron_job.h
> new file mode 100644
> index 000000000000..bb7773aeb218
> --- /dev/null
> +++ b/drivers/accel/neutron/neutron_job.h
> @@ -0,0 +1,45 @@
> +/* SPDX-License-Identifier: GPL-2.0+ */
> +/* Copyright 2025-2026 NXP */
> +
> +#ifndef __NEUTRON_JOB_H__
> +#define __NEUTRON_JOB_H__
> +
> +#include <linux/kref.h>
> +#include <drm/drm_gem.h>
> +#include <drm/drm_syncobj.h>
> +#include <drm/gpu_scheduler.h>
> +#include <drm/neutron_accel.h>
> +
> +#include "neutron_driver.h"
> +
> +struct neutron_device;
> +struct neutron_file_priv;
> +
> +struct neutron_job {
> +       struct drm_sched_job base;
> +       struct neutron_device *ndev;
> +       struct dma_fence *neutron_fence;

> +       struct dma_fence *sched_fence;

That looks superflous to me. You should always have the scheduler fence through the base.

> +       struct drm_syncobj *syncobj;

Why do you want to keep the syncobj around?


Apart from those notes looks pretty good to me, but I'm a bit disapointed that there isn't any DMA-buf support to review :)

Regards,
Christian.

> +       struct drm_gem_object *bo;
> +       enum drm_neutron_job_type type;
> +       union {
> +               struct drm_neutron_inference_job inference;
> +       };
> +       struct kref refcnt;
> +};
> +
> +#define to_neutron_job(job) \
> +       container_of(job, struct neutron_job, base)
> +
> +int neutron_job_init(struct neutron_device *dev);
> +void neutron_job_fini(struct neutron_device *dev);
> +int neutron_job_open(struct neutron_file_priv *npriv);
> +void neutron_job_close(struct neutron_file_priv *npriv);
> +
> +void neutron_job_done_handler(struct neutron_device *dev);
> +void neutron_job_err_handler(struct neutron_device *dev);
> +
> +int neutron_ioctl_submit_job(struct drm_device *dev, void *data, struct drm_file *filp);
> +
> +#endif /* __NEUTRON_JOB_H__ */
> diff --git a/include/uapi/drm/neutron_accel.h b/include/uapi/drm/neutron_accel.h
> index 2f5639f2e0e8..a9e5682709d2 100644
> --- a/include/uapi/drm/neutron_accel.h
> +++ b/include/uapi/drm/neutron_accel.h
> @@ -15,10 +15,12 @@ extern "C" {
>   *
>   * @DRM_NEUTRON_CREATE_BO: Create a buffer object
>   * @DRM_NEUTRON_SYNC_BO: Sync (parts of) the buffer object memory
> + * @DRM_NEUTRON_SUBMIT_JOB: Submit a job to the device
>   */
>  enum drm_neutron_ioctl {
>         DRM_NEUTRON_CREATE_BO = 0,
>         DRM_NEUTRON_SYNC_BO,
> +       DRM_NEUTRON_SUBMIT_JOB,
>  };
> 
>  /**
> @@ -64,6 +66,51 @@ struct drm_neutron_sync_bo {
>         __u64 offset;
>  };
> 
> +/**
> + * enum drm_neutron_job_type - Type of job to submit to Neutron device
> + *
> + * @DRM_NEUTRON_JOB_INFERENCE: Inference job
> + */
> +enum drm_neutron_job_type {
> +       DRM_NEUTRON_JOB_INFERENCE = 0,
> +};
> +
> +/**
> + * struct drm_neutron_inference_job - Inference job descriptor
> + *
> + * @tensor_offset: Offset of tensor array inside job BO
> + * @microcode_offset: Microcode offset inside BO
> + * @tensor_count: Number of valid tensors
> + * @pad: MBZ
> + */
> +struct drm_neutron_inference_job {
> +       __u32 tensor_offset;
> +       __u32 microcode_offset;
> +       __u32 tensor_count;
> +       __u32 pad[5];
> +};
> +
> +/**
> + * struct drm_neutron_submit_job - Submit a job to Neutron device
> + *
> + * @type: Job type, one of enum drm_neutron_job_type
> + * @bo_handle: BO handle for this job
> + * @inference: Inference job descriptor (when type is DRM_NEUTRON_JOB_INFERENCE)
> + * @reserved: Reserved for future job types
> + * @syncobj_handle: Handle of syncobj on which user waits for job completion
> + * @pad: MBZ
> + */
> +struct drm_neutron_submit_job {
> +       __u32 type;
> +       __u32 bo_handle;
> +       union {
> +               struct drm_neutron_inference_job inference;
> +               __u32 reserved[8];
> +       };
> +       __u32 syncobj_handle;
> +       __u32 pad;
> +};
> +
>  #define DRM_IOCTL_NEUTRON_CREATE_BO \
>         DRM_IOWR(DRM_COMMAND_BASE + DRM_NEUTRON_CREATE_BO, \
>                  struct drm_neutron_create_bo)
> @@ -72,6 +119,10 @@ struct drm_neutron_sync_bo {
>         DRM_IOWR(DRM_COMMAND_BASE + DRM_NEUTRON_SYNC_BO, \
>                  struct drm_neutron_sync_bo)
> 
> +#define DRM_IOCTL_NEUTRON_SUBMIT_JOB \
> +       DRM_IOWR(DRM_COMMAND_BASE + DRM_NEUTRON_SUBMIT_JOB, \
> +                struct drm_neutron_submit_job)
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> 
> --
> 2.34.1
> 

