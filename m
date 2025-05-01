Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED845AA5EC5
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 14:59:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29D6E10E83B;
	Thu,  1 May 2025 12:59:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="k3Tbzveh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2045.outbound.protection.outlook.com [40.107.236.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EAD410E838;
 Thu,  1 May 2025 12:59:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LNj00OSXCk+cbSJCB3FjUEuSb4umwCuLePL8eLbsPkv7xv2aQZCzSjH1cyBl2yDYiILs7bAqgTkIbK/LurGndF4GuJW+b6lmjSKdxJj5T1HpxmGgjs4novC7vBRfQ4kqx7+90Mhd0pc2Ql//J90T9+GtWcJubXdACZUpOsuGD/lMUF84GoU1vz78DFYIUpuiDM4aOVPE7t77dEjqdADZliXkzyosGVb4hPWPRZIdLjIocRhdLzPZ07RMdF9CaXl5P3gup2HNIYZ3wHQU4L/0GlVqmCc0eu2wDzCVVytz+eJBKNS7Y/eKpDNYNLMOWM2+DJAmOGNULviGbu9nwtE60g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UNdIUZOGUBA8bqX743RV4RAhbdDpl/1y5DCmOIqKFOE=;
 b=HLqbszHwnWE7kPhMlfwqvcerujwk7p7idZZMXLCi2OGEaGV+b5OyrpiEMm44acXhJrKr4YpguFtvxwO7ZvfFOdxy1m38BxBJ5Q/h8AKYZ0gprsvyHT/pMQwFG7cQmJtb+iJZNayG29LjrEerb4yKLSNbsDgOJjt9Q6kEXNfuusXCNKICXd16Mmozp1CCk3JCJWzLzTNfId6h4EBJO7YMLpelQbKdoBQxRLeFDvQTkSQpwEfiXboN02eIBO8ILLZiYuRVZjHDjN3eHC4mJ/1khcDLhkuP6ERDQRlJVbqhobbpbfoT9UOBUPbCY1nPzrCHAv0dZZtZ0IsgMsE0A1M6FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UNdIUZOGUBA8bqX743RV4RAhbdDpl/1y5DCmOIqKFOE=;
 b=k3Tbzvehrdm8JVur9lbhOKXYLdhUFIcB/jwtn6xdy8dddfhNT/QgohGPW24khd34RT6L7mc9Tg+2agGTY7uAeXtQHYWeafa/lE+3LtC2Gv5cbLuSYmXPQBeQqSmbG+PGPCLyclUBcdZUIvR2QNR4lLhO5ymghBpkVuQP9+hmbaXrgjYS3bUi+DQx6pAkVVxn4LI1sbRw5tsOSg/9x0SPzuAVk9fLtSUqbmVrhc/XhXdbk8KAP23+eTmw3oTetNmPELd/QVyc+FNetQXsnrglh+TFkpZKBzo8t/QyRYQFznmQhPQVIdWEglR9BFX85CzXp1Sox23oDqoJrFlJbw3qxw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB6442.namprd12.prod.outlook.com (2603:10b6:510:1fa::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.29; Thu, 1 May
 2025 12:59:22 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 12:59:22 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 01 May 2025 21:58:28 +0900
Subject: [PATCH v2 10/21] rust: make ETIMEDOUT error available
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-nova-frts-v2-10-b4a137175337@nvidia.com>
References: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
In-Reply-To: <20250501-nova-frts-v2-0-b4a137175337@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0340.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38e::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB6442:EE_
X-MS-Office365-Filtering-Correlation-Id: bd8bd327-b477-46ab-4579-08dd88affe33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|7416014|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VzkvVzAxVjBWUi9rQ0VxM1RNZTRVL3hHOFJnalV6RzhMWUE1UlVWTFBqZ1U0?=
 =?utf-8?B?ODdRUU84UEdXdTFKRUtsZ2Q2ZzhsZmJJemtnRkc1aVY1SFhmRjhzbTNyblhx?=
 =?utf-8?B?WkxlU3dVUVYwdGUrYUF0OWxjUGdHVklFdVlJQ3l1c0NnNU9xd3NMQzNERVB1?=
 =?utf-8?B?UnQrMG5xenhGalJUaEJEQnE3bStCdE14K0N2c1FzR0hpR3lwVW9keUZhanEv?=
 =?utf-8?B?LzRRSWo3R1M1eUprOUJJVE1kVGYyUWw2bmdKTGtvc0pLTGVoelAvTzJROTRU?=
 =?utf-8?B?eWlVQ1lNVmc2aHVNa041OEtQb3NnLzNNM3p3VzlKMkpCUmtRTCtpajVhZnBT?=
 =?utf-8?B?a1ZmWFFaa24xMTlQVzFYVzh1bDJLOEdmQTZHOEw2OFJ3UGtxdVpIbDB1UzFn?=
 =?utf-8?B?STJ4WWtzd3ZjTmZaMnpRNm54eWlBRVZHM1lHZzl2VkdraHROMW5tUUUwUUhQ?=
 =?utf-8?B?QkV0OVZLVDNLWSsyRWdSL3pOOTM3SnZtL21tNGYzTWo3S0wrU0ZUYXRMRFFN?=
 =?utf-8?B?c3pyS2lseTFJQmhxaFdibkh6UmNiMjJwSlBwaFJ1WWRST1ZwejRXc2NaZFdL?=
 =?utf-8?B?YkU1emJXSllDMEgyL0VoeEhvZDJHUVh6NVhaRTVTQitCdENaR1AzZjhPY1Zz?=
 =?utf-8?B?QmZpbkhFMjJzeEczUUtSSXJkdTN6ZDFZcktuM3RIeUFjUXlNVmhjcFhRcVVP?=
 =?utf-8?B?MnlkeVVXQkMxTTVuZVRyTGx1cWlaOUpuQXN5YmQ2YlYvSEIxM29KYnRmd3JJ?=
 =?utf-8?B?ZDg3Zit4dE12UUdhZGtNcDhnUlpmdmVwa3hCYWlwR0kyTmhhK2w1cXVZN2pK?=
 =?utf-8?B?ZlRPeVlGSXp0OU5aeVNPUGhGUFF1aGRwZ2lpZXNUYkpvRXdlZ09IRlpqK0xK?=
 =?utf-8?B?VFNMV1RlaUMxVGJnRXpqN3lvWnovc05SV0ZjL2ZRdjRPcFY3d2dBTjFZWHUr?=
 =?utf-8?B?UHhTYTJJTTZscWUzcXczODFsZi9UdEVvbmhlTTFUMVI2a2t2WWFwRWhmSXh3?=
 =?utf-8?B?L3JzRlhKL1FCeXBjdEJSMUg3VSt0cElISXRNSi8zY2gxL3Y3TVUwNmEzN3FR?=
 =?utf-8?B?UWVsK0lYRHdraVBMR3k3VEdyOUVBVkVHUXpCditKM2xoTC9DbUxyTXMvNEUr?=
 =?utf-8?B?WlJSOXdJWms2RzdrMEdnS1phdmFtZ2JEYjV4NVRnTHFCdUltejlZd1liQmJH?=
 =?utf-8?B?LzdYcDhndjYxZUVoNGR0eUx6NS9udkFmUm5hTmlwWWhBRUdyYlMrS3JnYUpv?=
 =?utf-8?B?NEJ3UGo0T29hS2JaOS8xMXR6MFU4U29qK3gzdkJyQVk5RFJ6ZWV2VjBTRzlN?=
 =?utf-8?B?aTdveXdkbXJ1RTVUWnNGTXVHbEpyQVVSbDJOWVJwZEJVMmVyT20wSjZYZWR5?=
 =?utf-8?B?Mzg0N1FHVzdpL1NBVWZPK3d4Q1RwWFY1andoTEFLQVpuZlRpOEl2TjlUR2lH?=
 =?utf-8?B?MWRoVmMreURzQmpBa0tUeVU3dEE1R1dkMFB3U3kzWkhkSmI0UlBteUE4S1ZU?=
 =?utf-8?B?ajE1T1huMkNxWXFzK2dyQTNWOW9oWkFLRTJtUDAvaEFnRUtyWFNRRUZkS1I5?=
 =?utf-8?B?VnNKTHNEbUZ3bW9nOUdKU2J2K2s0ZlJrZDBJbHZqUFZSTEZURzhiUFV0VHdU?=
 =?utf-8?B?ZUxQNEczZUdNdVVYV1pzRjNXQ3VwcjJrcWN0Q2NSQ0JxV1lnQWVSTU9PUmNJ?=
 =?utf-8?B?czFETUFKQ1NQNTU1Z08yVk12cEpoMFRFOUNDOEdUbzc0ZlhCYytBclJYTSth?=
 =?utf-8?B?bVZ6QWppdGxwdzZ5UkhHQTR6Wk96L2JLYkFzSFJ3dXBUQWxJWFU5WVkrVExS?=
 =?utf-8?B?TWZHOHJoZWNuQ2lvM0FMZCtyaWYvYUpmYTZPYWlzOVpLK2VDRDJaUW03TVli?=
 =?utf-8?B?cERZMVhsZWRLSVJQN1FFc21hN1VNZjhTQldzQ21BTmJ3QTNHcVhYZWgzNExp?=
 =?utf-8?B?MVo0N29WN2orV0NycGxjaXNyWmdTQ29RdXczanlwdXFxYS9EWHRrbGQ4aUhB?=
 =?utf-8?B?SDc5dFdmZ21BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7416014)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk1LNHBtMXJlZTJPcG5uOEMxWGE5OEVLVk8yS0d2WUdxMW5HNWZtOEpNMXRs?=
 =?utf-8?B?U0VRUUdVaHRQK0VxUVAzNDJvaVd5NkYvcG9vY3h0aWRDdEN6WTR2ajdTNkNQ?=
 =?utf-8?B?cE4xN084NmlYT3pnOHVYUUxrSWRiT0t0OXBkYXlyU0lhZ3FRQjZ0cFRlRUFj?=
 =?utf-8?B?UElwcnRPcjc5dWxVS0VwdVVkWVV4NUJiTnN5Yy9UZkl2Yk0velYzelNLZjFF?=
 =?utf-8?B?b3VORi9ydkhIQmx4WTNsWFF5bFJoTkZUVnJ5K0VoaVpWcFdpSUFxZnZpd3VZ?=
 =?utf-8?B?akkvQnFyTW9EYWV2cnhzQVFaQjQ3YlFIQmVOY1RCOEpGTitSdnFQTjVncFFO?=
 =?utf-8?B?ZmRvVkZRakNkRDBCaW5NMGNoRkFUTGViZkd2U3RqanlzK01Zblg0THF6TW93?=
 =?utf-8?B?aDBtbkhiM2lxcS9FT0JwVlYwZWJvMTRWZmY1b3BrT2JEaCtrOFR6UG9qQmhw?=
 =?utf-8?B?SmFXTzJsbExUTkVHakExYmRhTjUyN0V2NUN6Ull5ZGx5am5TTk5vN3ZxS3Uy?=
 =?utf-8?B?UWFLSnI2NGx2WGswSk92UTA5cWQ1eWNML3BKVHBVcWc3QUF4UDl4K0dBS0lG?=
 =?utf-8?B?Y2hJMHpzeStSRmh6Z0FGOGVTbytUL3dJdG84c3RSSmxDYjFSTGFUbHRnSmNt?=
 =?utf-8?B?d0o2ZUI5aVYzbVRMbkhzMitmL1AwRU1LbmR3TVk5elhmcVBqMHhHTTlHWEVB?=
 =?utf-8?B?U3NqL2lwUTdMcGFJL2p5eDFpakZ0SlJoY2RDUlFTbnBXb2R4Wk5ZTFFxRUF6?=
 =?utf-8?B?U2Z5MXF4NDdzTDRYbTFiS0hTdjI1czhPbjV1MHI2b2pPdWZmeG9BUFp0T3NW?=
 =?utf-8?B?VDNpejFZTjYwaG1mejRXamRkWWIrNVdoeitBdWdSbTBTNWJKN1NoVUYrTG5w?=
 =?utf-8?B?VDI3UHBEVGRENi9XVjhkZVpaaWVJZUNHR283K0w2cFYrdmJpZENBdU1HUExX?=
 =?utf-8?B?SkY5QXB4Yjh4ZmhyWmpFbUxVcHFoWk84cTVUaFNGaFFxWUczUWcyVGZUWTI0?=
 =?utf-8?B?UlZaV0pnQ0UzbTZub1JwYW90WTNGT1dUZWNkWkVuaVVyZ0VGTUsvQkdVWVVz?=
 =?utf-8?B?bk5jTFQwb2Z0MHZkVWZJOWxkUnZJNFdGeHNkRDVjajF6QzVHYm1Hb0pQMVRl?=
 =?utf-8?B?Sy81R2RtYURmRWROcDUyVXpHR3puK2lrQ2V6NlBOdmpDSkJ0WURzZ1JHSzdG?=
 =?utf-8?B?Y2Z1K3NzVmp2enNOSmZmL3M4TUtPaTNIQ0t4NU9TNUJ1MHVBQzREclcyaytT?=
 =?utf-8?B?R2ZiVHYyY3lwdkZLbFU1YllLeDNEMGEwWE45U3JZMnB5dGZLS0ZwTlYwdm5q?=
 =?utf-8?B?MHVpemZhR3pERjVBd1p5aE5KNi9TcVdHRHZDK01aUnRKUmpWamU3UXJkYU44?=
 =?utf-8?B?NWU2bStWY1lidXc4cFd6Sk11NGYrL1RYMHhJYTNkZlZwNTJmUy9xUElVYXV2?=
 =?utf-8?B?WE5KTHRqU3N1d2NDS3RyMGJCaWg1YngvekZMWXYwVWNmVGhFNXcreFZONDJz?=
 =?utf-8?B?a1k2OTd1a3d2Qk95bWU0WDdzTkhlajhUNXJxNXdmZjJKaFYycXhNbzJiTzRR?=
 =?utf-8?B?SDlDeUJDVmhDc3BSalpHQTRvSXdrb0x6VDlYeTZYcWkwdlVONExwWHg3WGFu?=
 =?utf-8?B?WDU2YjNrOVV5OCtHM3lzTFhpNForUDR1TWpqT21yVm5kSzZOTmpTUVZjL05B?=
 =?utf-8?B?Y3BkUGJ3WUNMWkgwWDZpV3lvWSt4T0ZmVHliN25LdlJSTDdtak9WNFdsT09q?=
 =?utf-8?B?anJ6eGZvdUs4ZW1USkgxcVhMOWZSWjRZNkNoU2pzYXg0c0hwQ3ZxR2dBdStu?=
 =?utf-8?B?Z2hWU2VMWFE4Zkg3RzY0alowUUlQeTV3MUNKN0RzL2ExOGxMemVIZHNIUkph?=
 =?utf-8?B?SDdXR2N5MHRFUHVCOE1XVHkvMm8xcFNJa2lxTTVSRWNTc3JTZUVSdWtMejlR?=
 =?utf-8?B?YnJDOEZKUGk2YjQ3OXpFZEVuWVdqUUpNYjBNTVBOekp4VHE0cVBvMjdpaGxT?=
 =?utf-8?B?QUZhelY1bUs2TWtCTmlpYWU3b0c2VCtLOWZWRW52VzlMa0xvRWh1c2l5eGlE?=
 =?utf-8?B?VUROcHVOdGFGekxJVEMzNnlJNi93TVNwN2Jnc0p0NzJqYnUraFR4ZEw5N0lx?=
 =?utf-8?B?ckU1Ny9PbFFOTzhYTExYOEJ6T2pkWWdUT3hGcHREdG5yU2JINGVCQmVVYitl?=
 =?utf-8?Q?vXUcoXRcjRnI8SZ7xNzb0RivlxZny7ZP/hUtE+aZuPYY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bd8bd327-b477-46ab-4579-08dd88affe33
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 12:59:22.3291 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eBLKlD6cO72r3VvemcfXr8VA/KFWrfWWyjCoOxYuzeZysBcfvJHkcqtvvHN1h+sxlcp3rDD3PaKLtDaYfH5gXA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6442
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

We will use this error in the nova-core driver.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/error.rs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/rust/kernel/error.rs b/rust/kernel/error.rs
index 3dee3139fcd4379b94748c0ba1965f4e1865b633..083c7b068cf4e185100de96e520c54437898ee72 100644
--- a/rust/kernel/error.rs
+++ b/rust/kernel/error.rs
@@ -65,6 +65,7 @@ macro_rules! declare_err {
     declare_err!(EDOM, "Math argument out of domain of func.");
     declare_err!(ERANGE, "Math result not representable.");
     declare_err!(EOVERFLOW, "Value too large for defined data type.");
+    declare_err!(ETIMEDOUT, "Connection timed out.");
     declare_err!(ERESTARTSYS, "Restart the system call.");
     declare_err!(ERESTARTNOINTR, "System call was interrupted by a signal and will be restarted.");
     declare_err!(ERESTARTNOHAND, "Restart if no handler.");

-- 
2.49.0

