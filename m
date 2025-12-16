Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69D36CC0FA1
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 06:13:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B708410E6C3;
	Tue, 16 Dec 2025 05:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mhemXAPa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012011.outbound.protection.outlook.com [40.107.209.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2160B10E6C3;
 Tue, 16 Dec 2025 05:13:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BfiGZl3qvsAxxvTz1yZRY6dg16++1mzZJ0TIVnjYN3zJFiXmZfRZ7UX3+qRwBg1ZhJ/jDiZz2Dk8rY+JmyPC3o5UOXlBmHabKQ63auVWRZwSGOrQG5JRe8NLhSQ4Z5DjKsLFLVKS9uYePAAp+L4j8PtII8bJQvdKhs2VRS2CmhPN2L9Z1fyjVTAUCgbZYWzu2McnQZwqUTBzg6RCoNFthiPr7Ywj6fVKsmvOB+rQaoBhd8ggmXope/jkw6eTwR+uMnwmFvhs8yzh9apoQM8hSK2cHwrq+YDWEgQMohqa2nS7oSpBODBXlAZ9od6lMwfWq+uO7wYcWSpPoMoWSRPS0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9fkVGuSGwC2afFu7iwk/DAQsxx8L7wJfObcQ3xOvu88=;
 b=mMqo4WDxzjx0PZEQY4SOQrJmOuWM+SdHWCzKtFiIMnMZEhZjg2buk+94yZjrwovcMigmttxUkO6c9Xd8aYfKBVAEGKNg4qnuuNzC0vzKyFPPwtJIG5fYAVsYDIfmximDnV0x0l9bf4MEvg7ZsiGyS+lQcNfC9wDjFNr/O0+RrCj9yIUSJHRdtQEj535mygpBzrFJUkK/hJ7Ey3+bGUqvsx96lghEjoQclFGVjV0vZyx7Mumh5WBiGNJq6W9D6sVbEWmR0P2tu76Fzw5+CdT5e6hryCZgExHGvZldAHyedD8r/OC80MojeULzrGkvLSjWBBW0v60hs6ythH5INMik/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9fkVGuSGwC2afFu7iwk/DAQsxx8L7wJfObcQ3xOvu88=;
 b=mhemXAPa9pqDQ8KAERlV5A/XnnwmVrFTPl5D0uV9rJfg7mnQglWJRCxVV6k5Yi7RxoICdeO9Xk7TyjcMgB4pYXwAUIEsQH3RBscsY2kpTJUo+ANwd5+oY/sYzT7GqdVz9Y2HP9KgnQRT35Y9zifq6EqDhFGwG0FvNGQOZvXoASadRxlMEConTeVKnP9S2Ig7NeEnr0LucdTmrvay7+jjeq9I1088MLWq/pvMi1isg/R5zNu56yc6Xd2RKy9wPHzUKJu5zrzR7wXjZ/m0ZtwTx9Qy2kp+epnOJNf2IQPXNxcGSFbfQ+VXcgjYJplxljLvqGPg7EcFdZ7pSx/DkTmHkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8816.namprd12.prod.outlook.com (2603:10b6:8:14f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 05:13:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 05:13:50 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 16 Dec 2025 14:13:31 +0900
Subject: [PATCH 5/7] gpu: nova-nova: use pin-init projections
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-nova-unload-v1-5-6a5d823be19d@nvidia.com>
References: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
In-Reply-To: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0228.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8816:EE_
X-MS-Office365-Filtering-Correlation-Id: bcc90c90-0584-4dba-ba23-08de3c61e656
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a0xOQmlaRTJoaDNITHJwM1JleXorcmlJRkd4bFpEWWNBaUl0c0RPNVBreVpG?=
 =?utf-8?B?ZTdNUk1GdjIySXJDbmdBd2I1RTNmdlpmSFdSd21TRWFKVG83Mi9NeVNqaUhJ?=
 =?utf-8?B?Uk0yQUsrM1JrcGpGSE14eTlPZVJuaVJIc2ZHNDBKSEtDZFU3bzFIa2xNakdY?=
 =?utf-8?B?cXhqR2Z3MVRBc0pEZlB3c2tKbVg5YmhSUHB2OHd6MXZDUkpIc2hLS2MyL0c1?=
 =?utf-8?B?dlp3N2ZSb3BwblBDOFExWTU3NEo0SDNzb2JBMzJhcXlXMkFlTGU2N29IR0R4?=
 =?utf-8?B?UnQyTm1oelhGaDVKdk0zN01DYWR3eE04SGNQSm96TVVHejZSVmlPVW5ucFUv?=
 =?utf-8?B?L3hReEsxam5HWGZiYjF2NUZtMUJwaHdLOTZXTktwS2ZuOVNhQnhGRkpubzFY?=
 =?utf-8?B?c2JEQVpNUHlYMXE2VDJ5ZlFheGN5RnBPWHN3Uk0yQzNSVmk5Z1lLT09pRHhQ?=
 =?utf-8?B?U2NyVXI3cFJWbHFIQS9DUkdxM0laYTQ5MnZQZnA1V3JDSTZRRmtoUGdPZElF?=
 =?utf-8?B?VjlJaElWdVY1dzU1cURTZlNIdDIrMkVHVVY4d05NNlZKS3ZZNHExWFJqZWtm?=
 =?utf-8?B?bldkR0MybVJzM0NiVVo5MEJVcTFBdmh0d0dROHBxSE5KeEtGdm8vNkEzK1VV?=
 =?utf-8?B?eGZ5eHIwN2tsUXcrLzNtUUM1ZG8vODN5dzR2bzBrWDFXR0NiNFNtZUFzdi9q?=
 =?utf-8?B?NjFLVjdOaVc3TmZQSktOWjNsZE5ROWliVXplV2JxOVhncG5tV3Qwd3RJbG92?=
 =?utf-8?B?a0Z6SE1OTERCQlRZNjFLOFUzUS9KU1hWR0VTbXcyQU1KUVYwMGxCRXZZdm1D?=
 =?utf-8?B?ZzZZZjhSb0w3TFA1SWtiYlFPcWxyUnB5bi9nTnA3a2JxRjVLQk5Qd0YvekxH?=
 =?utf-8?B?NTA0TzF3QjhUblBpMTBGNUhYRU5NeWxSR0Z5T2xnL1NZV0JCRWlxRTIvdE1X?=
 =?utf-8?B?dm1JQWsyUXFFNVlON1FPWFdNNjVaUHFZRWFvWXk1blJTdzNSek5wVXV6cmFR?=
 =?utf-8?B?VytGYTFubW0wZ1pvVC95a2k5STlqa2FHZlVVdG9ubHkrelFablJrTGo0eHRv?=
 =?utf-8?B?Q0hkcHhQQWtoeEdrMWNKOS93WkNSdDdzK3pNMXpOcG42bUdTWnZIZWt4Mm1S?=
 =?utf-8?B?dzkreDRLTFBKZ2NoWlY3ZTh1RTFuMnZWWVJKY1Axei90YVM0ZG13T2xEaGdh?=
 =?utf-8?B?SFNJa2NTcjZ2aVBrbjhFVU52UWF3YWJJV1c3QUs2cXd3RmplYjZyalIzUTMx?=
 =?utf-8?B?b2hCNWVQM1FVRmYrTDFiSHhDN1VZTEdUbnhlL01KazRRWmJmcGYreEtkc1hQ?=
 =?utf-8?B?dFBHdHhaMWZZNUVya3NtcTgwWW1QdDlvSHc5ZHIyOHdsZ1ltS2xhU3AzTTRj?=
 =?utf-8?B?a3czK0wvdkoxNHg4eFlqaVNONlZGamROS0RBdFdkaDhOZjM2OHZ1NlZFZVdw?=
 =?utf-8?B?Vjdna3A4aUZFR1I4QzNCZlp0TC9tVnE3QkNMVExON3JWaFZtQTRHOGdFbm13?=
 =?utf-8?B?VkNIRTVMdk1rOURpRDl4bWFpbWFueXo2WnR0YmdZWXJFRDlKc2ROMTlpWk5F?=
 =?utf-8?B?SDE4Q2xaVCs4UWZmRno2MEEwV0IrcEtYT2xwb29yMFRlTzhSZ2Z3dk53WFBq?=
 =?utf-8?B?VWJZQTJpVERHck91Tk1CclRsSVRhRE9OeXNrMmpicmgvQWNqV2VlRS9WOGFY?=
 =?utf-8?B?R2dCSmdwbnhhMTVnejMwMlArdzFZZXRUS2diVkhaNC9qZDBSTkxJVVBYdzJy?=
 =?utf-8?B?OXB5cnBnQTc4amMwYU5XR1RZb2FGMUh2THpsbGpvZDh4cmJwd0swTEFQQVFj?=
 =?utf-8?B?VFlUMkxqdnZJNWtwNWE1MUFBUno1Ny8wamlhd0lsQ3ZNTkNTWnp6c2FqVlk0?=
 =?utf-8?B?N09OMkhkMnBqaDR0TVAxd3hWR2NWZGlQNVVNcFBoN2N0eWVJOUVHUFppWTZZ?=
 =?utf-8?B?clI1YUlvMnRaTGdsc1A0TG03ZU94KzArQm03djQ5Rm80bi9TUndwRkhTKzBP?=
 =?utf-8?Q?zOJPGWegK0rqRG19oh8a6/60yRLvKs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(7416014)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dnAvMjNJUWdaU3JGNXJFcDhQNFhqWmVPdXZiK211RmxkSUxRb0R3Z3NiV0Ju?=
 =?utf-8?B?VEg1eE5NNzMwVDZyMGN3NTc3WnJXSjdIbkZnUUcwckVBN1dTYWpuanljYXZs?=
 =?utf-8?B?U2JGOUxBSEIwbkJuZ3psdVZ5K1FjRHJsbXdwRCtRQ3pNS1BLSlh5KzRZOVlU?=
 =?utf-8?B?TnI0U2N0REFmY1hOYzlleHBpS2wza2h6RkRCR0k0ZmJrTmlYbDVoTTNzaFhF?=
 =?utf-8?B?ZmRzMVlsYjRIdWw4cThzNmp5ZVpHcVYvSzdBNkptYjlSZVRPOGxBUzRwZWxh?=
 =?utf-8?B?aVYzcllRU2NUV2RiaXhXdlMyK2oySk1jbEhsbFJyRzhZSFdZbzlaTnE3bEtl?=
 =?utf-8?B?MzNoN1BVcGVDZG1FVFVud2NhWElyem1hMkN3WFN5czNRWGRpMnhaNy8zZmVQ?=
 =?utf-8?B?ZktFTXdlOWxwNHI0Nm02RGVzUjBHNzllMjBCUGRVTXFWeDc5dy9DRFNiaUFu?=
 =?utf-8?B?QXZ6SDZ3ZTJYem5nUWZ3QUxRcUhFQ3hqWVdWK1MxbmZycndFcS9uRjVXaEZx?=
 =?utf-8?B?b1lRSW1RT2VkdWx1QmlpdEJuUUd1L0pveEdCMCtOZUVIN05YNWxSU1JkUytt?=
 =?utf-8?B?Qm1xWk83VXZiWTlKdFhrM1dPcnRTTldYbUk1Ukc0M1oyaUtHZC91bUJMb25w?=
 =?utf-8?B?WXF3ZW85RW15WlZaMlUreUhORmE0eC9wcHc2anJxZHMvaEdlM20wc3BCdnZO?=
 =?utf-8?B?cTlsTTE4cFVoZzBoZVZjS0htU3kwWHlnY3JFZDNTZzRhMDk4RjZYcmthcjdm?=
 =?utf-8?B?aG5VYUNVeHZRcHVCeG9nODUyWGRML0dIaVUrd0t2Vi9kS1pLUFpra0trbDV6?=
 =?utf-8?B?TWQwVXFLai8rQmp5TjJXSTBBNi8xaUdlMDQ2SVZjbVdYK0tZdEIyWkRoYnpl?=
 =?utf-8?B?SlF4OTdDMlpUaVkzSjc1QllkRUp2dysvTE9DbnJ2SnNkcGNNVVhlWVZRc3Uy?=
 =?utf-8?B?RDh0cm9XZWJMRkZoTFlkd1dSSXVRc3JMRmRWb2ZWcFRNSllkYkpCT1FaYWtT?=
 =?utf-8?B?YTVITGF4aGFyR1l6a2NYSU9qN1JaUE1ETjFta0hRN2xOL3M4ZmNDU1RJek1U?=
 =?utf-8?B?Y2dKOW1zWWp2ZmRHenBwSnFzQmZKdHlTbEhETWp5MFRiOERVeTFmanZ2ZVor?=
 =?utf-8?B?WCtndU5RQk94NkpnT2kxdmtiVDBlUFplY1Z2eThpbmxNaFFReW9wbi9TaGYy?=
 =?utf-8?B?SHRXN3VxUFo0K3JVVi9xL0FSN2NGMXZRb1V3b3dLZzk5ZDJCVVBibHczYytK?=
 =?utf-8?B?MHVhZ2tCREJlc0FQM2tLOWlXb1lhN0o4cHdYNEp1SlpJOTFFWVVUTEUyKzNa?=
 =?utf-8?B?elpUc29yUjJhYnRrT1pnblY5dHFjYkVUSFNKWitmV044L2gyQzE0MHBkZGZJ?=
 =?utf-8?B?dUhudFBJeGN5NlpESmtZSUlPWGVuQkM1eXFwWW1aRmsvTksvcmxtRzBZOG04?=
 =?utf-8?B?S3lQa3hIQkQ2UWxQQ2hjMktpd3JOK1hLSkNzMHJSOWJZV3NOU1l4UTZLRkNn?=
 =?utf-8?B?djl4Q2QvU2NpSmZMdHorZUhMcHJWRTBJZWpxVURmN1pnQVB2VENZWWxXeXlP?=
 =?utf-8?B?ZFBPVElEaUxVeG1RbE5vOUJpOUpQb2pNUGY3cUxsY1plOE5QVVpGb1JjMXBo?=
 =?utf-8?B?R1hud09tT1p5M2xZYmN6SmdRYWRDZUNWWU5BQ1VCUE9SdEhMazkrai85MUNs?=
 =?utf-8?B?VTdFck9rU0RhV1VmU25BR0RyRnhVQ296UTRtemsweDJNbE5LNnlXWDg5ZGZQ?=
 =?utf-8?B?T2lDT055NVFjYjNTZllIQ0Fsc0lJcUJzeVJTNm4vMjlYbWRCb2RuelNWU3ZT?=
 =?utf-8?B?U1IyWXRWVEl2d0Fpc3NtYzJpZ1RKYmpyOC9UNUtycGpUTG5ZRnA0eHRpdjdh?=
 =?utf-8?B?cHU0dG5QalpDeUpTYmpXaHBFa2FraGRrSldwTUZ6OWRHTWFrcjlnbnBuYXBs?=
 =?utf-8?B?QU53a0ttNi94R3M4NzY0NFprMTI2OVhEaitrMDNtcGpCRkY0R1lEcE1MSTNw?=
 =?utf-8?B?azk2aU1vOC9xaVFFQWp2dXdwajJzNlBSU3I1NWw5d1A0OVZPcmEvbDRNTE9m?=
 =?utf-8?B?SnFVWXRsajZIbXpVSFZNSnFLV1Y3akZPNzRZeGIwZDVGOWZFZnlpaXpUb0Nz?=
 =?utf-8?B?aXNaSDR5QlpKd3hCQmpqR3dTVVlOeFlpRzVIajUwMlpCZ280S1QwUFRLeTJT?=
 =?utf-8?Q?g+93b6Ccb4fmOU+FEZ8ZO3eAKCSBtdCsjzfqm3c45TGX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bcc90c90-0584-4dba-ba23-08de3c61e656
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 05:13:50.8387 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RVApp9x/ql+iQJl380NOsA9OMZgNKEfQZHmZllCSd+d/mnZGu+c0GNU6mo7NtiVzrMarE68UN73hNjGCip5b8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8816
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

Unbinding happens on pinned data, but some of our methods still take
mutable references. Right now we can rely on the fact that `Gpu` is
`Unpin` to get a mutable reference to its members, but this is going to
change when e.g. mutexes are introduced.

Take advantage of the `project` method of pin-init to obtain
pin-projected data, and update our methods signature to work with pinned
data when relevant.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs | 4 ++--
 drivers/gpu/nova-core/gpu.rs    | 8 +++++---
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index b0e3e41ae9d8..c53e96173890 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -98,7 +98,7 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
         })
     }
 
-    fn unbind(pdev: &pci::Device<Core>, this: Pin<KBox<Self>>) {
-        this.gpu.unbind(pdev.as_ref());
+    fn unbind(pdev: &pci::Device<Core>, mut this: Pin<KBox<Self>>) {
+        this.as_mut().project().gpu.unbind(pdev.as_ref());
     }
 }
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index e16d3c2a6b38..ef6ceced350e 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -292,11 +292,13 @@ pub(crate) fn new<'a>(
     /// Called when the corresponding [`Device`](device::Device) is unbound.
     ///
     /// Note: This method must only be called from `Driver::unbind`.
-    pub(crate) fn unbind(&self, dev: &device::Device<device::Core>) {
-        let Ok(bar) = kernel::warn_on_err!(self.bar.access(dev)) else {
+    pub(crate) fn unbind(self: Pin<&mut Self>, dev: &device::Device<device::Core>) {
+        let this = self.project();
+
+        let Ok(bar) = kernel::warn_on_err!(this.bar.access(dev)) else {
             return;
         };
 
-        self.sysmem_flush.unregister(bar);
+        this.sysmem_flush.unregister(bar);
     }
 }

-- 
2.52.0

