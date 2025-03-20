Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75681A6A761
	for <lists+dri-devel@lfdr.de>; Thu, 20 Mar 2025 14:40:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98FD810E627;
	Thu, 20 Mar 2025 13:40:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="a/dlY2qp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2048.outbound.protection.outlook.com [40.107.244.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2D4C10E61B;
 Thu, 20 Mar 2025 13:39:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CYQZ+KHxGR1ehdNDwLUvkhH1rIQuueHL3ZXmAUBkTF1qAMSWFlgI0n3+XwYDvhx0pS6+LgVZ/zBymbLyYUYlSP6uLlc2/5kAWdvpdAW5mOrU5zozs8L2Al4GoEiZ5dF7EqQQ0GCDYC7NsuDe918AkL7il0aAytgViLRJZ9zyQsPtOwgPcDFN8V6SxVui+SFFUkTmcyBfKwDco6Cm6ZWXiXQ9sClr+rZPDFwztp4pHj8pNMrQvFeJxGOIMswU2yFX/MsoJ7REQakx99t/qWUW+G07S1IQj0DNBxEAIyNWWxaNnAY94KXyjA6dw1rUykRwsrRtolJdgKLT8LuJiZXNXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UGVZG1xRBatSmCFEwlJEeNReMyfGhf7QLcPFnC3KbB0=;
 b=gy+DsZAFgoIecz4bolxxN8dSJhpO4f6d3gNaZt7P5bOkTOFvErqRnYzTvuamNxc/b/egCHQEL0BpdV1gd7RtF+p1Vs26PKcg/t74lz+KfhKg7GO/k+suPcgepDEvRU/1ojIUgkBo1M8X+UJVQBBM+Tsr7hPRZhKwknzD4T5LAtdsTMgz1tQvSrhy0zJfKjpP7MIkjyLiqRo18uVTE3+guMnruPcMAiDpemJw73k3RwIYtWWxtWFWmHpdBwibOV3uVz+9NMxfx2lLfnCOkvB5+E1PHOlQk4MqT0uCpyHYN9pfzPymIDo/OtQhmA3xuEkCoUZyyUQ8z9eulc0WPJkCVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UGVZG1xRBatSmCFEwlJEeNReMyfGhf7QLcPFnC3KbB0=;
 b=a/dlY2qp4jYS4i9L4IyCQZtdhZOVkhM3hpFDFjXKAD08bJzvQ4lZ6kOgU2QQ8ScuiJB3iFkdPScVU+TfiA5qzW9aX8PQgy6v7Gz8E0quxIniNbOAW1puq4yHvu+CFGEC4xANZfqjShZOpDE1Eqk8gmA5tN0dOJNctvUGJFZ6hDem6gPo8+uv7/Mk77jZiz/xCGy6IOoh5efpRRMt07KZnMXFgJpfKZs/gL6m8UJxT15wo/E4GqinYmeqUQA0sNsNHO5LVjVvLjZgfyvGj2RILW9e7iZUoF7JGvodH2mz8gEcSpp0LIk7Lzp58A1xUUfALCuZ+cqalM+iqbdUzDQrew==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA1PR12MB6409.namprd12.prod.outlook.com (2603:10b6:208:38b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.35; Thu, 20 Mar
 2025 13:39:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8534.034; Thu, 20 Mar 2025
 13:39:52 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 20 Mar 2025 22:39:14 +0900
Subject: [PATCH RFC v3 6/7] gpu: nova-core: add basic timer device
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250320-nova_timer-v3-6-79aa2ad25a79@nvidia.com>
References: <20250320-nova_timer-v3-0-79aa2ad25a79@nvidia.com>
In-Reply-To: <20250320-nova_timer-v3-0-79aa2ad25a79@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Simona Vetter <simona@ffwll.ch>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0271.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c9::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA1PR12MB6409:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d33a1b5-adbc-4f94-153a-08dd67b4b0ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VkkxZUVzaVNsOUd2a0huR2dsMHFxekVhaGc2STJ1bG4rWmUveWZ2RUQ0K20v?=
 =?utf-8?B?TmJKR3o0eWNoK3liejZnZlUyQ29uN2pkT2VmcTJGdVZ0VmVKcHhBOFlPT3Nw?=
 =?utf-8?B?UHFmWjBEMHhMejRQeXBqYTQveDZLZi9XaFRkckhUVnY1eFJ6aXRTaXFzRWhX?=
 =?utf-8?B?aGlZcEVRQ3N0a1lCaW5GUWQ0TkFNNVMxTEFISlFDVE9hY0hHeC9LQTF4Qndm?=
 =?utf-8?B?MmxBTW4xblVWS0VSWmY0RnY2dTMxUXY0ZEw3Z2t5eHFLMzNVWXQ1Z0UxeDBE?=
 =?utf-8?B?VmIxMFdQRlY5bjBzTjlNVjlmdGpMWmJiZWI0WGdHYk04UEdBY0lBL01DLys5?=
 =?utf-8?B?UDFHeFZ0MFpuWmdLNC9rM3BaVnNqZCswT3dXeHhXUXpVVFhKTkZRS2oxTzdk?=
 =?utf-8?B?MXg0czlEZkZHUE1XUXU1emdDaVBQbXJJU3locHQ1eHBrU2pFS0ZmVHBKYjI3?=
 =?utf-8?B?U2dERHVPZEc1M21wVFVhL2ExM0RoSW9NUHB2NVZpUVNhSWF4ajdRSHE5cjNP?=
 =?utf-8?B?ZXpSNEFOeHZ4RS90QkpzcUJ6Q0RqdjEzUGQ5ejdZNnB3SjI5ZWFKSUlidWI3?=
 =?utf-8?B?dzJkdkJkOXRIN0lFcTVuQU45Q2F1TEFxdUJEQWxMVkdZOTBXclE1eStKQ3JE?=
 =?utf-8?B?QXRiZ2hpdjNDeG13ZUQ1MXd3eDNaV25tU0ZQSWxJa1drNXBscEhNRjh6cVdw?=
 =?utf-8?B?WndjdTByNHJxbnR6YVExWEozR2xDQ3IvY1Y5RmdseEZLeGJNM3l2VDZFbTcv?=
 =?utf-8?B?bklnZ2kvcVZ3aFFiM21ISXMzTVFWN0k4SloyNms1bFVRdHgvNkduZGpNTm5o?=
 =?utf-8?B?RVhVdFZVWXk3QzNjYWJJTlJYZ2kvWXZxSXJZOXo2REpZUFc3Y2UvUWhXRVFu?=
 =?utf-8?B?enBsamdNVlF2ZGtMWi8vUWxJaEo4dXA1TjI3a1FudFpKYlZJZEtFV3VDSUta?=
 =?utf-8?B?SjIrNTdQZi9nVFFYVGMvek54Y2lLdGtnd2wzVGNDQXpqNDYwa3k0OFpYYVFt?=
 =?utf-8?B?MVE2aEl4MVpZaGE3TmxVSUU5ZlVwait4L0hIRGlqeEJHc2pnNmN4UWZva29D?=
 =?utf-8?B?OXMzNHZ0UGxsYlF0dGJPR2t0dGZQVEZKRDhjSkpJY3ZFLzVpREdGMFJMTCtV?=
 =?utf-8?B?QkxMNmhQdndUV3MwY3d1ZC9xLzFnTjluU1dUVjE1cTBtazA0SFI5V2cvRUU3?=
 =?utf-8?B?ZEwxWUZFSVRvWXdTS2M3ZCtheno2WmhoNTI2SDlFNzgwOUU3Q2lZQWljUTRZ?=
 =?utf-8?B?Si80VEdoVFF3c3paNE5MUHIyTTZOd1lzb3BaRnBmZEZKQVJLQmJIcTN1QkFv?=
 =?utf-8?B?UlkyQWlyckJjN3MxaXdKa2k3dERYN0hzYXRwNXNQL0ErZ0NSTlVyMGxCaU4z?=
 =?utf-8?B?NkJCVlJIdHNIT1dVMWprYmNJaHFVR1pTdERlcVhKc1dQLzJZMGhmbWJjQU1I?=
 =?utf-8?B?TE1GLzlLd1UyRE50NE1qU1B4eWFFSzU0N2p5RHdrd0ttUGFTcURVbHFWalQy?=
 =?utf-8?B?NFNITzdlQTlvK045WGdrbUFibWFCRTlLcGVqcC9ZSG12MTBlZDhmOHpab2lo?=
 =?utf-8?B?T2M0ZGRkb2VkbDlHRXZqWE8vZXJONW0zSkZyR3dyNCtobTJnRFBVWmh2Wm9O?=
 =?utf-8?B?U0N2bGJQYmxNV0MyOTRiZ2hhMnZjQlpnbjRxSERvd21PdTdEZy9Belh4MjVJ?=
 =?utf-8?B?MThKdGs2MXRVZU11dlI2Qk9rVSt4V0pybnVQSTAzWHZHVmdDM2lNcjFxUlVS?=
 =?utf-8?B?ek9kN2VQS3c5bGVNOG9adnpZN2lsU0lRajZuV1lCK1lpek1jSURXRkZRY2h5?=
 =?utf-8?B?YXRzOEtpb1lsQ1UzOWYvNWdiOWNFQTNST3RmREUxb1BZTnhXSG8xcXFnQ0JR?=
 =?utf-8?B?OGhCMFAweU5od1Vxak43cUxVbVVRNmtMTCt6LzgyMWN1MW45MVZQVldSVXFV?=
 =?utf-8?Q?zYjTD2wq4+M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1d4NUxCVGhFbnpZSjZvdnhyUjJ3RE5LM1h1d1ZyNklmZWorTllJWTk4bW40?=
 =?utf-8?B?RWU1NFcyMFY1dkNmNy9Gdk4xTi9Yc2srTFB5NXdncEV3anlHNHN0SWZsNVRJ?=
 =?utf-8?B?K0llVnAxajd6K1FMcTRwQXVjS2ZxYlNqTXVUSlgyZWRxS0lJOS83NUFHTjk4?=
 =?utf-8?B?aTlQYkhkWnovWHR0ODRzTlI0Umt5ZVc5WmNpeUlTSUYxd2E5RGdNaTFNWk1k?=
 =?utf-8?B?ODhXMWNvUjdvUktXSzZINDhPU0FXb3hSL0R6VlhDemtUaklEdTc4aUsrcS9D?=
 =?utf-8?B?RjAvOExRWjJXakhTN3kxMS82SWFrQVEyUE1nZEtUYjIvRWpabWJwV1RrS0hp?=
 =?utf-8?B?QXJ3dHR2QlRJcGw2QTh5Y0VuU3ZkcGtIenp3bXo0Q2pJYVRBWmMvNnJDYkYw?=
 =?utf-8?B?Wk5MZ1BVVkZMbXl0VFlIRDhNZXI0cnptaDlqYU1yVk9sSmZZWlVVOVMzOGlY?=
 =?utf-8?B?MGVoYWt1UG9kVGNJYTBtOTBOL0FUVHR5SFVOQWtNMGZhT2pQdmZYVlB4TXYy?=
 =?utf-8?B?OUp4aEdiTjZpVi9PQkVqVWxrcE1JK3lrK1BjVnVDOTNSaUtSbFB2UGk2bS9S?=
 =?utf-8?B?WFpEVWtkN2lsUG5lSTIrQ2ZncFVRNDBHL3g2YzErNnFYQlJqcS9BclJ0MWxt?=
 =?utf-8?B?OTg3aDhRUzJVYmtvdVo0eDlvNWwwdG44RFJOeTRGOHpLOURjK2s4SEpEY1Vv?=
 =?utf-8?B?VXVnMkxxMW5GSVFNUTZhZ2lMeis4S2VFaFJCaElvL01wcTNsb1ZJNXZ6ckRj?=
 =?utf-8?B?UU9LQW0yMEpoeHpvTi84aFFYRWNtUUY2azFacExIeEhHQUFyZmV0VklsYkcw?=
 =?utf-8?B?cGpOd1l3d29wdmJ1NEtrMUQ2MzFYVGpOYU9XZ0JWME41cUFyMlJYbklDY0hH?=
 =?utf-8?B?WndJY2F3a0svRDZXazcvNjNKWHFUUjV4WmNBWEJRQ0JwL1dYSmYxT2QwNW1H?=
 =?utf-8?B?SlFzYUR5a1V5UWVpNnBWRHVTS0RkTWliRjJFQlpnNEoxUjRScXZMSlN4cjZn?=
 =?utf-8?B?elZXdVRRR25TNlNMMG9OSzhlV1NlRVV6QVNzMjJMQnRFbzlMSFY4YXJOR0RO?=
 =?utf-8?B?c2RPSHBJOHRYQ0EvUXNrbDlqNjRrUVBwaDIvRkQ4Qko2YTBYaW9XUXJrZjQ4?=
 =?utf-8?B?elU4MWJLdStneVJrUm9acjN3Z3RGZXFKcTBzeFRZQTFDUXExeXpleDBjU2lx?=
 =?utf-8?B?b3Z4V2x5NkpId2I5RWwrY2xlTk9MclZkUHdaaXJpSWNxQWMvakdQRlY5TVNa?=
 =?utf-8?B?aE5UK0FTVGo2M1dhU2NrZGxXdDc2T1laRklFdkZqZ09ZaDAyZVJNUGdLSC9B?=
 =?utf-8?B?YVB4ZnNZZmg5OG9EUzd3eWRSU1VxUy9jMC9mUk1BdmYycklpcC9UZXVqWi9p?=
 =?utf-8?B?Z0ovUEZmZ05XR1V5dkwvZGdnYk0reWVhcXVsK1AwcWZHdURaTVN3UWxHY2ph?=
 =?utf-8?B?dHY2eEpvcDVhQ3lxWldxaGRqbm5OZGtyamFqbm5qd29WV2lhYkdzTkppN3Yr?=
 =?utf-8?B?RmZHMEV0Yjh5czRRblhjKzhEbHFKMERjZm50aHpmUUt4SG9SY1JuMVRZSFBl?=
 =?utf-8?B?U3dUOHN3UHBDU2xRWmtpa25Oc1hSRkxtT29MZFVIUXpsdE9xZWhKZnN1QkNx?=
 =?utf-8?B?YXM4QWFEVitaODBsaHcyNzlZcDJScGVZYUpSRktWT1Mrc09QKzN3U2RYVUZ5?=
 =?utf-8?B?RGZJemN1UXVRQXV5K1RpTzI2NUtYSS9HOENSS0N1OGJzMTRqWkRWWUYwOU1x?=
 =?utf-8?B?LzQ0ZWJ4MnYxMFhkOTBGbStYT3c5UytUelE0Y2ZBZUNlUVAySnlnSk1LRnhO?=
 =?utf-8?B?b2R6TDJTLzF4OTdHaFIrb09uUnBlbFR4VUQ0TExYK1JzVWtUcm9mVXY0NDM2?=
 =?utf-8?B?cGtWdis4cFFrQURMQnRRb3BjaGY3SWFiRDdVQ3MwVjIwMHBCL1VRcm85bGpO?=
 =?utf-8?B?RDBoUzM4dG93b29ESE14ekR3bDFSWEhjQ3hrVkp1ZVlrakY2ODRtRUxXT0Vu?=
 =?utf-8?B?R1lMYXh0NVR6SFBmeHRlSitnQjFIV0dPa2ZrVHdmcU93R3RBLzM2ZXluQW1V?=
 =?utf-8?B?WndKYVBWZktWclRTWmUza0F5d1o0dWZCWVFSWC9ZZTR0emxCK3lFaGd0WUZh?=
 =?utf-8?B?amhkUUptd05ZaHcwQzJ4ZnpqdW0rSjJHSVFjN0d5eWtrMXRnanduS3VlK0lN?=
 =?utf-8?Q?bl5LrnrSBbF/WspasAWcpmqVJIfVpRz2OxDUaSsFOpdi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d33a1b5-adbc-4f94-153a-08dd67b4b0ef
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2025 13:39:51.9529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EyuGXeowYvf5rRJF0zetCvd/lFmSV9jpqFS2v6dcc8LZg26/Qx91SaPUhci1DkMlkhpvJwHY8OUWcsplLvC8Mg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6409
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

Add a basic timer device and exercise it during device probing. This
first draft is probably very questionable.

One point in particular which should IMHO receive attention: the generic
wait_on() method aims at providing similar functionality to Nouveau's
nvkm_[num]sec() macros. Since this method will be heavily used with
different conditions to test, I'd like to avoid monomorphizing it
entirely with each instance ; that's something that is achieved in
nvkm_xsec() using functions that the macros invoke.

I have tried achieving the same result in Rust using closures (kept
as-is in the current code), but they seem to be monomorphized as well.
Calling extra functions could work better, but looks also less elegant
to me, so I am really open to suggestions here.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs    |   4 +-
 drivers/gpu/nova-core/gpu.rs       |  55 +++++++++++++++-
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/regs.rs      |  11 ++++
 drivers/gpu/nova-core/timer.rs     | 132 +++++++++++++++++++++++++++++++++++++
 5 files changed, 201 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index 63c19f140fbdd65d8fccf81669ac590807cc120f..0cd23aa306e4082405f480afc0530a41131485e7 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -10,7 +10,7 @@ pub(crate) struct NovaCore {
     pub(crate) gpu: Gpu,
 }
 
-const BAR0_SIZE: usize = 8;
+const BAR0_SIZE: usize = 0x9500;
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
 
 kernel::pci_device_table!(
@@ -42,6 +42,8 @@ fn probe(pdev: &mut pci::Device, _info: &Self::IdInfo) -> Result<Pin<KBox<Self>>
             GFP_KERNEL,
         )?;
 
+        let _ = this.gpu.test_timer();
+
         Ok(this)
     }
 }
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index d96901e5c8eace1e7c57c77da7def209e8149cd3..f010d3152530b1cec032ca620e59de51a2fc1a13 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -6,8 +6,10 @@
 
 use crate::driver::Bar0;
 use crate::regs;
