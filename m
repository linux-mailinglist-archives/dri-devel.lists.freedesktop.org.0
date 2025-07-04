Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1F4AF8965
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jul 2025 09:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD06E10E96C;
	Fri,  4 Jul 2025 07:26:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WnDIXYN1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2085.outbound.protection.outlook.com [40.107.94.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E4510E96E;
 Fri,  4 Jul 2025 07:26:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NxBpOiSYOtmRZs8a/wdb5SuTWXZfH+VTCP9UPgkuFREKpUYp/y8Q04nB2ACrt2olufo8I4NaHuR/I7a5qHYWPR7L8f9NjEPEMQOy6WWEe1O0woRR7RosfJvyfT8wDG/eq9JfuLWPQepzhUTQMUB9ylVz+WC0iRmWJrz9DeCU4/gQrxaIYrEMPbrphLx2Q6KmR4GOMdVIHWrihF3aeZKwGqpMBdXN5KQlwrMN4MbUotd8zxbyh8fgRLuZZ4MIEaaRcu/k0ZnLAaIXuCQBYPF4R+x4tb+iPrYsZs1iJ+JI54DoCYFq3MBHkl7tGtPjiGfi2gsLTd5k1haGMFGLQXbw1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a6TbjrW5SuuQ8VZLjxQyDURvIEVbceVTTebhUVeJ+SQ=;
 b=bxSHp+l/3EpZOP13EV9WBrhmyqeio9hu3hC7sG5e1YQNAQjZN/3/2HQH2NU+lAgAADL4RKDXLmH1Z/nDJaxRocfSUkrYvIi/jrXGrXl51ZZ0hhFhXdeuBXVghxH6H7EgVvj87TdRheQERbmqEgEH0tYoNBWcZ+rogpo5+xfHIH75OMVUju3xA00W7G4TNVLXN4rIODRDS+S+wTFc2go8Hn+RZM2fkpfVvTa3FprNM0xVdpWL0GmTJnfYIZIICk/mv41MSrf7XjXVjGaXKckJdRHelhwJRXxCW/bd2Kd+/7bQ8EgtZr91jB/tui9JWbALbrCl4UbFM+AvsNDt6/RCsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a6TbjrW5SuuQ8VZLjxQyDURvIEVbceVTTebhUVeJ+SQ=;
 b=WnDIXYN1qDSZMm7U5cocoKsagVab/CO38XdZxNibV40oJojS9Dila0vihrlkuzSbo1E8UnJzPOhmiJ11O2NFK0Un8/Ewl2Pr4S5BWppGZXgSNV5tD0sLmSM+qyYAFUqw5cshDT576+qokq+aAVQ4Tq4xlyuR+6yHx/4CUIO6B5A5eLBAbWRdhp0HYBllo+BW2do2Ltkxo8FjAx54yxXd+9MFM76z6AZk1HoYXM/0Hf+XTKcJJgnFe6eT5W6cuuh3TXALwKlw1azKd1zBMPutj+M56ksYcK3vyC/si/EQz5pGdOjlvXV6P8++ahjcIX2N2kaXIqZA2pUIGZS8/qZ4nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MN0PR12MB6341.namprd12.prod.outlook.com (2603:10b6:208:3c2::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.23; Fri, 4 Jul
 2025 07:26:24 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8901.018; Fri, 4 Jul 2025
 07:26:24 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 04 Jul 2025 16:25:19 +0900
Subject: [PATCH 18/18] gpu: nova-core: registers: add support for relative
 array registers
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-nova-regs-v1-18-f88d028781a4@nvidia.com>
References: <20250704-nova-regs-v1-0-f88d028781a4@nvidia.com>
In-Reply-To: <20250704-nova-regs-v1-0-f88d028781a4@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0257.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MN0PR12MB6341:EE_
X-MS-Office365-Filtering-Correlation-Id: 6839eebb-340e-41b3-cfcf-08ddbacc1515
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ODVnZ2txa2dSbExFRlRLYytMR2F0Q1FZTXJROWwwNVYrM3A3TUVOME4zS0Y4?=
 =?utf-8?B?OW93RjdKbUhGZ1dHV25LZ2N5c0REZlJnVENJQkxNWXBLdkVLTDR2czk5NURH?=
 =?utf-8?B?dDhPd0owQmtVblRnRFhCNHNTdnE3K1QwcXU4WDFGOWk2Rm5aNVV6ZTIvWDJB?=
 =?utf-8?B?bFZveThsLzNxS1l0TWNLRmZQUVlBb0tocS9pSDZRaHgveVlFcGdmMXNmbHAz?=
 =?utf-8?B?ZFZ0cEV4U1QvZk5YUUpLa1U4K09mMVJiSldhaEpuRTVSSmM3NnEya0lMaXhG?=
 =?utf-8?B?Q1pVckt4TjdIWUtGU0RCb2p5cTlxVTdSS0xUbHB1QmFSUU92d1I1OXpVazZo?=
 =?utf-8?B?eUZwby9PUXlkOE1aNUU5cmxwclZFcHVqcU5Db2JmQ2tlS1NLdWtWRmMwcVQ4?=
 =?utf-8?B?bjFjVWhJRGV0MVZRQ0t6ckFoVWpVT2F6VUJ1cTkxaEY0Y1crQWZtTmUxMjB6?=
 =?utf-8?B?V1lBWm9tS2JZeW5CWnZTczlSTEdMTEp3KytTYlJsTklmS3o0RzJDSjMzY0ZX?=
 =?utf-8?B?VkxKZVlKNnJoRitvVllYOURzU2VnQWRpWmNaQ0dpTDM3MXIwUWhrTS9va25x?=
 =?utf-8?B?cUdkRm1QWmRHZnF0YkIyT3h0ekFrQjV0RXJmUCt3V0dQMkxUNFhmdVlDUXg3?=
 =?utf-8?B?Z0tzUHhURTdZUmE4YUpRR0xUQzdvTWMwSzNRaDM2V1lUR284dHFNc09xaGpP?=
 =?utf-8?B?MDdFRXYwNjZCd283L3lHRmlrUEJSUUJ5SlY1bHJlckJ6dWhGNDB2aXRvUTJ1?=
 =?utf-8?B?ZytoZkV6bmJvRklYb3l5Wk9WWFBjd0hnRDBCVy8vM2JFUlRvVjkrS2xvdFVz?=
 =?utf-8?B?TVMrck9wQ0FNRUJkYlE0VWVzL3hVUUt1WE5tWDIxSWs5ZCs4L1g5dWMwVXMv?=
 =?utf-8?B?NDBuckRzTmZ0cnhhWEVyWTArMUU3aHZ2cHdMdjYzUEVjOUFYakFaNitvTUVX?=
 =?utf-8?B?VTJEUTJIeWgyYXNUcUpOQnBYU3lqeTlULytMT2RJbXliMEtjc3k4RUxoYWN0?=
 =?utf-8?B?eDZlNUZodm90WVh5MXNDV3FISzZSWkVJOU1nZzRPYjlkUWpDUVg3Yll6TDJD?=
 =?utf-8?B?N0lpRVRCS0lNRUE2NXE2Q3dobGpUdWVNM2t4eTVHajRjbVIvYjJoUDhPL1N6?=
 =?utf-8?B?aE8zeFlOTUdJQ3VuQWY5N1pHOVBHMTRBTHZjMzh3QnJmTHE0cjlPSUNSK3Er?=
 =?utf-8?B?dmFBT2pMNGUwekNyMGNUR3l6a2hRN1g1Nk12dG8rU29jRnBsUW85V2R4WGNr?=
 =?utf-8?B?YS9UZnYrdlRja0NWZEdwMnJyQ05KVXMyS0RRc0VHUWJ6eDNvVkpzaXlFOFJl?=
 =?utf-8?B?QmlSdFgrWTBDN1ZQYmRwakdFOTZGZVFMSkxPdjdCZkErTFl0Y1VkZTFVM05W?=
 =?utf-8?B?ckJGSTMrYzFxd2hzTWlndXcrK0VQSkZRTE5DVEgwNytaS2dhVXF1REpKUkl4?=
 =?utf-8?B?K2xUOGpodmY3L1p1dkRaV2c3Q1dqSU9jeXQzU2h5YXkvZk42K20yUEFtWEdl?=
 =?utf-8?B?cDZUUnN4Q0FRN3lxM1F5dHo0VHRRK3VBRHF3NFVyaVo0RHZwb2ZHMjdraHZH?=
 =?utf-8?B?OHpVYTZkS1NCRzhKd1NEaTFEckVsc2lUbUZscnBKQkFQOURGNW9zYVBZM0tL?=
 =?utf-8?B?WTYrN1pUcmg1R1Z2SmNYR3dGVXpTbExISWdsWlNoN0k1eWVlcWVMM1ZFbkpi?=
 =?utf-8?B?N3FzbWd5a1NVTjBRMDhwajlacHAwTUl0L2ZPU25UZHJtamJFR0p2MDZDdndl?=
 =?utf-8?B?UWxEdGowNmhDVVdKRlNLUnRrM0dnZ2ZsSkZOQllXUmVCSEcxelpPQktZODdr?=
 =?utf-8?B?bW5OdEJ6K2lTNnF2S3l5bDE3Q1JUVHQ3NHpaMXlCUlZnWnBSeHE2ZjV2UlRV?=
 =?utf-8?B?U0Y3T3ZzUkpzSGowOFo0bkFwVjNYTmRjcFZ0OGZ0eDVUQ3dmNXRaUU9jVWlK?=
 =?utf-8?Q?XiCxFg+KVXk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q0VmSHRiZXVqUEFxVWc5Mlk5dG4yUDlqMTJuazZvTTBiZlBHeFN6NEY3UFNX?=
 =?utf-8?B?Qnc5bVZ2bm5SRHgxVHNWQkdzWWY1bGkweSsvWjlaelRSWjNVQlRnR0xXMWlF?=
 =?utf-8?B?NHBLckdvdnlRcDY0OXJIRUZNSjkxQitleVVtS0FObDliRE9VVU9semZFVUd2?=
 =?utf-8?B?eGZCakVNWUFQUWFmMENnbzBEZVNnSHNmSU1uNWg5MEhydDF5a2dsOVNjOWJ1?=
 =?utf-8?B?d0F1VXFWUGJVVE8rZ09PZ2ZQSlBpNnlDUFE0RXhyKzFNOVE5Z0xMWmFFYVNl?=
 =?utf-8?B?Q3VVZlBCQnd1OUZNb29lamc2OXhrYzVHUTVtaWZOaHpnWEVQL3NCK01YdUVR?=
 =?utf-8?B?S3cyWktjUEUvTzV6QjlneWFxM1ZOc0l2TWEvU0R2RThEcENMMk1jSDRHUnRp?=
 =?utf-8?B?MXhuSEd1U2ZKQThSUFRWazNjS0Q0SUdrVW5vTXZuM2ZTdG9pT1J1eWkrMGR6?=
 =?utf-8?B?dmZUcWNRakNTUGtJMzNUZ3lKMUhlamxsTTBKQ3NlUWhoSldQb2JyTXBrQk5w?=
 =?utf-8?B?NmJLclVQRURwRnBlN045V0xMcWJaWXpLejF1M1NjZ2tTV0JrQjBUYzkwa0h4?=
 =?utf-8?B?VmpibFhlOHU5dStsaUN3cThobmVZVXI5QmtyaWlXcDBHVGR3eHRsOW80RnYy?=
 =?utf-8?B?c1pRaTA2bkM5elprejZ4WkYvazZseUFqTzY5Zm5qRis5RE1Fd29aWUJrSnpj?=
 =?utf-8?B?bFdZdTVrWUc1OTRiRmRNTTRFV0JnMHVzNGEyL0JIbHpGb1Nxems0NTk2SURV?=
 =?utf-8?B?S3gxZmY3OVlyQUR4TmUrMTVRb3dtYUhvQW5MRjY5NXU2M3V1eWRVZDZOYjJS?=
 =?utf-8?B?U253aU1neVA3dWt1NEhXL0ZKWGFRc1ZSNkk4aW1mYUdtalh6TE9nb3N6QXFm?=
 =?utf-8?B?S3lMdDZuNEJKT3praC9lSFZmbHdXaHg2b2g1bElEWklsN1YwcFlQNTZIMmNE?=
 =?utf-8?B?L09ZMGxVci9CalkxVlJIVmVjRENxKy9IenVZdGNKaUdPM2oyL0dZZ3l0Q0Zm?=
 =?utf-8?B?dDJzSVkwUzVtK21ERTkzcVNTTXRGVWRlY3BBRWRhbTFYMXllYmIxck9oMzFU?=
 =?utf-8?B?UVloQ2R1K1J3c3FNTUxIaTZnd0JDNmdDZzVIWU94eExuMzlaMlZsZVJZc0pN?=
 =?utf-8?B?Z1VCem5SZVhuYnlLY0tHK09HdGFKZWUzRDhhQUc4Wnh3RjhEV1RmV3ZkdnBm?=
 =?utf-8?B?aEVkRUwrbklhWUNaU25lRlJ3OFllWTVOc3kzWXZ1WXk3RzlXTmw5QVVhMlBI?=
 =?utf-8?B?UjlGOVhHYlViL09hY2tMemthMGxJRmd0b2RLVCtxTXhZbTV2c3ZYNW5JM29O?=
 =?utf-8?B?TmhUSEVoUStReDRyYlczOXpUTEcvVjBadHNGdVV3NVVZSk9HdllnZmNoVlJi?=
 =?utf-8?B?RGFtLzlidFhEbitWMGlJTXA2S1FDQUJCemRsbGNCTmVjZ3MvUEduOTRtcUFa?=
 =?utf-8?B?NFNtR0pkWUdCR042M3ZEYkpSNVg2UnV0bEhZRVl0S1VJTlBUbVhqcDE2VndP?=
 =?utf-8?B?STI5R0tyMThMNk50WGo1d2wzTTdnVTFQZUVpdVl4K3VEcm1BbFU3WTc0b0pw?=
 =?utf-8?B?aWNia29pZ2RzVHAwV0JNZWlIejJpdmh2L0xnQWJKdHM5NTRkb1ByTU5iakNw?=
 =?utf-8?B?cUFiaDQ4TzRtajFKUkx0VTlzZnhaWEpTdGFqbFViVmpoWTdmTG5ONndRQ1Zs?=
 =?utf-8?B?WU1rU041MTlKOFJGdDVaMnh4QUpleVkvb0gzYWFMQ3huSU9UdEVLRTNnRks1?=
 =?utf-8?B?TWRQY3lrK1REem1sZHFSb1JEaVdySmg5YWtQcUJ6OGI5allwMUdyU3A2SjFr?=
 =?utf-8?B?SVBrTTU4VExlcGdxTHRVSzJxQlpJd0FvVXRZN0Z3T1ArNFczSWhWL2xrTmZn?=
 =?utf-8?B?Q25BMGFjeExKMlRndjJHemF0Njk1ZVJjcFNOa3p3bFE3ZkhlLzNqSVBZQjhZ?=
 =?utf-8?B?TTlZeWs0YW91ZFIzMmN1THNSYmtwMVpjSVBMRUo4ckVDSVU0YitVQTNjRmph?=
 =?utf-8?B?dERyaWwzTTJwSStvTUYyRjZ0T2tpMjk5QTMybEJVT3Z4ajBpb2lkZlNFWG5I?=
 =?utf-8?B?Y21vWmhWV0RiQVIwM0lwaGVxUVdFVlRIWWhiajF3aE9jNDlFRmlmVW92MEcy?=
 =?utf-8?B?d2YyMGxIZW9IL3paaGpLS0R4YklQWGs5RTNCOFgzdThHN2s3WTJuaXFYeFF3?=
 =?utf-8?Q?clwiLZP+uhWIY8pTQ8/xZudxqJCLnxDaC02m+V9lu2Kh?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6839eebb-340e-41b3-cfcf-08ddbacc1515
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2025 07:26:24.7309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Kr2x0FDVZdDV1fQNUQ31WBsLhBtAtyjjjwEhVlFto5BeYzpj25bSBrYJyO+aRUqb0A6l+KHQFSl6jTmAOOWOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6341
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

Add support for declaring arrays of registers available from a variable
base. This is effectively a combination of the relative and array
registers features.

nova-core does not make much use of this yet, but it will become helpful
to have for GSP boot.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 Documentation/gpu/nova/core/todo.rst      |   1 -
 drivers/gpu/nova-core/falcon.rs           |   2 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs |   2 +-
 drivers/gpu/nova-core/regs.rs             |   8 +-
 drivers/gpu/nova-core/regs/macros.rs      | 241 ++++++++++++++++++++++++++++++
 5 files changed, 247 insertions(+), 7 deletions(-)

diff --git a/Documentation/gpu/nova/core/todo.rst b/Documentation/gpu/nova/core/todo.rst
index a1d12c1b289d89251d914fc271b7243ced11d487..48b20656dcb16056db7784fa186f161126aae9aa 100644
--- a/Documentation/gpu/nova/core/todo.rst
+++ b/Documentation/gpu/nova/core/todo.rst
@@ -131,7 +131,6 @@ crate so it can be used by other components as well.
 
 Features desired before this happens:
 
-* Arrays of registers with build-time index validation,
 * Make I/O optional I/O (for field values that are not registers),
 * Support other sizes than `u32`,
 * Allow visibility control for registers and individual fields,
diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 23a4ff591c8db8d4600ec43dfaa42233cbf65c0e..2929032a97a6ccecb2d090b82af966991b53797b 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -501,7 +501,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
     pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F) -> Result {
         regs::NV_PFALCON_FBIF_CTL::alter(bar, &E::ID, |v| v.set_allow_phys_no_ctx(true));
         regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
-        regs::NV_PFALCON_FBIF_TRANSCFG::alter(bar, &E::ID, |v| {
+        regs::NV_PFALCON_FBIF_TRANSCFG::alter(bar, &E::ID, 0, |v| {
             v.set_target(FalconFbifTarget::CoherentSysmem)
                 .set_mem_type(FalconFbifMemType::Physical)
         });
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 13c945fd6d6b7b1acbb466678af0bf18da506265..0b1cbe7853b3e85cb9c03f8e3987ec50a30253fb 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -73,7 +73,7 @@ fn signature_reg_fuse_version_ga102(
 fn program_brom_ga102<E: FalconEngine>(bar: &Bar0, params: &FalconBromParams) -> Result {
     regs::NV_PFALCON2_FALCON_BROM_PARAADDR::default()
         .set_value(params.pkc_data_offset)
-        .write(bar, &E::ID);
+        .write(bar, &E::ID, 0);
     regs::NV_PFALCON2_FALCON_BROM_ENGIDMASK::default()
         .set_value(u32::from(params.engine_id_mask))
         .write(bar, &E::ID);
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 5156ab1910501e86b4391a34549817d2e7818e07..0a5ccd845eae755c3dbfe25971b6d0cdf4189f8e 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -275,8 +275,7 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     0:0     reset as bool;
 });
 
-// TODO[REGA]: this is an array of registers.
-register!(NV_PFALCON_FBIF_TRANSCFG @ PFalconBase[0x00000600] {
+register!(NV_PFALCON_FBIF_TRANSCFG @ PFalconBase[0x00000600[8]] {
     1:0     target as u8 ?=> FalconFbifTarget;
     2:2     mem_type as bool => FalconFbifMemType;
 });
@@ -299,8 +298,9 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     31:0    value as u32;
 });
 
-// TODO[REGA]: this is an array of registers.
-register!(NV_PFALCON2_FALCON_BROM_PARAADDR @ PFalcon2Base[0x00000210] {
+// OpenRM defines this as a register array, but doesn't specify its size and only uses its first
+// element. Be conservative until we know the actual size or need to use more registers.
+register!(NV_PFALCON2_FALCON_BROM_PARAADDR @ PFalcon2Base[0x00000210[1]] {
     31:0    value as u32;
 });
 
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index af432f0535d2944fa4609f4a44c98a0b1394a2c0..0a342f1ac665fc99eecb08e61889427543f63bc8 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -179,6 +179,73 @@ pub(crate) trait RegisterBase<T> {
 /// # Ok(())
 /// # }
 /// ```
+///
+/// ## Relative arrays of registers
+///
+/// Combining the two features described in the sections above, arrays of registers accessible from
+/// a base can also be defined:
+///
+/// ```no_run
+/// # fn no_run() -> Result<(), Error> {
+/// # fn get_scratch_idx() -> usize {
+/// #   0x15
+/// # }
+/// // Type used as parameter of `RegisterBase` to specify the base.
+/// pub(crate) struct CpuCtlBase;
+///
+/// // ZST describing `CPU0`.
+/// struct Cpu0;
+/// impl RegisterBase<CpuCtlBase> for Cpu0 {
+///     const BASE: usize = 0xf00;
+/// }
+/// // Singleton of `CPU0` used to identify it.
+/// const CPU0: Cpu0 = Cpu0;
+///
+/// // ZST describing `CPU1`.
+/// struct Cpu1;
+/// impl RegisterBase<CpuCtlBase> for Cpu1 {
+///     const BASE: usize = 0x1f00;
+/// }
+/// // Singleton of `CPU1` used to identify it.
+/// const CPU1: Cpu1 = Cpu1;
+///
+/// // 64 per-cpu scratch registers, arranged as an contiguous array.
+/// register!(CPU_SCRATCH @ CpuCtlBase[0x1000[64]], "Per-CPU scratch registers" {
+///     31:0    value as u32;
+/// });
+///
+/// let cpu0_scratch_0 = CPU_SCRATCH::read(bar, &Cpu0, 0).value();
+/// let cpu1_scratch_15 = CPU_SCRATCH::read(bar, &Cpu1, 15).value();
+/// // This won't build.
+/// // let cpu0_scratch_128 = CPU_SCRATCH::read(bar, &Cpu0, 128).value();
+///
+/// // Runtime-obtained array index.
+/// let scratch_idx = get_scratch_idx();
+/// // Access on a runtime value returns an error if it is out-of-bounds.
+/// let cpu0_some_scratch = CPU_SCRATCH::try_read(bar, &Cpu0, scratch_idx)?.value();
+///
+/// // `SCRATCH[8]` is used to convey the firmware exit code.
+/// register!(CPU_FIRMWARE_STATUS => CpuCtlBase[CPU_SCRATCH[8]],
+///     "Per-CPU firmware exit status code" {
+///     7:0     status as u8;
+/// });
+///
+/// let cpu0_status = CPU_FIRMWARE_STATUS::read(bar, &Cpu0).status();
+///
+/// // Non-contiguous register arrays can be defined by adding a stride parameter.
+/// // Here, each of the 16 registers of the array are separated by 8 bytes, meaning that the
+/// // registers of the two declarations below are interleaved.
+/// register!(CPU_SCRATCH_INTERLEAVED_0 @ CpuCtlBase[0x00000d00[16 ; 8]],
+///           "Scratch registers bank 0" {
+///     31:0    value as u32;
+/// });
+/// register!(CPU_SCRATCH_INTERLEAVED_1 @ CpuCtlBase[0x00000d04[16 ; 8]],
+///           "Scratch registers bank 1" {
+///     31:0    value as u32;
+/// });
+/// # Ok(())
+/// # }
+/// ```
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
@@ -226,7 +293,41 @@ macro_rules! register {
         } );
     };
 
+    // Creates an array of registers at a relative offset from a base address provider.
+    (
+        $name:ident @ $base:ty [ $offset:literal [ $size:expr ; $stride:expr ] ]
+            $(, $comment:literal)? { $($fields:tt)* }
+    ) => {
+        static_assert!(::core::mem::size_of::<u32>() <= $stride);
+        register!(@core $name $(, $comment)? { $($fields)* } );
+        register!(@io_relative_array $name @ $base [ $offset [ $size ; $stride ] ]);
+    };
+
+    // Shortcut for contiguous array of relative registers (stride == size of element).
+    (
+        $name:ident @ $base:ty [ $offset:literal [ $size:expr ] ] $(, $comment:literal)? {
+            $($fields:tt)*
+        }
+    ) => {
+        register!($name @ $base [ $offset [ $size ; ::core::mem::size_of::<u32>() ] ]
+            $(, $comment)? { $($fields)* } );
+    };
+
+    // Creates an alias of register `idx` of relative array of registers `alias` with its own
+    // fields.
+    (
+        $name:ident => $base:ty [ $alias:ident [ $idx:expr ] ] $(, $comment:literal)? {
+            $($fields:tt)*
+        }
+    ) => {
+        static_assert!($idx < $alias::SIZE);
+        register!(@core $name $(, $comment)? { $($fields)* } );
+        register!(@io_relative $name @ $base [ $alias::OFFSET + $idx * $alias::STRIDE ] );
+    };
+
     // Creates an alias of register `idx` of array of registers `alias` with its own fields.
+    // This rule belongs to the (non-relative) register arrays set, but needs to be put last
+    // to avoid it being interpreted in place of the relative register array alias rule.
     ($name:ident => $alias:ident [ $idx:expr ] $(, $comment:literal)? { $($fields:tt)* }) => {
         static_assert!($idx < $alias::SIZE);
         register!(@core $name $(, $comment)? { $($fields)* } );
@@ -681,4 +782,144 @@ pub(crate) fn try_alter<const SIZE: usize, T, F>(
             }
         }
     };
+
+    // Generates the IO accessors for an array of relative registers.
+    (
+        @io_relative_array $name:ident @ $base:ty
+            [ $offset:literal [ $size:expr ; $stride:expr ] ]
+    ) => {
+        #[allow(dead_code)]
+        impl $name {
+            pub(crate) const OFFSET: usize = $offset;
+            pub(crate) const SIZE: usize = $size;
+            pub(crate) const STRIDE: usize = $stride;
+
+            /// Read the array register at index `idx` from `io`, using the base address provided
+            /// by `base` and adding the register's offset to it.
+            #[inline(always)]
+            pub(crate) fn read<const SIZE: usize, T, B>(
+                io: &T,
+                #[allow(unused_variables)]
+                base: &B,
+                idx: usize,
+            ) -> Self where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: crate::regs::macros::RegisterBase<$base>,
+            {
+                build_assert!(idx < Self::SIZE);
+
+                let offset = <B as crate::regs::macros::RegisterBase<$base>>::BASE +
+                    Self::OFFSET + (idx * Self::STRIDE);
+                let value = io.read32(offset);
+
+                Self(value)
+            }
+
+            /// Write the value contained in `self` to `io`, using the base address provided by
+            /// `base` and adding the offset of array register `idx` to it.
+            #[inline(always)]
+            pub(crate) fn write<const SIZE: usize, T, B>(
+                self,
+                io: &T,
+                #[allow(unused_variables)]
+                base: &B,
+                idx: usize
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: crate::regs::macros::RegisterBase<$base>,
+            {
+                build_assert!(idx < Self::SIZE);
+
+                let offset = <B as crate::regs::macros::RegisterBase<$base>>::BASE +
+                    Self::OFFSET + (idx * Self::STRIDE);
+
+                io.write32(self.0, offset);
+            }
+
+            /// Read the array register at index `idx` from `io`, using the base address provided
+            /// by `base` and adding the register's offset to it, then run `f` on its value to
+            /// obtain a new value to write back.
+            #[inline(always)]
+            pub(crate) fn alter<const SIZE: usize, T, B, F>(
+                io: &T,
+                base: &B,
+                idx: usize,
+                f: F,
+            ) where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: crate::regs::macros::RegisterBase<$base>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                let reg = f(Self::read(io, base, idx));
+                reg.write(io, base, idx);
+            }
+
+            /// Read the array register at index `idx` from `io`, using the base address provided
+            /// by `base` and adding the register's offset to it.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
+            /// access was out-of-bounds.
+            #[inline(always)]
+            pub(crate) fn try_read<const SIZE: usize, T, B>(
+                io: &T,
+                base: &B,
+                idx: usize,
+            ) -> ::kernel::error::Result<Self> where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: crate::regs::macros::RegisterBase<$base>,
+            {
+                if idx < Self::SIZE {
+                    Ok(Self::read(io, base, idx))
+                } else {
+                    Err(EINVAL)
+                }
+            }
+
+            /// Write the value contained in `self` to `io`, using the base address provided by
+            /// `base` and adding the offset of array register `idx` to it.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
+            /// access was out-of-bounds.
+            #[inline(always)]
+            pub(crate) fn try_write<const SIZE: usize, T, B>(
+                self,
+                io: &T,
+                base: &B,
+                idx: usize,
+            ) -> ::kernel::error::Result where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: crate::regs::macros::RegisterBase<$base>,
+            {
+                if idx < Self::SIZE {
+                    Ok(self.write(io, base, idx))
+                } else {
+                    Err(EINVAL)
+                }
+            }
+
+            /// Read the array register at index `idx` from `io`, using the base address provided
+            /// by `base` and adding the register's offset to it, then run `f` on its value to
+            /// obtain a new value to write back.
+            ///
+            /// The validity of `idx` is checked at run-time, and `EINVAL` is returned is the
+            /// access was out-of-bounds.
+            #[inline(always)]
+            pub(crate) fn try_alter<const SIZE: usize, T, B, F>(
+                io: &T,
+                base: &B,
+                idx: usize,
+                f: F,
+            ) -> ::kernel::error::Result where
+                T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
+                B: crate::regs::macros::RegisterBase<$base>,
+                F: ::core::ops::FnOnce(Self) -> Self,
+            {
+                if idx < Self::SIZE {
+                    Ok(Self::alter(io, base, idx, f))
+                } else {
+                    Err(EINVAL)
+                }
+            }
+        }
+    };
 }

-- 
2.50.0

