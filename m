Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A18CC0E14
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 05:27:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E424410E106;
	Tue, 16 Dec 2025 04:27:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HDmZoNla";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010059.outbound.protection.outlook.com [52.101.46.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E23210E106;
 Tue, 16 Dec 2025 04:27:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=D5Uxj1V38Ti+7NFEfSaQWzfzKOUmV3KRZXf146WmOpvaZpDPJjIrnKZW+Ett/2JodIIxtY9rUWvbUR9ff+TNENJrjdIqXpo+jiDXCKxhycKJDLJGxBtuSx5dY1l5kLn5XDPM1PwNCKiUFaT9Jd5QMdy0N/u8XnEfYmWFA0CiizMebCmsiGTZ1D87YKT7saIckzv8bdWv/nVZ8DYJHACuuaQhyvLV5yF1kVJRsusekqPFW8V7UmuLMqJv+K0vbw+fonqo6AP/zMWapLLVdvkKnqSScp/+Yk83E6JyMEkcYo8sdf4LJYggWH9PWv8y0cYn6AWmdXl0EsuRlNumbSH2wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmfxjNZY8E/0KB1wR2DgE5OIMZscSgt+R07vHZQN7cI=;
 b=PKNVhV8LA8UZfP/GhfoyOT6DjLxDwy11D8zTu0c+LOAEZzDfGAb0CqQjCueD5Xc7Dbs8/Nu8+CAAH6Errx2XMtBGkSGp8FmbMQfviCo8/XWV7/nIhy5TsuSzY68fYBiptPLzWHAuQe+Kicd6eCK+eb19exhnC9vF/BwKs2U9utohZiUGVLAVevhzTUKSynPEVn9DoAiuPg4xZhCxjGIq5qCYY5rgTL66rq9oGrd6sovAsIoqfZTogcFONe1Ob3gMEyd3qiB8QVAaU0D1k9xa9aIwrxHBFFZREu1F4Va/f2SC7foZeM0V5eloc+tgeRfAtLo3toVx4f4Ou0E8JAY6Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmfxjNZY8E/0KB1wR2DgE5OIMZscSgt+R07vHZQN7cI=;
 b=HDmZoNlaB5h6qr3EEKQYeIkEnP/s6O4l1uPpm+AS+m79i7eV2V42D9m22qH9QK/GbqTfbIu+MbdCTypQqOqH8nq+LKCOGZXMU9yY4vcBU1l5HpygyH8evFeoEwgTSW4XFPP2Cg4qMw4xO5oNCXIQYcJ6VFcUq7gZ+xLGLo00ILAKaCiPu6sor86XtjKV5Ms1xgK4Vs+g7BujQfkeiRiGZQVd85+VVEpGeoeS3hBSRf77eZu3PQhC6O0uiLNVfGfy8nVU+6y0Rf4brL8X+4Uaat9DMzIOmJzPIx5bzA3bE1W1RM8iWj0ufcPu32GrmM58Q7PiyFIJ9X0Z31rv6/o9cQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8754.namprd12.prod.outlook.com (2603:10b6:610:170::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 04:27:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 04:27:26 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2 00/10] gpu: nova-core: miscellaneous improvements
Date: Tue, 16 Dec 2025 13:27:20 +0900
Message-Id: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKjfQGkC/23MQQ7CIBCF4as0s3YMQy1YV97DdIFA7SwKBgzRN
 Nxd7Nrl//LybZB9Yp/h0m2QfOHMMbSQhw7sYsLDI7vWIIUcSIozhlgMrpwtktOjvg9OnWYJ7f9
 Mfub3bt2m1gvnV0yfnS70W/8phVCg6a0X1GtFaryGwo7N0cYVplrrF/jS9DmjAAAA
