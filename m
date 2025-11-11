Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0814C50141
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 00:40:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6DCE10E666;
	Tue, 11 Nov 2025 23:39:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MCYpMAeo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010071.outbound.protection.outlook.com [52.101.56.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA7D10E03F;
 Tue, 11 Nov 2025 23:39:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CDhSDFLgVdbmrZir59hSyNGFPf5yyReZEBK0KXT/xLY6uxSrE1HSdXaUnwAa0SG/qxF3j2P1F0CMe2tbBAyzSDysXTwPtzojybr5d8dJKUZmpadNY3NpAeXXYq5ubUz0o41Qxp3d1MPI/cb200LLIXcBy9RO0rwNdCNOQtO7zUry/hYXJJGgUMuiIGBRPGMeZFH20CGti9pDyFu8tcdFpJEGC5EzEb7Y5RSfG94jugr/p8obGmTXC1GTdjA68dRsVTXbBQpy6q85DuGbdJC24ySvO+m55oASIDjPW2iNFHpaWwxHjsfEB506bGPH0Roto7YXY5HaVNj2JOHZr1AYZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=doQmGepDE5ODciBYYMzwYb/i4jr8ZRieFvq2sYStg6o=;
 b=sUqVBovQEoD0hQWJ+wb+3vcMv4Y9yPtGsiHiDF/vq7qDTk9WQ/iXP2I2zkOSuKqK+XzKHmq/DpVKG4bb49G+q5qPY8gtWsp5/7vS61l6M6QrwD8cM0HTnAcJwR7YYnu/6aLscZhs3CkNLLkzfk8D2lxOSzJ1nsr476z3oguEa8EZPye88/lEwiJ90Aq21A8Sm3ric+SYCC6befIlIBDNlEpgj2/Xi49Wi4uHhp2npKitWbALLsUp2YKv8VqKj1fopKJ1Gaf0BaPjcNQKOFYtHY0RBNHiI/tM6oV2JmvKIOULXYaH3wmfmhcATBMHUuFwaDj8v92oyREH3WHSRx54wA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=doQmGepDE5ODciBYYMzwYb/i4jr8ZRieFvq2sYStg6o=;
 b=MCYpMAeoaIA/aTlhsGr4kWX5l/5AljNWkubFnV7TLFr4HzyUULndxq1UO/py4NS8YA6cxUPBqnCVBRSeX5tYwgnreNF+VeoPdgRH+9C0ZlMvJqX+mQl+2ZhEMnOMKbUlpbOyi+YA6CuMfgrRSKu5ZzSvmEZEb8iwk7nxB/rwDOJCYIeWiuVVE6pcUSTCB2/QlxyiCEfrRhvMcgZuA51M2wjve0H6N+draxHTmin0vHx1QLUqpnQ65Y0Kqt1oXctZT+YNTGO0y9PM5hHdeLuTCvqinSNgInXkPmA3cFR9stkSlvwNIBDpxlMXSKnnNAnYrfmNhBf2QXEwngnY65DUtA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB6836.namprd12.prod.outlook.com (2603:10b6:510:1b6::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 23:39:51 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 23:39:51 +0000
Message-ID: <df29302c-c872-4740-868a-8a6628394f39@nvidia.com>
Date: Tue, 11 Nov 2025 18:39:48 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 08/12] nova-core: sequencer: Add register opcodes
To: Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, nouveau@lists.freedesktop.org,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
 <20251102235920.3784592-9-joelagnelf@nvidia.com>
 <DE52APJTD9NN.A41RA78NMNIE@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DE52APJTD9NN.A41RA78NMNIE@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0150.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::35) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB6836:EE_