+use crate::timer::Timer;
 use crate::util;
 use core::fmt;
+use core::time::Duration;
 
 macro_rules! define_chipset {
     ({ $($variant:ident = $value:expr),* $(,)* }) =>
@@ -179,6 +181,7 @@ pub(crate) struct Gpu {
     /// MMIO mapping of PCI BAR 0
     bar: Devres<Bar0>,
     fw: Firmware,
+    timer: Timer,
 }
 
 impl Gpu {
@@ -194,6 +197,56 @@ pub(crate) fn new(pdev: &pci::Device, bar: Devres<Bar0>) -> Result<impl PinInit<
             spec.revision
         );
 
-        Ok(pin_init!(Self { spec, bar, fw }))
+        let timer = Timer::new();
+
+        Ok(pin_init!(Self {
+            spec,
+            bar,
+            fw,
+            timer,
+        }))
+    }
+
+    pub(crate) fn test_timer(&self) -> Result<()> {
+        pr_info!("testing timer subdev\n");
+        with_bar!(self.bar, |b| {
+            pr_info!("current timestamp: {}\n", self.timer.read(b))
+        })?;
+
+        if !matches!(
+            self.timer
+                .wait_on(&self.bar, Duration::from_millis(10), || Some(())),
+            Ok(())
+        ) {
+            pr_crit!("timer test failure\n");
+        }
+
+        let t1 = with_bar!(self.bar, |b| {
+            pr_info!("timestamp after immediate exit: {}\n", self.timer.read(b));
+            self.timer.read(b)
+        })?;
+
+        if self
+            .timer
+            .wait_on(&self.bar, Duration::from_millis(10), || Option::<()>::None)
+            != Err(ETIMEDOUT)
+        {
+            pr_crit!("timer test 2 failure\n");
+        }
+
+        let t2 = with_bar!(self.bar, |b| self.timer.read(b))?;
+        if t2 - t1 < Duration::from_millis(10) {
+            pr_crit!("timer test 3 failure\n");
+        }
+
+        with_bar!(self.bar, |b| {
+            pr_info!(
+                "timestamp after timeout: {} ({:?})\n",
+                self.timer.read(b),
+                t2 - t1
+            );
+        })?;
+
+        Ok(())
     }
 }
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 94f4778c16f6a4d046c2f799129ed0cc68df6fd4..f54dcfc66490cb6b10090ef944ac14feca9f6972 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -18,6 +18,7 @@ macro_rules! with_bar {
 mod firmware;
 mod gpu;
 mod regs;
+mod timer;
 mod util;
 
 kernel::module_pci_driver! {
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 7bfd2b575fe2184565d495012e55cd0829b0b1ad..0d06e09b1ba62d55688c633500f37d3fe1aeb30e 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -11,3 +11,14 @@
     7:4     major_rev => as u8, "major revision of the chip";
     28:20   chipset => try_into Chipset, "chipset model"
 );
+
+/* PTIMER */
+
+register!(PtimerTime0@0x00009400;
+    31:0    lo => as u32, "low 32-bits of the timer"
+);
+
+register!(PtimerTime1@0x00009410;
+    31:0    hi => as u32, "high 32 bits of the timer"
+);
+
diff --git a/drivers/gpu/nova-core/timer.rs b/drivers/gpu/nova-core/timer.rs
new file mode 100644
index 0000000000000000000000000000000000000000..1361e4ad10d923ce114972889cdfcfa6e58a691b
--- /dev/null
+++ b/drivers/gpu/nova-core/timer.rs
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Nova Core Timer subdevice
+
+use core::fmt::Display;
+use core::ops::{Add, Sub};
+use core::time::Duration;
+
+use kernel::devres::Devres;
+use kernel::num::U64Ext;
+use kernel::prelude::*;
+
+use crate::driver::Bar0;
+use crate::regs;
+
+/// A timestamp with nanosecond granularity obtained from the GPU timer.
+///
+/// A timestamp can also be substracted to another in order to obtain a [`Duration`].
+///
+/// TODO: add Kunit tests!
+#[derive(Debug, Copy, Clone, PartialEq, Eq, PartialOrd, Ord)]
+pub(crate) struct Timestamp(u64);
+
+impl Display for Timestamp {
+    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
+        write!(f, "{}", self.0)
+    }
+}
+
+impl Add<Duration> for Timestamp {
+    type Output = Self;
+
+    fn add(mut self, rhs: Duration) -> Self::Output {
+        let mut nanos = rhs.as_nanos();
+        while nanos > u64::MAX as u128 {
+            self.0 = self.0.wrapping_add(nanos as u64);
+            nanos -= u64::MAX as u128;
+        }
+
+        Timestamp(self.0.wrapping_add(nanos as u64))
+    }
+}
+
+impl Sub for Timestamp {
+    type Output = Duration;
+
+    fn sub(self, rhs: Self) -> Self::Output {
+        Duration::from_nanos(self.0.wrapping_sub(rhs.0))
+    }
+}
+
+pub(crate) struct Timer {}
+
+impl Timer {
+    pub(crate) fn new() -> Self {
+        Self {}
+    }
+
+    /// Read the current timer timestamp.
+    pub(crate) fn read(&self, bar: &Bar0) -> Timestamp {
+        loop {
+            let hi = regs::PtimerTime1::read(bar);
+            let lo = regs::PtimerTime0::read(bar);
+
+            if hi.hi() == regs::PtimerTime1::read(bar).hi() {
+                return Timestamp(u64::from_u32s(hi.hi(), lo.lo()));
+            }
+        }
+    }
+
+    #[allow(dead_code)]
+    pub(crate) fn time(bar: &Bar0, time: u64) {
+        regs::PtimerTime1::default()
+            .set_hi(time.upper_32_bits())
+            .write(bar);
+        regs::PtimerTime0::default()
+            .set_lo(time.lower_32_bits())
+            .write(bar);
+    }
+
+    /// Wait until `cond` is true or `timeout` elapsed, based on GPU time.
+    ///
+    /// When `cond` evaluates to `Some`, its return value is returned.
+    ///
+    /// `Err(ETIMEDOUT)` is returned if `timeout` has been reached without `cond` evaluating to
+    /// `Some`, or if the timer device is stuck for some reason.
+    pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(
+        &self,
+        bar: &Devres<Bar0>,
+        timeout: Duration,
+        cond: F,
+    ) -> Result<R> {
+        // Number of consecutive time reads after which we consider the timer frozen if it hasn't
+        // moved forward.
+        const MAX_STALLED_READS: usize = 16;
+
+        let (mut cur_time, mut prev_time, deadline) = {
+            let cur_time = with_bar!(bar, |b| self.read(b))?;
+            let deadline = cur_time + timeout;
+
+            (cur_time, cur_time, deadline)
+        };
+        let mut num_reads = 0;
+
+        loop {
+            if let Some(ret) = cond() {
+                return Ok(ret);
+            }
+
+            (|| {
+                cur_time = with_bar!(bar, |b| self.read(b))?;
+
+                /* Check if the timer is frozen for some reason. */
+                if cur_time == prev_time {
+                    if num_reads >= MAX_STALLED_READS {
+                        return Err(ETIMEDOUT);
+                    }
+                    num_reads += 1;
+                } else {
+                    if cur_time >= deadline {
+                        return Err(ETIMEDOUT);
+                    }
+
+                    num_reads = 0;
+                    prev_time = cur_time;
+                }
+
+                Ok(())
+            })()?;
+        }
+    }
+}

-- 
2.48.1