X-Change-ID: 20251208-nova-misc-1d797b5d64f2
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYWPR01CA0039.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: cc71f5c8-d25a-430f-c937-08de3c5b6ad4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|10070799003|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkhUckUwU1lkTkx5RnJkeGNaSTBVc1BQWmx2ZlFOMXpObEpaRHJ1b1pmeUNU?=
 =?utf-8?B?SFI2TFNnMjZaUE9scEVhUGdRL1ZFRzNjQXc1bGh2Um5CdmhCUkVKUS81RjY4?=
 =?utf-8?B?cC9aSE9tZnpQTGpQdXpXT0JuY1VwYnVwZ3RiUTBsVk1iSU1lQVh2MGpUdDhj?=
 =?utf-8?B?UUpFSll1Ylcrb2M5OVFiU3pvQXZxY08wa3p5WUZyNHU4dmxiVFdCZjkxaHp3?=
 =?utf-8?B?Sjdya20vb0ZaMEpjcFVwZEV0cEEydDhoa2J3TlgwZVJXSi9kbHB6dFkrK1Fj?=
 =?utf-8?B?aUl5c3RJRHh1bWcxR0VmN3VoRVVjczl0S0JPNjdQeFM3TW1qaG1NeWFPT3o2?=
 =?utf-8?B?RXNRVzI4Um1OZjJjZjRpVjNWeGlkOUJCbTlsa0oxTzJueXowblRhN0R5TU4z?=
 =?utf-8?B?TElJYnZsYUdvV3VWbVJWZUE1UFNERk03QmxOZnhaOVA1ZWpXRlV6QVhOUTJS?=
 =?utf-8?B?dFBJWitQSUJFbndKYWZodnAyNDVBSlljSEV1VGVqRGRuRnNZaDhpZU10WmI0?=
 =?utf-8?B?Rno1ekkwTlYyTjJhbTRsTEtvZXFjNmF2T2pnc25xZ2U3dWdPU3dIMngyNnhX?=
 =?utf-8?B?TnZQV0dpWVpqMS9PN3dLc0tUUnVyM0pPTjR4TGx4d3pyRVdPM29Ob0tVSHMx?=
 =?utf-8?B?c3U4ZW9lZFNzMnpVMkJ2bmV4b1VYRnVUL0ZlMTg2WGFXeGVmT0ZrWVVRKzJj?=
 =?utf-8?B?NWNLZFZGZVVLamhIMXBuRGVYTWtQem5Ud3dTL0VvUDdqV0ZlTkZGV0FhdmRS?=
 =?utf-8?B?QUlBTDE0dTdydG5vZmMvQktoS2h6VUQwcUxMMk9nVVRjVDl4Y2FzcVczTUVH?=
 =?utf-8?B?WE5nWGRxa2ZJNk1kdmN4MUM4QUlQOFU0TVI2MkZFM2QrSnpCZDVzN0FHbmNS?=
 =?utf-8?B?ZHhkQ1JsMlcwZ3BQNTIzZjl6OHhZMFBTVG5LWDF3aXlsZFh0TSsxemRudTRy?=
 =?utf-8?B?YkdxZ3plZEg5YmlmWFoyNzBWVFhKUjhaRXc2U2J5ekQvNXB5R3Z6bXkwN0ZE?=
 =?utf-8?B?UTFjUW5Bdmo4d3hXajcyaHlVeGx5Mks1dHZUMGEzTFpnWGthaElXRjlvV1FT?=
 =?utf-8?B?UXd1bklDZnljblBEMW0vc0hjMFQ0dHRVRlhOVENCM1M4bStaK0hLYTFSNlV6?=
 =?utf-8?B?RW5oMGZZMzJSU2p6ejRJUWRERDN0Mjk5S2Z3STVSeCsrVTZ5YWlPa1phMXdX?=
 =?utf-8?B?NVNLcTIxT0VieUdSTlk3UTBnZm41cXlTb0xJdE14TVV4dVNzM3dHTVlLR1Jm?=
 =?utf-8?B?YnhUMnZLK3hIMFlwa2JvOEtJV3FBbFZBZ2xRN3M3czlzRzYwaXN6ckpvSUdR?=
 =?utf-8?B?QnBaSk8zTXViOENOUi90LzJlTDI0TzZXYzZlbE0rbkNhRFgyNExhbWF6SzlK?=
 =?utf-8?B?b000QmQ0QjNNS2UzQlQ4ZVZkWTZ1L2hlK212ZEVTOGRGTnk2TU1VRWhscnp6?=
 =?utf-8?B?RkxlZDF1WXJVMC9IS3hhQ05nK3JHengzbHRhSVR5TUV6citMTWZTWGozNzJD?=
 =?utf-8?B?S2tjUjR4aG5KcVRrYjRnNnpzWDNLbTcrdnlKM3ZKcVdzYXk1NkgrOG9OVlJY?=
 =?utf-8?B?dDZiNU00b3U0ZXEvcWw3OFhqQkp0azZnZS9jb2Roc1ZCNE4wUy9rRWZRL3R3?=
 =?utf-8?B?OWhZNk9NSFZJQUduZy9SOWdJaFdtNVhVZVlTQzJlR2pCUVFtdE11alo5cWNL?=
 =?utf-8?B?Z2U4OHJ4Y3BGNjlsb21iaDhKWTFtSTlZeXp2cFlyei9KZ0FzcTJOQjEyS3RG?=
 =?utf-8?B?dHUzSGttVHAyL0twc3VZZFZRQzdWR1FESXFlbVNXMWM2WGJYSlZMQ0k4Q0Fy?=
 =?utf-8?B?MUdUY24zS1MrUXQ3Sm5odjFxeUo4TlJwZnliUGx4Y09jclNxSlJ6TWpKWksy?=
 =?utf-8?B?N0lsT0VtUWpoYWVzdWQ1NDBwaTU3SnFKM2lHQjhuZzRzRlg2bTNKUEs4aDc0?=
 =?utf-8?Q?5Y5lo1kfb1kQIUOg2SxWSSTV+K+glSvS?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aERBWnZGcU1zakNXcW94RldKdEMyOEEvUzJSSmIzQVlLV2NOc2VtQWM0ZWhm?=
 =?utf-8?B?cS9QTlpjNTNKRThlcThHL3FHOTR2cVJBeXdkRWpLTWhxYjJ6UXBLdEdOSVNk?=
 =?utf-8?B?dXd1dFlNK1kxU25uaUwrTUswN2Q3YkUxdFZOci80Zko3N2V4dDR0YXFGVlR4?=
 =?utf-8?B?aGRvbUhrTkZqdTlFOGZzS1lwKzZLQXZqSjczanBvSmgrZzd6K2NrYzdHNXd0?=
 =?utf-8?B?VmFpcHZqdjAxc0R0Q0pSWmo1VnYvNHJLQXFkN0QxdXJ6S3dnWnNITTZxa08r?=
 =?utf-8?B?NWhoVExlZzJqcmVSRjNLNXNRMUliNUVSS1BUQ1B2QnhhVDBpNFVUNGlVbVlF?=
 =?utf-8?B?N3JCSEVpeFhnZ0VBWnUzSUV3Mm5TclM5RDJic25UT1QzbFJDcWhqNHN1YkFz?=
 =?utf-8?B?V0d3ZW1VdlFNVW4vVHJTUVRTZ25Oa2VBZTVuaGdGQW5yd0ZvSVFONGV6STcy?=
 =?utf-8?B?czhZUVZCdGdaVzZXRm8xYXlDM3gyU1AvTlM4TDkrTXdSRDVCSXl1dnhWbGky?=
 =?utf-8?B?VXhrR1JoUW4wRElGQmUxUEthMXNLNElNQXhBbnNuNEMyY0dLaDhxakNKT2h2?=
 =?utf-8?B?RG9qd1lPc3pvbDMvUUZhcVJOOW5nUWxLNDJhZWJjSkdzQ2xBR2lwOWtaaFRR?=
 =?utf-8?B?OSt4TnZTeDJKa3lYWUJseTZ6bHpzU042WFZMWUR2c0NlU0R4aEgrcHFDOHN1?=
 =?utf-8?B?d2pSRkRRQXdzL3FjQWZ6bFQ2U3JweDZtazZtVHhPck5qVmQxN3pIZ2E0b0tD?=
 =?utf-8?B?Z0dDYmVBdmhCSjJjcVRNY09wNGJPdDU5VW5aS2g3bFJBNGNDOUw2ZlpHbzZQ?=
 =?utf-8?B?bnZJeGxXaEpjZlFCU09DVUxRclMzclpHaEw3SWl6NkdaQ1dMaWxEcm9DSkt1?=
 =?utf-8?B?S0ZvZ0U0QzRNOGg0L2J2eVNhYy9EQ0d6bXhDaklUZWgzTERiT091UWx4WEZq?=
 =?utf-8?B?RlFPWGVGRmtEM1pGcW1EUGVPVjUvWEIrTkRFWlNSU3BFZGdqQWFXdnF0ZG5V?=
 =?utf-8?B?OFgzSm5RU055Q3V1L0x5TTVYWVFNN1VtcFA0OFRaQWR4QWc1SWVZYWdBb0lG?=
 =?utf-8?B?a3hkUHYxSWhvVk1seVZLRkZRTHpISUp5a3ZmYXg5NVZZbjZmYXVtVWNNUmp2?=
 =?utf-8?B?T2VqM01Vai91TTRBSzluKzVmMytKeXN4YzlPZVRBWHFXQXpoRldqK0I1NjZC?=
 =?utf-8?B?RlRoQkVqSHZ3T1V1RUlCb2J6aWxScW02UER4aURZWnphUmFMdHZ3NXJCN1hy?=
 =?utf-8?B?MEN4OUxjNnRHeFNnTzAvMlVGQzl3Zm1BZHBISnpqSGZRRjA1VldCMk9oUU9V?=
 =?utf-8?B?VlUzY0tJa2pQaGRHd0wxcEpMWVR3SVlUQ283dFBpY1ZwYzQ4MVg4UTlTWEpy?=
 =?utf-8?B?ZkpoaktTUFk3cjE0Rlh1WGl5VzdGUnNLWHMzOFJrb3dKVlJMRDVzbmp5VjU3?=
 =?utf-8?B?N3RYdjQ1QURBb2plc3paUlFqc3UzbGZZYy9pRXZJVExxMGhQNkFrSjg5WU5h?=
 =?utf-8?B?bnhGeU5BdUtPMXZ1OWxNcUxrYmV6YlUydUxrMnQ4cXlGLytnc1pUcEYvTUx3?=
 =?utf-8?B?UVFETmlJVEdmZDk5ZFQ5Y0xER1kzeGhDZXdwTGRCbTk5bllpZ2FaYjhMTGx2?=
 =?utf-8?B?SERCOE1kUWpSakM4RldVdTNEdXZJUUlDWEVYZlJMVldUQ3greU01V0x6bE83?=
 =?utf-8?B?Y1c0WXFYeDZkWXpROThiRHVIelhDOGVzSkFkRUpTcTV3TTk4Q0lFQ2lNMzlO?=
 =?utf-8?B?VzlRTXVhZG9MQ2N0bVRDbmNsMUNucHQxSC9xRnZuRmZtMzRSRE9DcWJsQzBM?=
 =?utf-8?B?RUl2MGN6MmxxOU9WN21ta2NjY3YzaDlrNUFleUNZME9la1E1NFdyVjdTTS9J?=
 =?utf-8?B?bVBEUUQyNkxuTGRlWkYvMy9jSlBDOXNhR0k0dTNnWi9sSjNIeEE0NmljZGZD?=
 =?utf-8?B?Z25jWHVWdnRvRlhJQS9LMkF0NC9TamlvTTV5cmVIQTVyNjR2Qm9lKytxdThT?=
 =?utf-8?B?dTE0M2RFaC9UQ0JkcDV0OFNvTnRLaWx1NnVmbkpoV29vZEE0ejhOclQvOWhD?=
 =?utf-8?B?SHZQNGlLRFhvWUh1UUI3cXY4YUJ0THJ2dmQwUUNPclBWd3FjMmR6VTEzV0ZW?=
 =?utf-8?B?Q1VqQ2hKTHFDS20vb21WS2tlRDU5dnpmUGxWdWJEdmtZdTk0MHc0Z3NVcmpQ?=
 =?utf-8?Q?nLymne8paB8tepHBaWvQXWJ+V1A0MtyAgyvmaiSoLlqP?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc71f5c8-d25a-430f-c937-08de3c5b6ad4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 04:27:26.6874 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 62HsiprrAMZkuDkh8ytlrnIofXqY6wAvtW4G3nUWxN0XDHXCgxXixgFviMqSW2IL28qtAgYd5Emb5u1tfmF4NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8754
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