X-MS-Office365-Filtering-Correlation-Id: 1550ad44-4ca2-47a5-be17-08de217b9bd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RnBmVHpibFFzdWs2SE9mZ05xdGordWZaRU9ybk9UUXVWQUl5YjFDT3RsbjJV?=
 =?utf-8?B?Yk9ZSk03aHBYTXk4bFdzZ3BCSlFwS2tVUm9WRVYvNEoyN200UVZhU2I4VFI3?=
 =?utf-8?B?N1l1MGhBUHlvZzVHMTZwdWVZVWVaN2I0SnRUWUNDWW4vd2ZnNTVRU0E2WG13?=
 =?utf-8?B?WTZJY0lJd3VZRTBPYnFzczR0a0ZLNjZZbytEVlJ5N0Z4TnR1Sk92bHN1RWx1?=
 =?utf-8?B?QmVBUElvcmxCemxDcXB5QTA2ZE52S0tTRFloR2M0ZS8vbm9Va2s1ODRVU0FU?=
 =?utf-8?B?U3d0K2JMaDBTZkdWbmVOdW9wQkRMYmo1M3VadmFMNkRSOXQ3Vy9DL0gvT0lm?=
 =?utf-8?B?aEJhZE1kaUI4RnFQOVRxemJFMUF1ZVJLZHFybDVlMng4M2Rlb3RkbVNWSzdJ?=
 =?utf-8?B?dXpDSU00M281VmpDT2J3YlpDVEQ2Ymw1ejRvTjIrRlRJMjFxenl2c0htdzhp?=
 =?utf-8?B?MlExa0ltN1lnV1RPUVNWclVha2VsM2l6Ym5HT2VGUUdpbU8rT2cyVVZ0R3ky?=
 =?utf-8?B?azg3dmd4OE4wandqNE9DRzdGNkZaOHIzYmRwSWVkVW9VbEMvWnBQeWVveklX?=
 =?utf-8?B?S0htVC9EYzNZamxxL3oxclFBYnE1Q3dXbkRhQVF5WHE5ODY3dkt1SGxXdVg1?=
 =?utf-8?B?TUVBSEtWeVExeG1XaGNJdFowcFpEVXl5Sk1GeThoUit0RGpob0RCM2NrYlFo?=
 =?utf-8?B?Q2hTRE1jdlhLSUFjbytSWHlYVGRXdkIrWXNyZnd3YVdiRDNCNWlGS3JxVEl4?=
 =?utf-8?B?R0xvMlVhMDIzb0NnNzVGSjFmTE9peG5rTnZiZUF4VmkyVkNDMDVWZG9oQXND?=
 =?utf-8?B?NkQwaGYzUkVUSHVsL1l2UzVLUXJ6U2ZacE92dG1VQmNBK3JyZjYrRGVvb212?=
 =?utf-8?B?YndDNVJvNnRwaW1RN2tnSnh2bE41cmFWcnpLWGhEUXR6cGdYQkZBOXdQYnJN?=
 =?utf-8?B?YUh6bG42TXYxNEVIeGsvbmdvNlFkaU1hQkRiV1czamt6TG9BMnliTFg0WXUw?=
 =?utf-8?B?TWg0SlVKdElYQ05LOU5Hdlp3VmlGaDRYZXVvWTlINE1EQ1pqRHVyU0ppaXNB?=
 =?utf-8?B?bTQ5M1VFSWJuQ213VTlkbUJzQ09oOEJzdy94RFdrQ3R5VnhZR2JEQllYMkFW?=
 =?utf-8?B?ekdJMW82K0RyN0huTkVXVWhjdlg1c0hOVW9qOVlTdXpDQ1BqQ1RNMXFsSDdn?=
 =?utf-8?B?SlRWVEh2VDA2M0RTTHM3UmVlaFZzZjZhQm9TcjR6ZHFLQnBDWHBnQ285NEtF?=
 =?utf-8?B?MXBzZWVQZzJZSnBqa3RRRjZLRmZKL3I0VWNTTFBuR3VZY0kxTVpKK0E3eXl5?=
 =?utf-8?B?Lzc2VE5NUTFOT05kUjVVbFhSMFJyZmJueENSdlVIcTM2RjRGTS93SjNOWHZt?=
 =?utf-8?B?cit5UVJldkc0N0RqRUxnVkR1b3o2cCtmc2JCd1dEMzcxck4weXZzeUNrWXFj?=
 =?utf-8?B?eGlMNExsTEdHQWRzZ3BVSkNLTUVENTRYTitrdU5RZllRaUZubmhBRUxjQ0x3?=
 =?utf-8?B?cUhadXVucHF1MTFXdkpEZkdhTEJQejZ2THAxN1NWYlZuM1IvWk53dEluT3NL?=
 =?utf-8?B?WTFmTkdvckxJcm9pTkRKZVZhRkVXTFRrZU5BeklsMmhxMFl5bStUL1BnZS9P?=
 =?utf-8?B?RkRvTU5BTWVHekl2dXBvV0YrQjIwR1p2akxqZE51cFhmTkRZUnZmZDdIQ1Y1?=
 =?utf-8?B?cjhYc29BeC9YZloyQlhvNEtJcUJMOEpUZ2swNnZaSXlPRGN2c2h3czhTSDN2?=
 =?utf-8?B?T1IxMUU0NjYyZVZKRXZxT0FZdjBndU9vRVBQSFRvMjQxVGpCVFd0TVdGRTZJ?=
 =?utf-8?B?dmJUMno4ZTMvRmN3WW40TEFBYXlGUnZyaE96cVN4YlZ0UkNFaDZraGFDQU1H?=
 =?utf-8?B?TTRPMStDKzRGVmgrVFUzdElwRktSb2duMm1Ua01kdlp0emhjNndNREFTZzho?=
 =?utf-8?Q?mw6216x8ny337HAap0/ZYhOPL92l8FTN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Vm5ienU5ZGliRmhFcGJXYWszeHkvRkVleHhrUWNvV0RoamVCNWhkdXQ2dnpE?=
 =?utf-8?B?M3psY0dBV0pHcmRBRGtqY2N1WlRaUnU0bXc5bStZS2Ira2xpWVkzdzkwWm5p?=
 =?utf-8?B?ODRLRHllZS9pY0I2UVBnZmxoUVVRd2hHYnR0bkQxbXBXL3VMVXlXWWFIa2xi?=
 =?utf-8?B?bVR5dUwvbHNFMlhidlg1eEo2ZThEMXhZeVVLbTU1ZkRFVjBERlVJSW1va25Z?=
 =?utf-8?B?cWpteTVodEJxUkhrMjhad3FlN0MvQ2NndVQwMGUrWlZPRk9GZXBwck9CN1Mv?=
 =?utf-8?B?V091aUVoQkptY1lKUW5qLzR0Y0dWVGRubU5KcFdmek43N3pRc2hpVk8rZ0kr?=
 =?utf-8?B?UGtYeGxMSDRkbGQwekZsTzF1cVFoTUtRSU9mcEcrVHlScXVKZnpqWmxqYjdO?=
 =?utf-8?B?YWR0dW1Yc0tFTGZ2K1dSMEhFSHRJV0lmK0ZESE5DQS9FNnU2RVdTNlRSQmhC?=
 =?utf-8?B?RUYxMzRSeUZoRGhoeVZNVDNsWVYxZHFqQTF2RjZCWndMcDRmdHhaYXFUUlBk?=
 =?utf-8?B?RHAwSm5hd0ladTlaalRmbFdrNSt6MWlzMUVtN3h2QklDYXBMMXh4dFZIOWpI?=
 =?utf-8?B?M3RHdGt3bDJPYzV5ZzZEaGNNQ2YzMXBnNlhKeWdTdmRpdW85Yk9nZ2x2Nmgx?=
 =?utf-8?B?eFpNaklCb2tjQlJiM0FFQWJ3bU82NUdvMWV3am9ybzFNeHFaZE1IallEV2Fj?=
 =?utf-8?B?Nm1EQkJMdmtCOWR6WFgyR1hQRWdDVWsrdkEyQ2VtcHNjYUgxRlpua214OXpC?=
 =?utf-8?B?d01xaXAxUEtEU3Z0bXRDUllhNDJWbkxzMmNVVnU2eUZyQUxxdTAwZHdBTzNw?=
 =?utf-8?B?WWErOVRhZGI3RlhtTnpZNC9ONGhWWEZ6Zk91aUtKN3A2ME11WU16U3dMb0Jp?=
 =?utf-8?B?TFNydUNmejRyNWtHNTZEM2FLM2YxTmNoWjc0R0ErV1dpeC9SYlFBRHphQjQ2?=
 =?utf-8?B?RlBlbjhxNXllTXlVQ2tSbXhHd1VTbElTd3QwdFJ2V1dPTHZZdHh2elRVSHhL?=
 =?utf-8?B?UU0xTUN6dGxDVWRDUms5TjVxOXEzd25KSk1MU2t2eWp5SmYrcUxFM3JMdUtI?=
 =?utf-8?B?QnZCVTBQZFBKU3psb1BYdCs2NkVQbG9paG5DZEtFd2tHa0hrSmhJVUVPdVAw?=
 =?utf-8?B?V2llWjdyQmx5QnFRbEhFblB1UEhlbjNPRjFhNHpJWnYzRkJ5VjQ2UEZDSHNN?=
 =?utf-8?B?M2kwL1RLUWRCOU45eU92azloWWt5K3AxcGdYaTN6TE1JVnJsOE9SZjMwRDdZ?=
 =?utf-8?B?dzhPNlBxUkxyUWVmT0FLMkV0L3JEUHlUUGI0bWRiSlhDMmJaaWUyRE5ZaUIz?=
 =?utf-8?B?U3hTWmEvaExuRkJ4aFgybHBFZlNVc0dIenJzVDh5bjRBdmdvNTlqUkRIc1pP?=
 =?utf-8?B?REZOZ29yZDVpbmJyREMxNEFoeVcyS0RkUElnUmliNzgyeFdxUS90L0dENVlj?=
 =?utf-8?B?ODB6aUM1Qk55aVl4am5jbGtxM0dDNnErY0wydHh6ZEkrZ0hBUWVDait3dExT?=
 =?utf-8?B?VE9NWUdZYW4rNXdlSnJvTkgvVjBlWW9DN1ExeWcwcFI0bGdLQVpkN0s3RDdT?=
 =?utf-8?B?cTFwdUE2Z2k4Z3NaSXBpNjBWdGU1ZllLb1ltbDBFZ3EzRDZkWm5ETkFkelpa?=
 =?utf-8?B?aUp2eHVOS2JDWjlPdEtuVE5pVitOdUJzVjY3cTJKdHFkUEh6QjZkSHNNL2dX?=
 =?utf-8?B?cmNKR01EZmNDT0hManBsclA5SjRaTjRDWXp2YUZCRkJmZXJPMUpVTWhyUFF3?=
 =?utf-8?B?NWRRTHY3MUpXN1ZrLzkrSldpakFlS0pnS2w0ZmpnejVOb3BldlcrTmhERE8w?=
 =?utf-8?B?R3dDN04xMVRqTUlsYkZLbmZqeGdWMjBhaHowQVhmUXlrVkw3TlppejhmcVBs?=
 =?utf-8?B?dTV4WC9Jb05sTENHNDdDZE1iUVVQM2tJcGZVZWE1YU9TaTM3aVU4RkhuQmhw?=
 =?utf-8?B?Mk4wcDlXMW1HVjVpd0d1emtjeldvWEV1YkdFZHE4UGl2cXR6ZEZGYkhmcFRV?=
 =?utf-8?B?UkNSYTIwQ25sbitKR0E2NEFIbUFzUDMwQm9rOUhxc0FndDBudlNyNnNKOFFG?=
 =?utf-8?B?YUFEVU9wK0ZMci9ITEtGdUF4Y0pQNFRicDgwM1JobEN0UUZCSTNwcURxd2xE?=
 =?utf-8?B?MWZsTE45cHhlL3BNTTc0N1B0MWRmd0RYRmhyQ3pUZGtRTitEVlIvZDBmbjVJ?=
 =?utf-8?B?TWc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1550ad44-4ca2-47a5-be17-08de217b9bd8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 23:39:51.5526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZpMx7pff0dMCGd6gjPzDSsBTaa0BTCJew29tMihW4cXJsaVlooVj9xcORbEoDSvdyPRhXXO+IEWgErDFCYJC6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6836
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

