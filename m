Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CCAB09C5D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 09:26:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4D9410E8F7;
	Fri, 18 Jul 2025 07:26:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EidDH2Ys";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2086.outbound.protection.outlook.com [40.107.94.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1876810E8F8;
 Fri, 18 Jul 2025 07:26:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mz3rKnLH9BnsCXaMe3qBiPjZB2HRo+ImLoXpGwdRIVvMkKp6n1O6+Fkym1zsem+GFTzfgkGET/telnk7K3lg/eLZ6Y5e350cTz9fICHM9rpkdDk6Qsm7J9B7p5DoWiGvEchnea9mR25AhmmvsT2SafJcoGQmFxtHg+9xSbAH/a/yngh9Irw6IFJ97DMsDMNY/APv6uUaplyG66ACaSYcZlCUKn7UaeqU47dsXMF4WvCNdmaZ/AKeAXNm7GjJnOkjR/vpHmM88NhKVKxyEOqEDMLKrfK6//i4Rvb3T5uF3tBap/4QoeXPTRcOm8WyHD/WRvrLGUjrF4kuKSUJDcvaBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PtitAcCw9Xzi1IyvZfPQ8mCAcO3cV/28e8mdtyYXvu4=;
 b=UQkuZrxmhIW5LQHSpAqGCrtLhfZpEZhuevnxOKNNpvZYO2bqH9ysR6d1CtvguAK0qHX0vltjfS8pae/BVU4Zj84+k4bruOILAzNAUP3oGPUYmM8zWcjeodiCD5JtF5c93wA9FAid1QMaFXUOkB36i1sRF/UnXtBaDaPl9pqtQlFUpwZurCCe3vX7N3se/oEIO8xQ4uYpshAwcR7PVpOynG1Eyaix82ORYKusPk5WAKFxGN5ipOCGa66hduYyFc5BzgYjB4mbVSXepiheBmK5VKGsj7FCw+8/wTVhz4/Xu6hv+w2XKhNax4aj3TIE/sA9X9SOStYYGIEEA5vWUKr6Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PtitAcCw9Xzi1IyvZfPQ8mCAcO3cV/28e8mdtyYXvu4=;
 b=EidDH2YsaIPm6PM8CAL9iIJcfLvhtJd1tWLxZnVRTqLbHQSDtbpvFyb9azxhgeHKX7S3QjuhX5B++C5Q385gSnPV9pHrmbb+c/kIVvIUBmvvCd1YNIHvh+/A/UaZWTeWaNvr7GMs5oasyAX7ul2zrt1J1sU0o/gv0Na69C/fnqgKvjUUV2bwa5Z7VLR1aapjFOZphirqMW7DfiAvN2FqUHrDoxDMCaDJaj+ldF2X2P+ODt9AVdhSUURcXDqfybGhT71ycXzrVqxHix12ptpo38HVgWnLI+B8dvEj2x9IvvftGfI4bjX/Bp1NqdNYtSpmtpmWQfV76COeiOO6sf6jcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM6PR12MB4091.namprd12.prod.outlook.com (2603:10b6:5:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.25; Fri, 18 Jul
 2025 07:26:29 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8922.037; Fri, 18 Jul 2025
 07:26:29 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 18 Jul 2025 16:26:08 +0900
Subject: [PATCH v2 03/19] gpu: nova-core: register: allow fields named `offset`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250718-nova-regs-v2-3-7b6a762aa1cd@nvidia.com>
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
In-Reply-To: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, 
 Beata Michalska <beata.michalska@arm.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Timur Tabi <ttabi@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0201.jpnprd01.prod.outlook.com
 (2603:1096:404:29::21) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM6PR12MB4091:EE_
X-MS-Office365-Filtering-Correlation-Id: f8015f6f-a08b-4a5d-4dc6-08ddc5cc6985
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?THkyK3F0NmVpN0RMYVVYTk82VVJrNE4yR0RoUm5nNHJjRnVSMjJ0aGJKTHYy?=
 =?utf-8?B?cHRMQXBTZWE1cFIxTDJXYzF6RHNzV2VjR0U1UkxvQThjSDBHUVlGTWhiTGhv?=
 =?utf-8?B?YUdPcXo2Q0FHWE91U2Zra2MyWExXdFlpbkpzK081NStib3FuWUpUUFhuZm12?=
 =?utf-8?B?SGdTeGdLVk5LYUY1cUtCR0Nic1FqSzFKdGU2ZjhxOGYweWFwUFRFL1RBQkxN?=
 =?utf-8?B?WE81b1YwVFZGR2o1dEtCOGtobnBTbUtNN0h2M0ZmL1FTMmduWFdqRVpydkdV?=
 =?utf-8?B?bG12NThJRkF1eG9vQStOa0plTXg0RFNzRlpCZHhvTHM3RGszN09veG9HekVU?=
 =?utf-8?B?cFpOZFAzWVhCR3NzUk56WDl5dXlVSzI3OVUveXhFL0xseFhneG91SGtnc1FQ?=
 =?utf-8?B?Z0t3WklyZmsvSkhBMFNPV1dLWmhoT0d5OWc0cW8yWjM1bzl5WFdoTXgxdXU5?=
 =?utf-8?B?WFZieTZhaFRlLzBROC94SmxqdHJkZFVFd2pyUE9NNTdOakwvelA0QWpodXV5?=
 =?utf-8?B?MDNjS0E1eEdtMTB1bW11QXZ6YVI5SUIxd2trclFXRlEwT1dDUHlrQVMvSHFW?=
 =?utf-8?B?d3pRN1Q0SGY1ZlFzWVNaM3FTa3hzQzJiVXBsMEJoNk5RMlNvQ296cEVBK1lS?=
 =?utf-8?B?Qmd4TGltbUtuTTBLUlVXM01rOEdFNjFMajFCS0NZT2U4VmFSZ0d0a0RndTlz?=
 =?utf-8?B?ZENkaDVrTXpLTFczVzY1eWdMYXNHM0lYM2dQLzRzTWJmWWlMS3h3c1FRNTVO?=
 =?utf-8?B?akRad212YUY3c09CNFdqUjdJZmkzSk9ZZFV2QjQwSFFJU1BGRE1FVGRDbDUw?=
 =?utf-8?B?UG9IN2hsci95Sk40UnZwM2VyaWZhNGhFSGdEYmZYOVhYYkl0azBOaXk1N2hj?=
 =?utf-8?B?dktYR04vazhjeHhTZ0lBL2ZmZG5QOUorQWs0YlhteXdTb01SY3JTeEtmcUJR?=
 =?utf-8?B?OExZekozNW9WNGhjc2lqRkF3VWdOSUppYzNnRUlUVWZCSXRkbjlWOENyK1BI?=
 =?utf-8?B?Si9jVkQ4dXFCYU1sUlkyVG5WbjJqNW1ncUdXdHgrQW9adlFHZmRua3gwMXd0?=
 =?utf-8?B?SDhhSkREU3JVUitMUStZVUhiS2gzMkI1b1gxSW9HK0FFV2FodTk5UHNVRFlk?=
 =?utf-8?B?K1ArQW1Nc0tER0xjbVNvRzM0anQyVUFINWxXUklzOEduekFRcDZSZGZBQ3R5?=
 =?utf-8?B?Uk5yeHFCSUdIMkJwaElGVlgrYVhlNEhvRVZ6bjRYbWg2TTlseGt6dDJ0eHdi?=
 =?utf-8?B?ZCtEa1R6WVE3cXRmd1dCWS9taWdXU2tIM0hTaENBcVExekE2blJCVVlsT1cx?=
 =?utf-8?B?eEp5cnY5aWRISkxONlg5cmV3ODVqU0NUWHMwZHhiUlgzQzA3K1VpbFlnV1Yx?=
 =?utf-8?B?QkxqdTc0SnRLTlRvd2ozVEpPZExZM3lQUll5RmU1T2s4T1RGeEF5dll0d3Bp?=
 =?utf-8?B?OW9KOWlSTlRSOTZ2eUxQYUNFdkExL0cvVmJuS2twWWEyelFZNTg1WGtzQWhG?=
 =?utf-8?B?U2c1KytkWkt0U1o5Z0tYK3AzOW01TVJGY05OdllydmNRWWlYQ1NLdGtsOG9V?=
 =?utf-8?B?aUdLNGIvUUxWMys0YkFPeFJnUHF1U1lhN0dUd0tDUTJpK2NQaFN2RDBnSnYx?=
 =?utf-8?B?UG9PdkFlbmFob1I0bFljL3EzVlIydjVjTitoeVRoYk1lL1hVNWVVT1YzaGxY?=
 =?utf-8?B?YnlFOFdFdGlacjBtYmhoeWVZNnYrQUpGU3A4UU8yd2FiUHRoZXRTWk9rWGE5?=
 =?utf-8?B?VTRlZVJJR0xIM1hzUDd1MWlMb3BxbHlYM3FtNHVUZ3NvUzlwOUp2eUJ5VlhC?=
 =?utf-8?B?dmJkMDNEek1iTjBSY1cvR2hkNGJ4VUNwMXBDVE1yN0FZS3VMWGdNRVVMS3o5?=
 =?utf-8?B?WmZVS0xPZ2ZDR0tFcmhPUkZHdWY5N3JESHVCdmZRMnhBbVdBN2xYTkYxMTYy?=
 =?utf-8?Q?H/F2vtaXxyE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z0Y5aEVYcUZnaUJYM0NnaVdWS3IxTTRoV2FCZURDRTI4QUZPeVpEUTVNaWRk?=
 =?utf-8?B?VzdEMi9wTFdVVmhoNUM4eXNkbERoeVFVc0h3RXAzbTZLR1ZGVk5SZFNTMlJp?=
 =?utf-8?B?d2gzWXZsQUJISk16Qk85TDlPaUh2YlpaR3RaaVRJeHpUV0NZNWx3SFU2MWpl?=
 =?utf-8?B?YzY2ZjlibjdmVWZWS3ZVTzNkbFRlcHV3Z3NGS3ZiYlFNV2FiYTlyUnZDTm1t?=
 =?utf-8?B?bExrTllUTWdnM0RobDVxUkNHR1NYdFZELzZja2JZdXZ0NDQ5ZlF0bi8zMFJh?=
 =?utf-8?B?TE5PU0JjcUFsWEM0aVdnQUFBNG9SNDVSTGZtTERrUDRhSG1XRitUNHVyc0ZR?=
 =?utf-8?B?bWdTMzZUdTFyNEFieG1ud2szdnNIRnd0Ujl3Zzk0eTNTU3VlWE4xUkEva21C?=
 =?utf-8?B?QTJZNVptbGo4NXZmWWxTS1NwMVdRallKZWxQTTBUQ04yQ1FoZ0tnR1dnSFh6?=
 =?utf-8?B?UjFjcEp4Y0F6WUZIMDc5RlZraTNDOWFKd25qanVPOGhyY3F0ZERqblhmT29O?=
 =?utf-8?B?Vno4eGVIY3dYNHM5T085dERSZFpZMFVLdjZLeTFkVnhkemk4Q3k5eVJoL3JG?=
 =?utf-8?B?WTZXVWZZTGVGYjFmRGJZa2szeGdUOUVadmhzbmdtdzhPdEplUlVTTi92c2VY?=
 =?utf-8?B?NDhmank3R1llNytmSUFUQlBiOVF2dzJJaUcwRFNYdElDTGNLRWh6aStEUWdo?=
 =?utf-8?B?V2lrWmNqbkFnQzR0QUozTDVUeDlTNnI1b3d6NVJSbnp4N3RmaXB6ekloNC8z?=
 =?utf-8?B?K2Vxa2IzeFdKTmlzRnRFTHZMTUhXNENQeFdiTEt4c1pRQnNTK2FhcFkrTnF5?=
 =?utf-8?B?Y2ltQURIUktrcXZMRkhzTFp0Wlgrdnh5QlY4NHZhTmtpc3Rkci90S3VYRXRa?=
 =?utf-8?B?WFJhQWh4VSsvdzNUYmZlR3JKbW9xdU1DL0o2SVNnVFpSaVdVSGpTZ2djYmM2?=
 =?utf-8?B?eGJHWHZEUW5vcVUvS2ZIajhwVnk4QndqV3dDNG5oTzRBZXlUVFc0MDhyN2FQ?=
 =?utf-8?B?Z3EzZlA5L0xmNzhBVGhhN29TY3QrTDc0MHpURG1YdGFsSDZiL0E4eVFrL21j?=
 =?utf-8?B?eTJYRVpCRjQyNnFWSXByWDhKR2U4R2hoYzJqdVA5LzlOU0ZXbXNjSStkbTVZ?=
 =?utf-8?B?RWVOeHAzU3JXald2WlpnVlVLeHlBMzl6eFg3SmJId3ZQRWIxak8xeHZ6bnlt?=
 =?utf-8?B?aGE2cHBhdTQzanpKODNMc2VXVzVaN3UxcUN6SC9hYzJMZGNoajlLQklpanIz?=
 =?utf-8?B?ZXVoS29sRlNEaWQ2UHAvQTA2d3ErZERPMXYyaHljMHZETUpyNjZCRExFcUhY?=
 =?utf-8?B?UzhFQzlLTnBhSDZlMDJIUkxDY0hHMGJjTGNXMVZvVnhOS0NFZHRYdkpLM2Uz?=
 =?utf-8?B?dFdvV0JuY1g4eFJmd2crMXF4ZGRRQU9LRkUxdDZoS3EyY3dsdlFhRlRNQnpi?=
 =?utf-8?B?VXZJM3hlcnJCZ25lTENIMk5nQ2RaZ1RtaTV3NTR3WGR5U1NIa3JVN1kydnVo?=
 =?utf-8?B?SHpDekN1TzFURVZhWnQ5L0owU1BZbEIyTE54WFk5bGhpSklpcXQ0Y3pZN1pV?=
 =?utf-8?B?b2pmdTZaRFNQUVQ0YXZVaVlZUWJuaEc1R2dLd1lMOEtacmxTZ281ZDhDd2Rk?=
 =?utf-8?B?d21jUUpMV3NSb2d3RnpYTGFtWXk3NUVZMkJxb1M2Z2ZRaVpCbEp2S2cxNHgw?=
 =?utf-8?B?NjhqSGcrbDBIL1NBbmd0THlLMktoSzBRZ0c0QzRRRnRlK3lGck5ZVjQ5QWho?=
 =?utf-8?B?aGlzZyt4R1IzNVBCd28zejB0RElXVE9Mc2I0b29oOG1IWDMycmc2R3Zwa1pC?=
 =?utf-8?B?VmdGNWp0RnFRdFUyRzUzWHN6QjJrWGtrczF4ekJaRklYaitkMkNHUWZjNFJ3?=
 =?utf-8?B?T0tyRTFEUDNSZDRPS3lqUFU4WlZ4cEFjMGE0dXlQQWcydVlOeTNxQ1pYRGJm?=
 =?utf-8?B?V2I4ZytlZFZ0a0YxRE1UOERxbVgzRTV4a0tnb2lYZkpnNmxwaHlhelp5RkJ1?=
 =?utf-8?B?OG1tcFdqQkxCTXV5RHRkeGo0cW1sSk5iZFUwVWJCYWdBamJKdE1YQjA3N0Rx?=
 =?utf-8?B?NjcxQnpZWGMwL1krYW9MM0dyY1VxK0RzT0JYUnlqeWpMZDBYUUtrZEVJanNH?=
 =?utf-8?B?Y0gvWHlhenJqN1hLdzB6bUREbG50SW5vODJ5cXp2WkRPZlZOS0xvMlFzYlBl?=
 =?utf-8?Q?heiFu6SxA3jAolTmiHSskcItSO/GmIUY30G+59RRqDw/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8015f6f-a08b-4a5d-4dc6-08ddc5cc6985
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Jul 2025 07:26:29.1933 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZTv8nRASXcglti9iFg3ClqnXwmnxzHjNKgRTc1+weqrPidKetnxHsEdmPaHAfPl/mSbdzYih9fp7GMHzgUdCtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4091
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

`offset` is a common field name, yet using it triggers a build error due
to the conflict between the uppercased field constant (which becomes
`OFFSET` in this case) containing the bitrange of the field, and the
`OFFSET` constant constaining the offset of the register.

Fix this by adding `_RANGE` the field's range constant to avoid the
name collision.

Reported-by: Timur Tabi <ttabi@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/regs.rs        | 4 ++--
 drivers/gpu/nova-core/regs/macros.rs | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 5ccfb61f850ac961be55841416ca21775309ea32..2df784f704d57b6ef31486afa0121c5cd83bb8b9 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -28,7 +28,7 @@ impl NV_PMC_BOOT_0 {
     /// Combines `architecture_0` and `architecture_1` to obtain the architecture of the chip.
     pub(crate) fn architecture(self) -> Result<Architecture> {
         Architecture::try_from(
-            self.architecture_0() | (self.architecture_1() << Self::ARCHITECTURE_0.len()),
+            self.architecture_0() | (self.architecture_1() << Self::ARCHITECTURE_0_RANGE.len()),
         )
     }
 
@@ -36,7 +36,7 @@ pub(crate) fn architecture(self) -> Result<Architecture> {
     pub(crate) fn chipset(self) -> Result<Chipset> {
         self.architecture()
             .map(|arch| {
-                ((arch as u32) << Self::IMPLEMENTATION.len()) | self.implementation() as u32
+                ((arch as u32) << Self::IMPLEMENTATION_RANGE.len()) | self.implementation() as u32
             })
             .and_then(Chipset::try_from)
     }
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 93e9055d5ebd5f78ea534aafd44d884da0fce345..d015a9f8a0b01afe1ff5093991845864aa81665e 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -278,7 +278,7 @@ impl $name {
             { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
     ) => {
         ::kernel::macros::paste!(
-        const [<$field:upper>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
+        const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
         const [<$field:upper _MASK>]: u32 = ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
         const [<$field:upper _SHIFT>]: u32 = Self::[<$field:upper _MASK>].trailing_zeros();
         );

-- 
2.50.1

