Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FC4AFC334
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jul 2025 08:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E80EA10E595;
	Tue,  8 Jul 2025 06:50:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VxoUXE7D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2071.outbound.protection.outlook.com [40.107.223.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65ACF10E59D;
 Tue,  8 Jul 2025 06:50:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S6KwYaQeACf3grJ01JTr+6Imj0w76taVsRBr/nAqEnDFfzv6sYX6HR4vRQ/CrSV8F1chZ6cqF7ODe1DwfHN+rf2v60xL3ZPyXwnhRxUjLHFLcoZXTv2dco5sUmpQ0kn/S2p3LSXjbNYYR4uTQ+zUkW49kvyzrAwZZL1KSEuunFQjD/RuLpC6+b7tXE1t4RYWRZybsR5oYHIPGnnnZQXDJfYhzVFa0nAQcHYKvi4yKYUZLaDhsCfobYVaNrGG6srXirRmJ7tOC729U+PRTOE5SvdaQ7GkDvQdXAA4Ixx/XjGKOXgbs7v2bfilCZxGVIps0VhUqprlnFo5v25c/A33LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=giblcuSB1arYxs8axtjtk1wOeJHQs8qbUFZak9uzzVw=;
 b=Queo9ud4VOBTLHvkJXmxLlS2OHwBayn8gPtnY4rm6jIz2AByBMcRZCFIT5V+E387NrFSH4YoQ7UXD3S/Y0VX0pNYQa8EH40n3YyqzxP+StT66rRi9pHIQ3uV0Yq1JXwW2fAbfU9PQQHoJeDaqCU4lQyplU5u7ishdFHK55qYcKZl42Kryb5qJwVpkB8C7d4WqiIl0vHDdZYmlkxc0c4qU/nJGNGmLmuMF0FZ9Va5xwdxkJc6BlkCq7bjlsmbwI3hAJHHlLSIMjrLwrh21XbR2TB3MSp/8sOtx5ZgjoMhhQt0g8OQj8iYemQINaGaW2cKOXzn8iB4W4pQ1tHxQKWBHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=giblcuSB1arYxs8axtjtk1wOeJHQs8qbUFZak9uzzVw=;
 b=VxoUXE7DNW8TvRX0NJBbV/Y7l4WVhJEpEjOU1qOsRspjD7ReR0ob5klV1LSeWoLMNkJdKBusKO1mnbJE7l8HOpcdJsdAh5Cx9QZyJJxM7pKOik7H25jgCHELItooN0mAUKYv/0aPCqyoukSWLq3zK7R6JMCn7pVfWPZ32PqZKhiQJQPOvpLz4qjnEthJIkprXT9UQ4VU6/uInOfznJnww1OAE6IO870Hoandk/jx+ezM+zjZrDjC/6Ba4DmyaFHcYqJPR4yWg/rxTS84/qPUoqJ1jxIA1ep57dwnETQArMuOzhhwiwgo2yjC2/cO/o7beZ0xCpb9gLlL8Q/Bm0ntZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB8412.namprd12.prod.outlook.com (2603:10b6:930:6f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Tue, 8 Jul
 2025 06:50:15 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.021; Tue, 8 Jul 2025
 06:50:15 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 08 Jul 2025 15:49:47 +0900
Subject: [PATCH v4 7/8] Documentation: gpu: nova-core: Document fwsec
 operation and layout
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250708-nova-docs-v4-7-9d188772c4c7@nvidia.com>
References: <20250708-nova-docs-v4-0-9d188772c4c7@nvidia.com>
In-Reply-To: <20250708-nova-docs-v4-0-9d188772c4c7@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TY2PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:404:a6::36) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aef1715-ec75-4f1c-858e-08ddbdebb188
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnNLdzRxaDZwNkE1ZmQzL1BGTldyMitNZUdVL3pIOUo3cHUzeDBWOTZUeElq?=
 =?utf-8?B?K21uMUVGcmJESFlNdG5WeE0zd2dub1dlR3pXVkNBcGozK0s5aDN3N0xOTmJE?=
 =?utf-8?B?LzkvRlB5TUcxTGR2b0tYdDdRbU14TkVJQjZCM0xRbm5lUE9lczdKYjNLd0hj?=
 =?utf-8?B?eGRRZ3F4UkIzWWJSWUo2dXdFcStiL1VXZ0M1b3c0K2hTc01EYm1FNmV6cmow?=
 =?utf-8?B?TElXckQxUitBV2hlakJ5S3BqVWpQUEJIY0hNYTRxdTYwaUlib1QrcWFWYXhY?=
 =?utf-8?B?QjFJbFVLSTRBY3VmY1VvUFlaOXZGdUFJdmZ4UzdGc05Dam9SMnRjUkZTRE8x?=
 =?utf-8?B?eU1XTUdJK2FjeC9LSUc2cjFRM053UG8xbzh1bVptZWszUG1WcWtCc3prWndP?=
 =?utf-8?B?bnk0K3ZIYWIySGtCOUZvUyt1ZGo3YXBva0lvWjF6N0c3S2VuY3gwQStDWnhI?=
 =?utf-8?B?RkhyU1UzbGt1WlJ5SU1tbHp3NXRIcXF6cUo5YnRhSWhXdEpxR21zVEhxNjNC?=
 =?utf-8?B?Sy9mR0VKaVRrRU0rWEx0dlRLdDlJdlJ2anRxeFVuUHZPNUxlZVJGdkszeFpS?=
 =?utf-8?B?RzYyTEdKa3N4L3J0MWh4R2ZiRk5tTTI2VlNYUGg3ZFB2d3lqdGJadzZrWVc1?=
 =?utf-8?B?cncrdlk1THNXeWFmamF3QllIckJIUDBLYXpLd0g4N1pKemlqc3RWaHFXWDlh?=
 =?utf-8?B?aDVmbUxBdUduVGlkSkxKU3pTbDBSYVBQL2tiaUsyR2k2WUFhRnJyZ1lTS01B?=
 =?utf-8?B?QnZTazJHK0xERy9Ha2ZGbkhxL0NWUlFVaTZlbUsvaGJGUTZoeFlPMXZmVEZt?=
 =?utf-8?B?WXRoektycms1NHJlbElyT0dneC8wZVp5SkhHb0lPU3FsaDdhTThZbGU2QXNM?=
 =?utf-8?B?YWwyOFp1eUt0OWJHeGRkWUlRbkhkc2lYZ0NCOUVaa1NZSTRVdTg1RUJDaVI4?=
 =?utf-8?B?dDdMT05xdXRoc2FoRFZyT0k4VVhkbWFzM3R2UENQa29PYXk4NHpOQk9ielJn?=
 =?utf-8?B?aW41QWhxaEQ1djlydnVEcElZdGQyajBMeURPSGo2bVJiWGhWU0ppSUpqbks4?=
 =?utf-8?B?dXI5RHExNloxUTljYnYwS09HSCtWL1RxckU4V1dmN0x5Nk1VbHlmRFRVS3lE?=
 =?utf-8?B?TlRvaDlsQytwUFk2VFJFblhsSHIxVXpFLzAzUDQrKzhpQjBrdmNSSGhhcWI1?=
 =?utf-8?B?cldLTU44V0grNmFuVEE0ZXJOQS9mTDNjQjZPZENLR201RE1KUTFUazJrZVds?=
 =?utf-8?B?OWFYempLSGtRUDVWTHRTVmNHQUVtb3dEa0hZSjVtUkpRZUxyTTBnd3FiV3py?=
 =?utf-8?B?T2w2QmZJeTc0MHFtTEdoYWNXNnNXN0pITmRVZjVrclYzU3JLcEJILzZmeU5U?=
 =?utf-8?B?ZUs5cEltSGN3aCswVDhzU2tFWXdZTEwrazQ0aEd0L0plNG94UDZZOWhMTVkz?=
 =?utf-8?B?WElOdUlUV1ozWm1aRnFQQzB4a3lCVHBPZHFRSm1PdHg5aXA5ZVRHdys5aWov?=
 =?utf-8?B?bTNHRVJsaWxySWVtRDhSdVRPRUt1dGxMQTFTalcyWDJ1L1pRdGxjVVpmdVMv?=
 =?utf-8?B?a1ZaeURNUE4rZldrN2Y5WWIvOEx2UThvWjJaNFF2Znd2UC8ydnFma1Q1SDMr?=
 =?utf-8?B?VTVDZlFmc2syN0kxRVllcGtBWHkyNFV3Zy9FL3kwLy9Mc0VKemdpdTJId1Bi?=
 =?utf-8?B?Z3Y2L2FsZ2d1dlFBaWxXbERvejJlMEdVZUZ2MzZFRUVXWDVuWFpOS3JPVUtJ?=
 =?utf-8?B?R3BNTktVNTNKLzdqR280QUtObVp2R0Z1L2ZrWjI0aklRN2s3ZExOeWpNelgx?=
 =?utf-8?B?UjhqbHVJdmNXcEZSZ1pZRzZrUFhXMWlXcUNJOGFiOHdOZ3ZBNnpzTkRxVmty?=
 =?utf-8?B?NzdmdVRKT21wMS9zd0NqRVAxYldNUFlNbEp4YTNIMXlmMGc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkhDanFuQjBqQm1ST3RKVDA2MEQ4NzJRWFhPTFI1dnNBZE1FaS9Ray9kSy9U?=
 =?utf-8?B?RldNYmRrdDdndlRUdnpJSytnSTJ3dkRpNzdqdktBaTRLOExKSVViNWpNK2NN?=
 =?utf-8?B?bUdpcjVVN3p5b3JJSjVoSThLSXZqYVlKWFdjaDB1MkJWRjJ1QmdrenBQTE5B?=
 =?utf-8?B?cjFWR0kyZTlvK3N0YkJKVU9HeG5NdmdxdEpoaVFiWEpYTWt6ZkZJbkpuNW8w?=
 =?utf-8?B?eUMwZldET1BFQi9RQVdoN1VuTTZsY2FvYkRhRkNLQkQ1bTExU3pQbnJSaStN?=
 =?utf-8?B?WEsyUWpDQmFlbktFM2RaZzNjUjBsaUZ4b1VKUkN6U28xNW4zNGJ4RnZmek5B?=
 =?utf-8?B?YTMzWGU1RlV3WGtJMnpobEZ3MVhvTGxGNk02OXFhYkxqQklHNWdwN2E1R3Yz?=
 =?utf-8?B?L0t1Wk03NncrME4za0VyL01xVzVhMEZJSjVRT0t5cjgxczIrV3Y1QnZpdXo4?=
 =?utf-8?B?VGdEYjNzcjluSlE3UDhTdWRYdnBGZnVzekx2REZsZ3h1Ti9ORzErQ2pvaUVL?=
 =?utf-8?B?Sy9xNUJpMXpDaTQzVXFza3VCSWNwZEpDZkVtUXdEU3lHbURvMk83Tm5lL1lv?=
 =?utf-8?B?Wi91bE83VmJlUllVUW84QzV5VGRnRXk3T1hQME1KSGNtYVhhVWk2N09hVjJZ?=
 =?utf-8?B?UVlmNC9mUnpyK3NBOGF3OU5xVWZmOHdGcUhiZDZncFdrbUx2V1IwaXFHRmVH?=
 =?utf-8?B?MFdwbnZXclhqT0NMVGFqVnRnMENyck5ZZkZqajRrUDRBZ09ZeE9CU2VPdk4w?=
 =?utf-8?B?c2dUTjBhZVZ1SXQrdEl5ZlZTUy9IMHFZZEdYWkJXTTBtNDlDSUNCd21KMmI2?=
 =?utf-8?B?SURRNElQWUkvaWJweHZTY1UzYnRlbm9UYlMvb053OUVmSVhHRmVjczR4aWdL?=
 =?utf-8?B?V1doZFN3em1YdTVPYlhzRHNEaE1VNEE3ckFUenY3NkVwcGZmdlRUR2UzWU1W?=
 =?utf-8?B?eXVMa3NtRnpYMEZHVjh3UDh3WXQrd1YrVTc5ZkpmYy96bGhldXBUWFF1Ym9a?=
 =?utf-8?B?bE5RWWpBTGJPWU0rVFd5Rm9icTQ4YUpNTkJuVXBPQXlhR2MrVHp0M3dENFIw?=
 =?utf-8?B?R0h1anZvY2N5OFRLQXI2ZmhCSmxadXpUZG5tSk1VS1dWMlNIbjdZdTVZR0VM?=
 =?utf-8?B?WmlwVTVMcmNTWjhXdTRlaVFzTjNLWmkzQlU4WEYzU3I1T3FnbFJ2S1RjdHBt?=
 =?utf-8?B?Z011c0NzQnQvK0NIeXd0bG4wa0dPeFhsN1N4NG91Yy9YUWVJMFVoakVYTFlL?=
 =?utf-8?B?a0RpNmc1bExzbk1FcnFJMzh4WThTdlhZOUFIT1BCL0thd2M4ZHRUdjkvVXR1?=
 =?utf-8?B?cUJDR1NySnZwc1hTa1ZjNUc0NHEvWTJ3NzdQRmsxSVhWSFBhc2F3ZnFCZTB3?=
 =?utf-8?B?UjJGVmxIblpHaUxZcHVOSmNVVkpIci8vTGVDRStKeW90RnFHRldkYkttU0wr?=
 =?utf-8?B?QWxzQTZJazFBL0VjVFk4b0ZrWjd2MitCWGVwaU0wcEFyd0VpZUVrd0hjUUZQ?=
 =?utf-8?B?OWwvdUJTOERNVGJIWkxQVUdiQmtucC83NzlGTjBrN0lXV0ZaQmNwK2w4Z0pK?=
 =?utf-8?B?ZDY1NktBT0FaVm1Scnp2MUZjSk5rdkY0QzR3Sk56ek52cVVpaEZ1VDlIR2dt?=
 =?utf-8?B?VitOZmYwRVBiaXNIMW5xeG9tVjdFZW5pVFlmZEJiTWY1TFVtRU9iMFFoSXg2?=
 =?utf-8?B?S0VPN2NxTHRkUkh1MFRpQWZOSXFDd0lZTDRGSjVlY0p1aW5SNHRKU29JKzBp?=
 =?utf-8?B?YlU4REVOTUUxYmxLTnpqY0Y4YXdjUTE2alhMRlpLZUUzTm9uVWdaelNQZmhQ?=
 =?utf-8?B?SklVZnZsS3Q0T1B2NlNMTkpNVTNaclRIVnI1QWF4ZjhvbXdZZURRM2NkZVN5?=
 =?utf-8?B?OWpjOFhkNzlQbUZpaWdTSkpUQm1Tdng1eDZqQlhVNUViclZJYmtsYkpkMUll?=
 =?utf-8?B?Qm9rS2JlOUxFREtxeGR3cG1qYmlqaXZXckNtSDJyZ3BXK2dpdVh0T2VnUk1G?=
 =?utf-8?B?OGRDc1ppWWJhWmMxWSs4eS9ER1RiYzh2VXFqa2MxR3VVY08xVmwwU2t0b2VZ?=
 =?utf-8?B?OE5jemcxaVNCUnIxenhkaXBISlJoaUZlV0lpYkJla0x1eDVZTXVIQmF1SjUy?=
 =?utf-8?B?Qk1ZclNNUExFYUlyK3p3Tko5UDE2N0FjZmtjWDNrendGWlJHU28rNDZRL0pL?=
 =?utf-8?Q?a9Odgu/RZOFRt3z77J6D+/B2b2r9v4aU7wzlVZR71ER8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aef1715-ec75-4f1c-858e-08ddbdebb188
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2025 06:50:15.1152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tW9WaikKL6QZaEFhe7Gn3Elwt31/4w1UuXkjmrLTTZTRFXSMjchFO12VbH1Lcq7ncUH63zjzm3uGLKFh3syrtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8412
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

From: Joel Fernandes <joelagnelf@nvidia.com>

Add explanation of fwsec with diagrams. This helps clarify how the
nova-core falcon boot works.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/fwsec.rst | 181 ++++++++++++++++++++++++++++++++++
 Documentation/gpu/nova/index.rst      |   1 +
 2 files changed, 182 insertions(+)

diff --git a/Documentation/gpu/nova/core/fwsec.rst b/Documentation/gpu/nova/core/fwsec.rst
new file mode 100644
index 0000000000000000000000000000000000000000..c440edbe420c39d7f405316a13472f8a13fe1d8d
--- /dev/null
+++ b/Documentation/gpu/nova/core/fwsec.rst
@@ -0,0 +1,181 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+=========================
+FWSEC (Firmware Security)
+=========================
+This document briefly/conceptually describes the FWSEC (Firmware Security) image
+and its role in the GPU boot sequence. As such, this information is subject to
+change in the future and is only current as of the Ampere GPU family. However,
+hopefully the concepts described will be useful for understanding the kernel code
+that deals with it. All the information is derived from publicly available
+sources such as public drivers and documentation.
+
+The role of FWSEC is to provide a secure boot process. It runs in
+'Heavy-secure' mode, and performs firmware verification after a GPU reset
+before loading various ucode images onto other microcontrollers on the GPU,
+such as the PMU and GSP.
+
+FWSEC itself is an application stored in the VBIOS ROM in the FWSEC partition of
+ROM (see vbios.rst for more details). It contains different commands like FRTS
+(Firmware Runtime Services) and SB (Secure Booting other microcontrollers after
+reset and loading them with other non-FWSEC ucode). The kernel driver only needs
+to perform FRTS, since Secure Boot (SB) has already completed by the time the driver
+is loaded.
+
+The FRTS command carves out the WPR2 region (Write protected region) which contains
+data required for power management. Once setup, only HS mode ucode can access it
+(see falcon.rst for privilege levels).
+
+The FWSEC image is located in the VBIOS ROM in the partition of the ROM that contains
+various ucode images (also known as applications) -- one of them being FWSEC. For how
+it is extracted, see vbios.rst and the vbios.rs source code.
+
+The Falcon data for each ucode images (including the FWSEC image) is a combination
+of headers, data sections (DMEM) and instruction code sections (IMEM). All these
+ucode images are stored in the same ROM partition and the PMU table is used to look
+up the application to load it based on its application ID (see vbios.rs).
+
+For the nova-core driver, the FWSEC contains an 'application interface' called
+DMEMMAPPER. This interface is used to execute the 'FWSEC-FRTS' command, among others.
+For Ampere, FWSEC is running on the GSP in Heavy-secure mode and runs FRTS.
+
+FWSEC Memory Layout
+-------------------
+The memory layout of the FWSEC image is as follows::
+
+   +---------------------------------------------------------------+
+   |                         FWSEC ROM image (type 0xE0)           |
+   |                                                               |
+   |  +---------------------------------+                          |
+   |  |     PMU Falcon Ucode Table      |                          |
+   |  |     (PmuLookupTable)            |                          |
+   |  |  +-------------------------+    |                          |
+   |  |  | Table Header            |    |                          |
+   |  |  | - version: 0x01         |    |                          |
+   |  |  | - header_size: 6        |    |                          |
+   |  |  | - entry_size: 6         |    |                          |
+   |  |  | - entry_count: N        |    |                          |
+   |  |  | - desc_version:3(unused)|    |                          |
+   |  |  +-------------------------+    |                          |
+   |  |         ...                     |                          |
+   |  |  +-------------------------+    |                          |
+   |  |  | Entry for FWSEC (0x85)  |    |                          |
+   |  |  | (PmuLookupTableEntry)   |    |                          |
+   |  |  | - app_id: 0x85 (FWSEC)  |----|----+                     |
+   |  |  | - target_id: 0x01 (PMU) |    |    |                     |
+   |  |  | - data: offset ---------|----|----|---+ look up FWSEC   |
+   |  |  +-------------------------+    |    |   |                 |
+   |  +---------------------------------+    |   |                 |
+   |                                         |   |                 |
+   |                                         |   |                 |
+   |  +---------------------------------+    |   |                 |
+   |  |     FWSEC Ucode Component       |<---+   |                 |
+   |  |     (aka Falcon data)           |        |                 |
+   |  |  +-------------------------+    |        |                 |
+   |  |  | FalconUCodeDescV3       |<---|--------+                 |
+   |  |  | - hdr                   |    |                          |
+   |  |  | - stored_size           |    |                          |
+   |  |  | - pkc_data_offset       |    |                          |
+   |  |  | - interface_offset -----|----|----------------+         |
+   |  |  | - imem_phys_base        |    |                |         |
+   |  |  | - imem_load_size        |    |                |         |
+   |  |  | - imem_virt_base        |    |                |         |
+   |  |  | - dmem_phys_base        |    |                |         |
+   |  |  | - dmem_load_size        |    |                |         |
+   |  |  | - engine_id_mask        |    |                |         |
+   |  |  | - ucode_id              |    |                |         |
+   |  |  | - signature_count       |    |    look up sig |         |
+   |  |  | - signature_versions --------------+          |         |
+   |  |  +-------------------------+    |     |          |         |
+   |  |         (no gap)                |     |          |         |
+   |  |  +-------------------------+    |     |          |         |
+   |  |  | Signatures Section      |<---|-----+          |         |
+   |  |  | (384 bytes per sig)     |    |                |         |
+   |  |  | - RSA-3K Signature 1    |    |                |         |
+   |  |  | - RSA-3K Signature 2    |    |                |         |
+   |  |  |   ...                   |    |                |         |
+   |  |  +-------------------------+    |                |         |
+   |  |                                 |                |         |
+   |  |  +-------------------------+    |                |         |
+   |  |  | IMEM Section (Code)     |    |                |         |
+   |  |  |                         |    |                |         |
+   |  |  | Contains instruction    |    |                |         |
+   |  |  | code etc.               |    |                |         |
+   |  |  +-------------------------+    |                |         |
+   |  |                                 |                |         |
+   |  |  +-------------------------+    |                |         |
+   |  |  | DMEM Section (Data)     |    |                |         |
+   |  |  |                         |    |                |         |
+   |  |  | +---------------------+ |    |                |         |
+   |  |  | | Application         | |<---|----------------+         |
+   |  |  | | Interface Table     | |    |                          |
+   |  |  | | (FalconAppifHdrV1)  | |    |                          |
+   |  |  | | Header:             | |    |                          |
+   |  |  | | - version: 0x01     | |    |                          |
+   |  |  | | - header_size: 4    | |    |                          |
+   |  |  | | - entry_size: 8     | |    |                          |
+   |  |  | | - entry_count: N    | |    |                          |
+   |  |  | |                     | |    |                          |
+   |  |  | | Entries:            | |    |                          |
+   |  |  | | +-----------------+ | |    |                          |
+   |  |  | | | DEVINIT (ID 1)  | | |    |                          |
+   |  |  | | | - id: 0x01      | | |    |                          |
+   |  |  | | | - dmemOffset X -|-|-|----+                          |
+   |  |  | | +-----------------+ | |    |                          |
+   |  |  | | +-----------------+ | |    |                          |
+   |  |  | | | DMEMMAPPER(ID 4)| | |    |                          |
+   |  |  | | | - id: 0x04      | | |    | Used only for DevInit    |
+   |  |  | | |  (NVFW_FALCON_  | | |    | application (not FWSEC)  |
+   |  |  | | |   APPIF_ID_DMEMMAPPER)   |                          |
+   |  |  | | | - dmemOffset Y -|-|-|----|-----+                    |
+   |  |  | | +-----------------+ | |    |     |                    |
+   |  |  | +---------------------+ |    |     |                    |
+   |  |  |                         |    |     |                    |
+   |  |  | +---------------------+ |    |     |                    |
+   |  |  | | DEVINIT Engine      |<|----+     | Used by FWSEC      |
+   |  |  | | Interface           | |    |     |         app.       |
+   |  |  | +---------------------+ |    |     |                    |
+   |  |  |                         |    |     |                    |
+   |  |  | +---------------------+ |    |     |                    |
+   |  |  | | DMEM Mapper (ID 4)  |<|----+-----+                    |
+   |  |  | | (FalconAppifDmemmapperV3)  |                          |
+   |  |  | | - signature: "DMAP" | |    |                          |
+   |  |  | | - version: 0x0003   | |    |                          |
+   |  |  | | - Size: 64 bytes    | |    |                          |
+   |  |  | | - cmd_in_buffer_off | |----|------------+             |
+   |  |  | | - cmd_in_buffer_size| |    |            |             |
+   |  |  | | - cmd_out_buffer_off| |----|------------|-----+       |
+   |  |  | | - cmd_out_buffer_sz | |    |            |     |       |
+   |  |  | | - init_cmd          | |    |            |     |       |
+   |  |  | | - features          | |    |            |     |       |
+   |  |  | | - cmd_mask0/1       | |    |            |     |       |
+   |  |  | +---------------------+ |    |            |     |       |
+   |  |  |                         |    |            |     |       |
+   |  |  | +---------------------+ |    |            |     |       |
+   |  |  | | Command Input Buffer|<|----|------------+     |       |
+   |  |  | | - Command data      | |    |                  |       |
+   |  |  | | - Arguments         | |    |                  |       |
+   |  |  | +---------------------+ |    |                  |       |
+   |  |  |                         |    |                  |       |
+   |  |  | +---------------------+ |    |                  |       |
+   |  |  | | Command Output      |<|----|------------------+       |
+   |  |  | | Buffer              | |    |                          |
+   |  |  | | - Results           | |    |                          |
+   |  |  | | - Status            | |    |                          |
+   |  |  | +---------------------+ |    |                          |
+   |  |  +-------------------------+    |                          |
+   |  +---------------------------------+                          |
+   |                                                               |
+   +---------------------------------------------------------------+
+
+.. note::
+   This is using an GA-102 Ampere GPU as an example and could vary for future GPUs.
+
+.. note::
+   The FWSEC image also plays a role in memory scrubbing (ECC initialization) and VPR
+   (Video Protected Region) initialization as well. Before the nova-core driver is even
+   loaded, the FWSEC image is running on the GSP in heavy-secure mode. After the devinit
+   sequence completes, it does VRAM memory scrubbing (ECC initialization). On consumer
+   GPUs, it scrubs only part of memory and then initiates 'async scrubbing'. Before this
+   async scrubbing completes, the unscrubbed VRAM cannot be used for allocation (thus DRM
+   memory allocators need to wait for this scrubbing to complete).
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index e4e017d926767284b5cee844d8dba32be6bc064c..e3650f53ff53113f31f63f67cf26116b5c070693 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -30,3 +30,4 @@ vGPU manager VFIO driver and the nova-drm driver.
    core/todo
    core/vbios
    core/devinit
+   core/fwsec

-- 
2.50.0

