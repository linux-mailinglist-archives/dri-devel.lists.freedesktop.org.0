Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5EB5AAE168
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 15:53:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB4AE10E7F1;
	Wed,  7 May 2025 13:53:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WRN9P3Qy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2075.outbound.protection.outlook.com [40.107.93.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D15A10E7E4;
 Wed,  7 May 2025 13:53:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HQ84z8MPgPt9tGoIakH/1wqTUlLN5Qu2oxiW7TIQPn/irlgIyKZiSTY31qEPKbPM0zl7K8R2I96SPx8AI9PnBgIlIxV0XlRzCFKMDPJcEIdiWqLj5S7Q6XDJ1pgUY8hb/B0DzPAnmwylTD8f2fOSQfJ7fMIQVVHyqka8vewnlU7Y/sP4PUdXzmI80rOWmsYXQhsZQyihMPmrqvJ6vRMkngvXOfx6ssCLwYk7Ws/tyCNZNQLQCZcuZoVGaNJWvkg6JMSrZfRj9gKrI5IO0WLA8v5LtEKZsGevSLpz9QsAfRG2fyTo2uT/CHFVaSx7NIGYgKkUWePEowjQ8i+S9QO2ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TkWinbAoK4p5+9fWqkR75af2uYQ2XXJJzuX8K2R2ctw=;
 b=CdY0MeYkDKCw9LJsHajfQWxq6hanQledkffd0KdO4cQnNyEP/R6+rNn4bWV3oFKJjzxvXf/M7TbmG5WbqxnhJqghFMOuiXd2Ii9ivoIpK0FYD71LqEdytBueJTyxsUeKL1XnFf/6qbdSfcyv+jjDJILT8nJ6BC/nlRGrERZ3aU+j5xBmT8pkUN9lwgZpg5RyWPgGgxLeySN1G7xR7cDi7lP7eMBIWfALqwHsuio7fl4zy+biUran94gyiq514HMxwjqjVPgVengslLyutfRXLYyWXplMfzR2mq7FX1vEzX+KjM63DIu3M6mmsU0odxih1X5I6dlWTX34OWm8Ag86sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TkWinbAoK4p5+9fWqkR75af2uYQ2XXJJzuX8K2R2ctw=;
 b=WRN9P3QyktwWh4oPooIRx3ALUgLdkEMljqg7tCz3dzPiDLtxekEdMPgzIoqzkLK5+hXPi+Iix622XraUuuTSRAMG0UaLMOJX1g9rla60I5Cr44cyhURvl0ltFo+iyRhw/HI1pL9ULOZAVeaFFOq4oShq4Sn/p+V14eOqMr6/wRfKW4q7KViee98OIwb4jrweKISfcrUBf4/aKcW8QHMQazF2dav8Fzth+iud06VIqAjgTOMZBS9CvnRojcaivSANt+LlH9l9kZm2gQSkW+NR8Tkzd0eIS7y7W70goSVhQH6TAwW3+hxlqGnSGOpg7tD0jY0iUqKF5iMp0sVwoALhQw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6761.namprd12.prod.outlook.com (2603:10b6:510:1ab::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.26; Wed, 7 May
 2025 13:53:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.026; Wed, 7 May 2025
 13:53:21 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 07 May 2025 22:52:38 +0900
Subject: [PATCH v3 11/19] gpu: nova-core: register sysmem flush page
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250507-nova-frts-v3-11-fcb02749754d@nvidia.com>
References: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
In-Reply-To: <20250507-nova-frts-v3-0-fcb02749754d@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: OSAPR01CA0223.jpnprd01.prod.outlook.com
 (2603:1096:604:28::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6761:EE_
X-MS-Office365-Filtering-Correlation-Id: 7216f648-ab0d-4c35-dd7e-08dd8d6e8728
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dExBMVlyUFpkNUZIRXUzYUVnbVNyRUxxeXdvR2RSRUtZZi8vWFZoY0VlRVE3?=
 =?utf-8?B?a2RoM1ZlZGEzYWRNaExSYjhwcFIycDE5Y2hDUEdRMEpwc2FSSGhpSlBMVWF4?=
 =?utf-8?B?M3NldTZIaGg1MjZhQ0RoUVBRR3EwMUxVM2xIbWpDQVZ4M25ZVUY4b2ZZSzA0?=
 =?utf-8?B?ZlB2eWI3ajIrS3VwdXkydjljRzZIT1IwMjFkcWZaMkx4L3pvUk0wR3VKS1lS?=
 =?utf-8?B?Kzd3NGVpRHpqSDJKNjkyUWpwZTZsRW16U3VxZi9XSXlaN0pUUnRvQnlZOHlx?=
 =?utf-8?B?SFF6U0t2YXQzamJwMXVMVHk2bFRRNlNIaUV5Y1RLUXUzZGNSR25QZG5lOGFj?=
 =?utf-8?B?S3dIM0NUU1FXNWUyVjhyNDJRU0ZVaDZCNHlMaFFKUytIU1YwamExYXJvSldH?=
 =?utf-8?B?L21kZGhNRCthZTNHV2l5WHUwcDZ3VUVFT3lCZDIydDJnbFFLL0Eyd0lvc3lS?=
 =?utf-8?B?R1V0M2cvKytnelpzTjk0amV2K1B2bXZCZFZkVmIrdlVpc1RlSXpoNUZ2UVdl?=
 =?utf-8?B?NHZaU3BhalRUaUlJRHcrZ092emQ1MDJwSm80ZkNaLzVjSC9aSnN2MTBnanp5?=
 =?utf-8?B?MTk5TmkxcFBVYnRRNUdOMGFJZGQ4cDlSM055M0VNZDFpbjZRQ0laR2kwT2xE?=
 =?utf-8?B?WnVNeXpwTm5hRWlia3psQWtrZWY1WldaSDdJMXhiVWRqdXlXT0g5QWFOTE41?=
 =?utf-8?B?djAzRUhBS1g2QnVHazJNNFhZUGpuUHV0Z3BtYkphTDVTdFNjWUtzdzRmRlBQ?=
 =?utf-8?B?b0REUkt6R2xaVjV2VkR5L2Q5d252czJKTW9odHdFQk1WRXpudXRFUE9FdlZh?=
 =?utf-8?B?K2RaYU40cVNOSFdLdGpZai9ySW8wYnVyVjJvMU5PcmJHamlkSFBpeitrMlRO?=
 =?utf-8?B?TEpENERWcnBaTy84Q0VrTHBobXhYeS93NGNYY0pQSUorc21uTzJyNkl4QlZ5?=
 =?utf-8?B?dkp6UGYyeE5NSitSaUhwVmE1VVpiTHc1L28rR2hZb1JjVVBCcFFaK0wzOE82?=
 =?utf-8?B?eFNQN3M5QzAxeml5ZXZQNTV2bE10NERqWHNzdSszVjZDcDFUWjZqanA4UEhH?=
 =?utf-8?B?NjYyRFdaSUtwNEpQZTBoYVkwRHpkZkJNTVorRU1GYVVrcGc0U0NtaWU2eFFH?=
 =?utf-8?B?T2VLVEZYZ3MxcXZaWmNQMU5zYWpRRTRnbk4xREY5akxuWWZUalZ2ZURMZk1G?=
 =?utf-8?B?dG1KVEJZRkFscVp5YS9rZDFNaXd2czhwNFZmQWdFa1NJVDNVVmhjMmF5OU9t?=
 =?utf-8?B?MXBIcW45MmtnbEpYNGFoYjBJNWtJNlIzWUxtTEc5QkIwUkl1OGova3krZlhr?=
 =?utf-8?B?WVZONTJPejFoYnF4c091ejIwRFJPeVRqY08vQVBwQzU1Z3plNWc4a01LU0dX?=
 =?utf-8?B?TUtHelh6SjNHNVBSNVo0cW5LanF6WU9GZFpFVXdvK0hqenc1bTZLZWU0NVRh?=
 =?utf-8?B?MXZFK3VkWWNHbHVUQ3ZLSnVtcTV6Vnd3aVZvUVRGMzJNU1dBV2JQQWV3UERp?=
 =?utf-8?B?M3BMUlZKdzdCYk9DS1JHODNwemVicFJFcUtScHhQcGtmVzZZRXlFQThKRlNz?=
 =?utf-8?B?VUpQRGpVWE0zVUpXTDBNRjN2Y0lFM2hJNWZ5dDgvWTRkcyt6cTJFSENzQVcx?=
 =?utf-8?B?b2EybEhGWWRBSTVGT013T2c4MFpydllWaHcrN25sTFc5Y3dxelladmorbE5n?=
 =?utf-8?B?eUh0ZmM2OUNnbkpxT0lPRUZZM2g2VlVZZmM4bHZ1ZEFmUjk0WExBUjdOWEc2?=
 =?utf-8?B?NTROV2JKT1ptdzhQWGViMlBrNUtTbmdpOGk5bTFLOVhnOFN0WmczZkp3N0Vo?=
 =?utf-8?B?Y3ZFWGRPdGtTbEJkRGdia1FZbEtWYWhncjRHa29KcGNKekx2bTY1T1VlbWp5?=
 =?utf-8?B?UTliUkRad2JlVmp5Rmpkb2I4SG1IeEpUWjFxdis0ajBXdUpQNFFybWkrSFVl?=
 =?utf-8?B?NklodWhYUkNiYVRkN3pwODFGUjhrOVE4UjYvSTFBUFpNb3VRVWxBYjRzaStH?=
 =?utf-8?B?RkJjTk44WmpBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THFkSEo0aGVwcHZHeFpLY3NaTkVkQUFzUWhQMC85Z21HN1ZhMWFRSzlnaXc0?=
 =?utf-8?B?Rml3aUN5bVBEZFhCOHBGN29iY0lGL2pWc25jR2tkNGRsM1hpNytSTjZrU1RO?=
 =?utf-8?B?WUlWdG9vdkJrZGVzTGk1YzJENzd1bDZNVVRmRm10QXV2Nk9oYm01blNSUUZi?=
 =?utf-8?B?QkRldDFUQlNzSkxMRmRzQmZvaTFLTXFRVFV2VVNNTFlpWTZHWEZpbmxhNDJp?=
 =?utf-8?B?emNtdXdzamp2RU1Ed010UnoxT09DYmRVSEZvaGU4UUJiNXAxQ24rZmlCYU5E?=
 =?utf-8?B?c01vMHZZSXRaRnpMN3Fkenp3Y3FKaExieGtYc0lPcEdnek9qTjdMWFFRR3RW?=
 =?utf-8?B?R1l3aURwQVNrUWFWeDVrSDBXT3V5UjZUTkVEcUhYQVV0bEdHSmN3eUdVbEgv?=
 =?utf-8?B?eTY5N2tUS1RhVVJaOEw0TkdsYW5YMTAyMmpHZTZNVmxDaWNyYit6SVo2eEx4?=
 =?utf-8?B?RFVkVk5NTVNCWFpMTk1sZFFWQjZjRk9VS1hNOXArNmxwZFFiY212LzIyRFVP?=
 =?utf-8?B?Sk9UVGlzSXRHa3B0Tzk5S0lxTUxLcHA4YklwU2prUnRhR24zWTdmYzRKcWpz?=
 =?utf-8?B?dlFkZTE5ck16N29Vb3NvVmVBeVd1YXRXUy9sNTlzdzB2VGYxUmU3SllFSGY0?=
 =?utf-8?B?WFJrNWluWVpZaFZ4amdNNDB4K0x2N3lnRnFBSkJrR0hDVGVCSUNLRmNrbml6?=
 =?utf-8?B?Uk1pcWovakRzTVl3em1nSWZ4RXo0MFNjekltQnhjb1QzRG5Rc3ZCa3p5Vm9V?=
 =?utf-8?B?eHVkNTVXRHlUTWNOdytSUHM0c2lYU0hCM1JYdWZrSEVjQytjbnF2UmRKWlMw?=
 =?utf-8?B?eGdHU3VhaGIxdnJXV1NaY1RUdmZiNVlXRlhCMGh1NnRrdFBRcnNhNyt5WUY5?=
 =?utf-8?B?aE1xNWJVQVF0ZkV5N00rVVREMm9JcTZENUd3REhMM2JyblFUcjBpRGpBOXMw?=
 =?utf-8?B?Z3hHZUhYYVZlSG1jajB5cTFhbXM0dXdudjhDR3EwenlmMXR0VDhrVUtjMlNI?=
 =?utf-8?B?K01WTjk2QU1VbFNjYUkzY2VNUTBWUVpwV0E5T0RkeHcxUU1CbDZ3VS9jM2pP?=
 =?utf-8?B?dlFNM2NvdldxQWJKdHJuc0VVNDZhZndaWm9IK3AyUmJxVDJOSHNLNVcwcldv?=
 =?utf-8?B?WlJXdDV1V2xnMkdiVzVxZVlDUGM5Sy9EaFBLNHhJWTFRVmJhbkdpRzFVUmIw?=
 =?utf-8?B?Q0VDaXkvWTFyTSs2b1ZzZUM1MFBHOThzZDdZYndGMWdWaHdYQnVQUEM1bFVJ?=
 =?utf-8?B?UXUzRXdJOFJDZ2MvQ1o5cW5sVGRNQ0Z5QTg4enlrTWFLb2tGK0ZIQ0h2OTli?=
 =?utf-8?B?ODB2TS8ybjhMQnduWW9RbFBkdTIrbWZsNlZzeUtFR2xSZjRJRDBoZk5SazZ1?=
 =?utf-8?B?OXBFcXhQbG1DQUordlk5OGVabXpUWDRyTXRzbGZ6UTF1UnFpYmE1THpCMGZU?=
 =?utf-8?B?UHVKYXIzK0llb2tuODNBLy81K3hRcEgyUHMyaCtVWlpEQzFOWDFvWElML2s3?=
 =?utf-8?B?c3hSbXhoMEFoWnhjZzljU1FxTXhYNFFOMEFZSENLRUZWZEVEMDdFZ0NoT1F1?=
 =?utf-8?B?UHJQRWxienhSM3lXeDh2Q1hoSFY4QlBnVVRHcUdjVlFDNzRmNFJoQnB3M0p5?=
 =?utf-8?B?OU9xSXo2cDVaWGE4UnZWRG9hdE9MSFJHbjhhSU8xSHE4cU1jNnlWeGNqWVZn?=
 =?utf-8?B?aUs3SXFSSnpZNVUxMkI2SDdMMHZRWHRiQU5TMnJtQ0xZMllXK1k2V1ZEYWlX?=
 =?utf-8?B?eVZBTzJiYTlDbFlFZHBrcHB2ZWxNVTlPUW1lWUVjNnl2NnBnZndHdC9MWUh5?=
 =?utf-8?B?RHh5bGt4emtPMGV0ZElJNjhYR051RGl0S1E4bWxaaFBQUng0QUV4dWQzV0NN?=
 =?utf-8?B?Yml1cjJBTU1TbU5yVktUdWZIb2l5a3kwY0MremVVREgwQ0lyYm1JVWxYQ1Zt?=
 =?utf-8?B?QVdweXNBUGE0cTFURnMxcThzQUxpbXZuSGRXV0NYRFcrbzBBVERpa0tYcUhL?=
 =?utf-8?B?QWFVd1VZS0R1QndpYjdzZG5aUzZGdG80TS9XRTZNWDRzcmtobWd5WkFNSERs?=
 =?utf-8?B?MWRlc1lBc1pzQWx6OWZqOVFhb3FEcmJtWWV2M2h3a3Z0VEI2VUJFL0VvYTFo?=
 =?utf-8?B?SVNaYjUzRFF1d3BGZU4xRldkaGlJZ1REakRKZjlzTGl0TmtTUWNSTmV6STJx?=
 =?utf-8?Q?7poH1Yy+u1969Eduy82eCtofllZwQRN3BSxA1vHOmQAK?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7216f648-ab0d-4c35-dd7e-08dd8d6e8728
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2025 13:53:21.1224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JzXNk0z4C8U2ZpoFVmhVIL7GirkwTcxoPUN2bbCwxcbYqu9wHUrxG/AqsIHzROFJXkxphE8Rz0P9Mk7zltycoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6761
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

A page of system memory is reserved so sysmembar can perform a read on
it if a system write occurred since the last flush. Do this early as it
can be required to e.g. reset the GPU falcons.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs  | 45 +++++++++++++++++++++++++++++++++++++++++--
 drivers/gpu/nova-core/regs.rs | 10 ++++++++++
 2 files changed, 53 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index a9fcf74717791dc7e23678869bf84f61e51873e2..c338da69ecbc2200f1ef3061a4d62971b021e3eb 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -3,6 +3,7 @@
 use kernel::{device, devres::Devres, error::code::*, pci, prelude::*};
 
 use crate::devinit;
+use crate::dma::DmaObject;
 use crate::driver::Bar0;
 use crate::firmware::Firmware;
 use crate::regs;
@@ -158,12 +159,32 @@ fn new(bar: &Bar0) -> Result<Spec> {
 }
 
 /// Structure holding the resources required to operate the GPU.
-#[pin_data]
+#[pin_data(PinnedDrop)]
 pub(crate) struct Gpu {
     spec: Spec,
     /// MMIO mapping of PCI BAR 0
     bar: Devres<Bar0>,
     fw: Firmware,
+    // System memory page required for flushing all pending GPU-side memory writes done through
+    // PCIE into system memory.
+    sysmem_flush: DmaObject,
+}
+
+#[pinned_drop]
+impl PinnedDrop for Gpu {
+    fn drop(self: Pin<&mut Self>) {
+        // Unregister the sysmem flush page before we release it.
+        let _ = self.bar.try_access_with(|b| {
+            regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
+                .set_adr_39_08(0)
+                .write(b);
+            if self.spec.chipset >= Chipset::GA102 {
+                regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::default()
+                    .set_adr_63_40(0)
+                    .write(b);
+            }
+        });
+    }
 }
 
 impl Gpu {
@@ -187,10 +208,30 @@ pub(crate) fn new(
         devinit::wait_gfw_boot_completion(bar)
             .inspect_err(|_| dev_err!(pdev.as_ref(), "GFW boot did not complete"))?;
 
+        // System memory page required for sysmembar to properly flush into system memory.
+        let sysmem_flush = {
+            let page = DmaObject::new(pdev.as_ref(), kernel::bindings::PAGE_SIZE)?;
+
+            // Register the sysmem flush page.
+            let handle = page.dma_handle();
+
+            regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
+                .set_adr_39_08((handle >> 8) as u32)
+                .write(bar);
+            if spec.chipset >= Chipset::GA102 {
+                regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::default()
+                    .set_adr_63_40((handle >> 40) as u32)
+                    .write(bar);
+            }
+
+            page
+        };
+
         Ok(pin_init!(Self {
             spec,
             bar: devres_bar,
-            fw
+            fw,
+            sysmem_flush,
         }))
     }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 401d885539cee03cbe732102f5e2233785a7b284..218cb6441eb0e5c6e5b52eabba006163eec0c8b4 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -39,6 +39,16 @@ pub(crate) fn chipset(self) -> Result<Chipset, Error> {
     }
 }
 
+/* PFB */
+
+register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR @ 0x00100c10 {
+    31:0    adr_39_08 as u32;
+});
+
+register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI @ 0x00100c40 {
+    23:0    adr_63_40 as u32;
+});
+
 /* PGC6 */
 
 register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128 {

-- 
2.49.0

