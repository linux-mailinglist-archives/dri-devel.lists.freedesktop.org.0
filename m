Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1CFC8529E
	for <lists+dri-devel@lfdr.de>; Tue, 25 Nov 2025 14:23:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4079E10E165;
	Tue, 25 Nov 2025 13:23:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="kHIABfLr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010040.outbound.protection.outlook.com [52.101.61.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDE3D10E165
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Nov 2025 13:23:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cWx6Yh/PwBSy0vV4tEbsAG0+mD0wMoa60Q/zCLFuQSfNAi1xiZlmLfem5r4UvLRilK5Qs9yHAPCxpq54WkQq6Z6yaEl0MXY3/BPbhevEUDD7KCxb8A/pN26umoCnS7kuCieSHI4KbgSqzRg0EykVWQxRQL6WUzNpNbgGgCsAGroDt2BI1IcD9B0p7Ns70/EA/AjWRxD+DSYesYWLjGIYvvPEiy7BfBOxj5pVyEXpITk5mGsU1aIA9p3tvIzeg2PcVyKINMx66nRWjr5DzWXaF5MlxoiEgspgJ9XoqCFw2mtaMsOgGDuYK41rPqlx9LPDsFPxK14A9BrWpAMqgH0aKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5oBMnOgWuGp2NFppMUTDzuribjSVAbxKCcR8Zcr6R1M=;
 b=c5HLTT9aM8xP4cZZBsc0gwPezHbROe0ub02bAErL1Kyhk1iNwe/q/eWWSAag6dsMEaqeZmRAIMihXfoHRdZ4JnsyPKYp2KGY0oNv58BzxLuHyrGRbvvdEr/nD8vYFKcadPuMm9arSW2vuNE4ePj2RkOzWHrKytZPB+0fYxqY7QY5MXQyUQvP1WdROHa/QftmRh5EtOwcDxc15Pn4Zus25BeC0+La0vH7joVnnxc8tFhsgbkdXPCYES8Cjt+FHdV13hmTSC3Ff1GsxJ7dMribWpvdwSTTjaISEoD+E5ehLrD0ixG5iZ9Aj/2WtjTmc1tpClVSgn9iYF1BFLjQ9diy5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5oBMnOgWuGp2NFppMUTDzuribjSVAbxKCcR8Zcr6R1M=;
 b=kHIABfLrsnwWuIe6QQvZyaGUG94YK8aGRNMwKNKGOG+S6gRM6Tt6BIJT7k6ycj3LA5SIy9HKMAehTQVWAcDJaJsM1aoSflznl3x1OSJhzw2RbCy05stojYd+DP2gbudKzHaW+LmZNWPIvxjzAtS3e0ArPk3ZpopjwNB8lhSTDuk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW4PR12MB7239.namprd12.prod.outlook.com (2603:10b6:303:228::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Tue, 25 Nov
 2025 13:23:13 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9366.009; Tue, 25 Nov 2025
 13:23:13 +0000
Message-ID: <10bd3353-c3cc-414b-8033-7f3b8edb5968@amd.com>
Date: Tue, 25 Nov 2025 14:23:06 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] drm: disallow setting 0 as new handle in
 DRM_IOCTL_GEM_CHANGE_HANDLE
To: "Sokolowski, Jan" <jan.sokolowski@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Cc: David Francis <David.Francis@amd.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Felix Kuehling <felix.kuehling@amd.com>,
 "De Marchi, Lucas" <lucas.demarchi@intel.com>