On 11/10/2025 8:50 AM, Alexandre Courbot wrote:
[...]
>> +
>> +        // First read.
>> +        sequencer.bar.try_read32(addr)?;
>> +
>> +        // Poll the requested register with requested timeout.
>> +        read_poll_timeout(
>> +            || sequencer.bar.try_read32(addr),
>> +            |current| (current & self.mask) == self.val,
>> +            Delta::ZERO,
>> +            Delta::from_micros(timeout_us),
>> +        )
>> +        .map(|_| ())
>> +    }
>> +}
>> +
>> +impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE {
>> +    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
>> +        let addr = self.addr as usize;
>> +        let _index = self.index;
>> +
>> +        let val = sequencer.bar.try_read32(addr)?;
>> +
>> +        dev_dbg!(
>> +            sequencer.dev,
>> +            "RegStore: addr=0x{:x}, index=0x{:x}, value={:?}\n",
>> +            self.addr,
>> +            self.index,
>> +            val
>> +        );
>> +
>> +        Ok(())
>> +    }
>> +}
>> +
>> +impl GspSeqCmdRunner for GspSeqCmd {
>> +    fn run(&self, seq: &GspSequencer<'_>) -> Result {
>> +        match self {
>> +            GspSeqCmd::RegWrite(cmd) => cmd.run(seq),
>> +            GspSeqCmd::RegModify(cmd) => cmd.run(seq),
>> +            GspSeqCmd::RegPoll(cmd) => cmd.run(seq),
>> +            GspSeqCmd::RegStore(cmd) => cmd.run(seq),
>> +        }
>> +    }
>> +}
> 
> This makes me wonder: do we need to store the deserialized version of
> these operands, and make a second `match` on them? How about passing the
> `bar` to the deserialization command and have it run the operand
> immediately?

I don't think a match could be avoided here because of Rust enums (cannot call a
method on the inner object of an enum without matching it first). The first
match is to construct the enum by matching on the opcode, the second match is to
run it by matching on the enum type.

Sorry if I missed something about your suggestion but I suggest lets do that
kind of refactor after the initial merge, since this code has been working and
tested for some time.

In hindsight, I probably would have tried to not use enums and my feeling is we
can probably get rid of it eventually and do this kind of function delegation
more ergonomically.

Thanks.