A few simple, loosely-related small improvements for nova-core,
including reporting unprocessed data in GSP messages, removal of
unnecessary code in GSP and the sequencer, and leveraging the Zeroable
derive macro and core library's CStr. Probably nothing too
controversial.

This series is based on the fixup patch series for this cycle [1].

[1] https://lore.kernel.org/all/20251216-nova-fixes-v3-0-c7469a71f7c4@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v2:
- Rebase on drm-rust-next.
- Add a patch to reuse previously acquired reference to define in GSP
  boot sequence.
- Link to v1: https://patch.msgid.link/20251208-nova-misc-v1-0-a3ce01376169@nvidia.com

---
Alexandre Courbot (10):
      gpu: nova-core: gsp: warn if data remains after processing a message
      gpu: nova-core: gsp: remove unnecessary Display impls
      gpu: nova-core: gsp: simplify sequencer opcode parsing
      gpu: nova-core: gsp: remove unneeded sequencer trait
      gpu: nova-core: gsp: derive `Debug` on more sequencer types
      gpu: nova-core: gsp: derive Zeroable for GspStaticConfigInfo
      gpu: nova-core: firmware: fwsec: do not require bound device when unneeded
      gpu: nova-core: use core library's CStr instead of kernel one
      gpu: nova-core: simplify str_from_null_terminated
      gpu: nova-core: gsp: use available device reference

 drivers/gpu/nova-core/firmware.rs        |   2 +-
 drivers/gpu/nova-core/firmware/fwsec.rs  |   7 +--
 drivers/gpu/nova-core/firmware/gsp.rs    |   6 +-
 drivers/gpu/nova-core/gsp/boot.rs        |  32 +++-------
 drivers/gpu/nova-core/gsp/cmdq.rs        |  14 ++++-
 drivers/gpu/nova-core/gsp/fw.rs          | 104 +++----------------------------
 drivers/gpu/nova-core/gsp/fw/commands.rs |  11 ++--
 drivers/gpu/nova-core/gsp/sequencer.rs   |  18 +++---
 drivers/gpu/nova-core/nova_core.rs       |   2 +-
 drivers/gpu/nova-core/util.rs            |  11 +---
 10 files changed, 51 insertions(+), 156 deletions(-)
---
base-commit: 859c55803ab4bfe867be2a5bb116134b7bf50720
change-id: 20251208-nova-misc-1d797b5d64f2

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