References: <20251125102847.904357-1-jan.sokolowski@intel.com>
 <20251125102847.904357-2-jan.sokolowski@intel.com>
 <28441359-4625-4d3e-8c1a-852a1868bde8@amd.com>
 <IA4PR11MB9251D04B84D7129BB1DA449099D1A@IA4PR11MB9251.namprd11.prod.outlook.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <IA4PR11MB9251D04B84D7129BB1DA449099D1A@IA4PR11MB9251.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9PR03CA0364.namprd03.prod.outlook.com
 (2603:10b6:408:f7::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW4PR12MB7239:EE_
X-MS-Office365-Filtering-Correlation-Id: b45eab36-ebd2-49ff-b63a-08de2c25c94a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YUk4d0JHbklkRHNqQ3hxNXBTWFI1eFkwaDVvSmFQak92SG9JSWxULzhqY1RF?=
 =?utf-8?B?UWdqRUdleXJDRWhUeklldGNHRlM0akFBb2puWUIrOTIwWHVjaG1CQkIvOFJF?=
 =?utf-8?B?VWlBM3ZGWi9RU0ZFOWNob0J6VHF0TjNHTm45VzNSYWlVWVNMQXZqZ2Q5aWxt?=
 =?utf-8?B?Q1JoSDZnbFZFczRNUFQzZG1tSVc4bURoaGRGcTh5MlFEMGRpNmhWUWhRU1NN?=
 =?utf-8?B?ZEwxR0RJNVBtV2F2d1ZHNFlsQzJrY0VMSGxCVzRnKzZrbndsTFNHWTBseWtX?=
 =?utf-8?B?ZDI0eWJodFJMbVF2UHpOQmloOHJpd0ZjYXRudnhKcUZiUTl3aWdUTThoU1lo?=
 =?utf-8?B?ZGFvNE0rR0J3ZWpvUGU4bFR4Y3ZWZk05TzZWTzZoMzg3S1pDNFMrN2NhM1hO?=
 =?utf-8?B?NXowK0dHSlNiNW83TWRlYXpCTzVReU9NYjJQc1lpOG91QU55eXNWeURGMVh2?=
 =?utf-8?B?M2NiN1UrcmRPOXhxU1doTlAxUVhka250WmVxU1p5dlBBc1dScHh4dmw0RVdT?=
 =?utf-8?B?SFd4eGZZUHhyMFJ6bmJvbU5BNk9ObjdER0JGZlJDOUlseEM4cUNldUZubTls?=
 =?utf-8?B?QUFEM0crc01FMHpBTFV6YmUrSmxCWlJ3S0VhbWh0b3hqaGtQSWJoZmJLMHYv?=
 =?utf-8?B?c2JLQ2k5KzlzbVd5aDFSdkN3N3FXVzhRRkJmQnVnb0pTMUFETGdIRGpaajdX?=
 =?utf-8?B?Yk9mR0trNzVGSVY0NE1mWkxHcVRrTm9EZUZUODQwdS83alk2ZVJNSlIyODdt?=
 =?utf-8?B?WHpHN0N4cWhRak15NnIwTEgxOVNYbTBFZjYxVVJQNC9UL1BPdVk5VGNXOFBE?=
 =?utf-8?B?QThFamRCdzhRVkpLdWtTVnhXWmFOQ2RvVURuYy9wakRoMUpLaGgzR2dnTG1R?=
 =?utf-8?B?UysxWWxTcXZ4YUJLQklFdGwyUzM0VStvc2kvQ3FYUmMzNlJUOHp1QXJtV2Ry?=
 =?utf-8?B?Z054dXdNaWlCTHRHWENLVFpZWVAxaFlhcnpzZVhZQ1EzSmJ2aDRTOEZaT2pW?=
 =?utf-8?B?ZXZCVEJ2NXdKeG80RU9lN0ljakxVb1E1R0N4Mmo0cmlVcjVweCtocURwYUgz?=
 =?utf-8?B?QjZOdXRlbFk2VTB6aSsrV09oc1RQRUdXY0xwR01yaWo2Wm14dXdTbTRrMHUx?=
 =?utf-8?B?MFJ6V3BvZ0hCL3RYclRzZ2RTQjhweGs2VmtsQzlFYkJtOFgxUXF0ZGdrSHpt?=
 =?utf-8?B?cHNkNFZFcHRjZWJGUndoNkxkKzZSd1FDVXl3SXhKME9LSGRwbEFoeHlMR3Rn?=
 =?utf-8?B?Q3VHRWNsd21JbEhyZ1RCcGoyK0w3UTJPVDI0SG1ZR2FyNHRYSDJ1TkZIWk1w?=
 =?utf-8?B?bjBxUWovTW9YZUlLR3BGaUVIUStGcEMrNGdoVDIvVDFKa0NweHRLUXBWSVFV?=
 =?utf-8?B?bkluTjEycW5uMHI0R3lmOWJyRmRBVTYvb1hMbDljbWJ3SE14bjFGQkdROFBa?=
 =?utf-8?B?dU4rUEo1WndvbGRQY2ltaXFBaUx2OVhSNERDRTRNcC8ya2Zqa0pSTGVnMlJv?=
 =?utf-8?B?aWZUck1JWjFmQ1Q0TTlabGRCWXlrZVFFNHFJT1ZCRlNxZEUyQnhFZDhMY2hI?=
 =?utf-8?B?R3lzcS9wNmQ4Z0F1RUh6RzBTbHZKaU9pTGRRalp4SDZpYk5uNGUvWEs0UUhG?=
 =?utf-8?B?VFFoSEVCNWEzVlc3M3JBdUVNa0NmekZ2NWFMS1VHL21oT1hPeTVEKy9xbnY2?=
 =?utf-8?B?dHFCbzl6MCtOWEU2bUx1UFZCeDJJbmtWOC8rVUVYSWV3ZVByOXdhQ3hRaWJE?=
 =?utf-8?B?N2hKRjV1ZzUyRTdBbTVwRUxWOEk3b0draDJWdTlCUmNrMW9XVEZ0TlFseEdp?=
 =?utf-8?B?Q3pVOGpQaU1Jd1grdXlNbHdXSmxwbmJod2QwVXZRdG9WSk1mWHJCd2pTeitH?=
 =?utf-8?B?RC9lcG9Ic1BhRkM5NEdhanlvT1FmdDNmMkNEenhkUDdYL0JmOUwzRmMxZW5W?=
 =?utf-8?Q?GJj+IiU46MZp9vycRqYFDN3QAGBiV7oA?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T05ydDdBY3Z2Vi9adTM2VE1kN2RNQVNGS1o0N25TL3ZteXNKL3NLaC91cDQw?=
 =?utf-8?B?QlZ2d1dldkNwT3kwNmNLNE9hT1puLzd0bEZHa0ViaGczRk1SRExYcnZtOVFT?=
 =?utf-8?B?NmdQa2ZwWnM1bUFqU3o2cXFnd01Zdzd0dCttaVlHRng2TFEwSkM4NGpwQk1W?=
 =?utf-8?B?WjBIOEJmNDdpbTNxR0JvZnE1eHFRU2V2ZFE2bjJMZFpMcW5oSXExbC8yQTdr?=
 =?utf-8?B?Z2xqaWtNSGdPYms4anhiWlVqaExlelMvMk1wbkZjNHJmVHNYb3BZL0xPTHhB?=
 =?utf-8?B?Y3pPY1RFVTIzZzFxMXRnSHAyblU1Qlp2WHNrM1dlUnlpNEVCenhjYzU5QUpr?=
 =?utf-8?B?cDg1Q0dHNzRoRDBHMzRwdTBhejE4RllwcmdyYVVzQ2RvMWlXQzJPNyt4WHM0?=
 =?utf-8?B?UC9QVExxK1A4Q1lTaDc1aEw0REVEUmh5MGl1MFp2azRmamNIdWw1dEJtTk1K?=
 =?utf-8?B?K3ZzNU1OOHcxNVJrUVBudEt4c3dWTmd4bFZEM1BBbVBneVZRWUtCRDl1UW02?=
 =?utf-8?B?RFR6KzZKVDVaUVBkTTRDWUFtalNja0xtbEVJczhUS2RlS0RsTHYxQ0JjYjhk?=
 =?utf-8?B?aFpHL2NOeHo4ZTlOQW81ZGp6dEZ5dDBSNFZWazlyeElQWm82NlFpKzQxWFlW?=
 =?utf-8?B?UE96eXltUnZzL2NEcVFKeUhMWFFkdSszU0ZmYnBsVDRmWlVWSHlhNTUxcE8w?=
 =?utf-8?B?Y1FYZWMrNTlRRmIwUXhZZGsyMldISEYwTk50L1RtM3VJOW5lYXdQRTYrbmU2?=
 =?utf-8?B?b0ozc0NvOE1LY3RLWTBFN2pmL0tQeXBwbXFmcUc1OFZ3OGcrY1JvZTdzTVZ6?=
 =?utf-8?B?bXZvWjRoOW5IeUhMN3ZpenJEdDdkaDE5dnlPRnFCd29ENTNLemFkZGh6NHlB?=
 =?utf-8?B?bkNaRkxHT01HTEp3amZKS09YN0VZS09FSWsvU0g4UGZ5Qk1Rei9wM05YRjRu?=
 =?utf-8?B?amxJN3NLQkR4VDI5WVMrMDd2eEFZSlJKMndCT2JCclhOY3pRYXRkUDIxNXdQ?=
 =?utf-8?B?c2o5aGJjaXJweUhDMjdZWlhjSStpTXE5MVJKK3J5d01GVkE4bjVmZStRWnp4?=
 =?utf-8?B?dXdWZXNNTzFhUGkxOWpDZVM1SnJzOExIR2tTeWZLL3lmRytSci96OUZFWFZm?=
 =?utf-8?B?RHliQllybXVFOHFDbFNsREtrbXJ6Y2tZSExEY2RRV2cxalJPZ0RwNm5vUTl6?=
 =?utf-8?B?RmJCTnBONEJwK2kxUzg3cFNpRmV1U0YySWhBK3lSbFg5a29SWS9VNlVjVkYr?=
 =?utf-8?B?TEE5SnZpdW1FTDh2WnBFMGFNUVJTakIwTHlpVXA0bVB2RXgwMytyanhldXl2?=
 =?utf-8?B?UGF5dnQ2V3lwd05wZFZGbFhsbUxUUFAwODFyNDRPQXpSNkZVbTVqb1R2QmtN?=
 =?utf-8?B?UWNzVjRheExCbVhtdE1KQ2I0cU9RSGswSk1WTUlPTXNxaEVwUmtwV2FSN3Nn?=
 =?utf-8?B?YnNoeW1PTTNUdFRudTRmNUpZbmFDOVowRjlPSGJlb0xQWEF5VXZQbUVzS255?=
 =?utf-8?B?TEo4dENBaTJJWUJNcGtHckFJU2NLVk5NSFBjRXJ1dzVPMDc5NDY3YmNBenZP?=
 =?utf-8?B?LzBwTzRPKzdSWUtRdWpsVUtEWHYvL2g5Z0ZLVnZGcnFaVEN1cVUrU21XLytE?=
 =?utf-8?B?M3FwZEVYaTlSeVBXbjVjOXVoMjNPOUt4Vk1UYjlBV2NhckJpZldtUEwyeXlN?=
 =?utf-8?B?TlVXaVMrRzBta3B4OUpYRGlTc2s4VU01N0FlSDhxNUVSMGRGdkZscVhoZE5F?=
 =?utf-8?B?TU5TZnk3NDJldG5xL0dpV1RzNzZ4aGRHNkJSSG12K2g3Q1ZCUzFBd2hCN3Fo?=
 =?utf-8?B?TEowQldZL2FNSHVENSszTGoyRm5SOXVZQWhPZ2JmRkdJSGR3OEJDd0Y4dy8z?=
 =?utf-8?B?OFYrek5DcXEvUUhRT2ErTS9wbXkwWlNrQXF4K3VPQzd2bDBTcXQ4aEdFd3Nw?=
 =?utf-8?B?Y1EvanVtZVF0Y1ZnRUsrWDBPTExtSDF2d3RwZ0ZYaklYbndYV0FmM1ZvVks0?=
 =?utf-8?B?Ky8ra3QxS3dLb3FuVWhJZ1U4TW51OU9McDR0VmY3eVBXN2FuKzUrcU8xOXd6?=
 =?utf-8?B?dUMzT2FkaHkwS002RGlvbjdaRUl0WVdlR0N3WG1vZnNGK0xmemlRcVp0YStQ?=
 =?utf-8?Q?rrmmo/lRVpVrFUKvZvPbk+KqN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b45eab36-ebd2-49ff-b63a-08de2c25c94a
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2025 13:23:13.6834 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UdVvGZoryl5ShbG05uI8726v9eeQlw92droc2opDVSH4udHmjaStk2E7OfxS9M/n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7239
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

On 11/25/25 14:02, Sokolowski, Jan wrote:
>> -----Original Message-----
>> From: Christian König <christian.koenig@amd.com>
>> Sent: Tuesday, November 25, 2025 1:54 PM
>> To: Sokolowski, Jan <jan.sokolowski@intel.com>; dri-
>> devel@lists.freedesktop.org
>> Cc: David Francis <David.Francis@amd.com>; Maarten Lankhorst
>> <maarten.lankhorst@linux.intel.com>; Maxime Ripard
>> <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>;
>> David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Felix
>> Kuehling <felix.kuehling@amd.com>; De Marchi, Lucas
>> <lucas.demarchi@intel.com>
>> Subject: Re: [PATCH 1/1] drm: disallow setting 0 as new handle in
>> DRM_IOCTL_GEM_CHANGE_HANDLE
>>
>> On 11/25/25 11:28, Jan Sokolowski wrote:
>>> drm_file's object_idr uses 1 as base value, which can cause id
>>> mismatch when trying to use DRM_IOCTL_GEM_CHANGE_HANDLE
>>> to change id from 1 to 0.
>>>
>>> Disallow 0 as new handle in that ioctl.
>>>
>>> Fixes: 53096728b891 ("drm: Add DRM prime interface to reassign GEM
>> handle")
>>> Signed-off-by: Jan Sokolowski <jan.sokolowski@intel.com>
>>> Cc: David Francis <David.Francis@amd.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: David Airlie <airlied@gmail.com>
>>> Cc: Simona Vetter <simona@ffwll.ch>
>>> Cc: "Christian König" <christian.koenig@amd.com>
>>> Cc: Felix Kuehling <felix.kuehling@amd.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> ---
>>>  drivers/gpu/drm/drm_gem.c | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
>>> index 68168d58a7c8..2a49a8e396fa 100644
>>> --- a/drivers/gpu/drm/drm_gem.c
>>> +++ b/drivers/gpu/drm/drm_gem.c
>>> @@ -975,6 +975,10 @@ int drm_gem_change_handle_ioctl(struct
>> drm_device *dev, void *data,
>>>  	if (args->handle == args->new_handle)
>>>  		return 0;
>>>
>>> +	/* As the idr base is 1, trying to set handle 0 will create id mismatch
>> */
>>> +	if (args->new_handle == 0)
>>> +		return 0;
>>
>> That would need to return -EINVAl or some other error code.
> 
> Ok, will change that in next version.
> 
>>
>> But I'm wondering why that is necessary at all? Doesn't idr_alloc() return an
>> error when you try to allocate handle 0?
> 
> It appears that idr_alloc doesn't return any errors in this scenario, otherwise we'd goto out_unlock straight away.

Mhm, that is a bit misleading. We intentionally initialized the idr so that it starts at 1. Maybe idr_alloc() should be fixed instead.

But that is clearly a much larger change, with the return code fixed feel free to add Reviewed-by: Christian König <christian.koenig@amd.com> to this patch here.

Adding a CC: stable tag sound appropriate as well.

Regards,
Christian.

> 
>>
>> Regards,
>> Christian.
>>
>>> +
>>>  	mutex_lock(&file_priv->prime.lock);
>>>
>>>  	spin_lock(&file_priv->table_lock);
> 

