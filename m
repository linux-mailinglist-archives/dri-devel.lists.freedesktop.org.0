Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBE0CACAB1
	for <lists+dri-devel@lfdr.de>; Mon, 08 Dec 2025 10:27:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C928E10E3F5;
	Mon,  8 Dec 2025 09:27:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ThBe9D0R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011016.outbound.protection.outlook.com
 [40.93.194.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2040D10E3FC;
 Mon,  8 Dec 2025 09:27:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CwZ/eGQOypCnE0FDtaZTVFH2QiIeHrfPHF8Vps+fzunbosV0vAn2c0OIZLQ+YTrbEVzYZc/30atytyx1XCgUuizq7gE5B6daB3fjTNHSgwaE0nGloTkrdD/7hmibcMufcL6z9V/VR0nHtSwks2R0QX49jzxZU8CRwjAkeayj9k1XfxSf0LL3K8H5Zuxz0Odu5KfxKEvI+tKJfwXnvoia9Lc1Qa0GRcLb8OeLznOANCChRuWZoFsajgM+ZQBt3O8NXGYCFOH/QWQlDYejdHysvAweb5Jm+akfCgIADKP4N0flf2YiHMc5edI08xnzEr0aKMml0ZlzhsZSiDbVAq+q9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4VgNzLd2GwPmfcaMsSFRCI4BSETUXh5rOH5WChtlMdc=;
 b=gx/Rg7L4zZYkcJOGQKBqYHd/IwNeSwga2HBwn9x1ufXPEbkqJRYdi9q5sOMpoMnj6x8H3L3StW638zeJJLc/nQwh6fNaf4/WZXNI/JTVPxvvfNQD1N5Ph6nwIUTcL79wSAR9pyWcdqap9Z0Q3D8AaZQpnXc5pu1LaM3VqBU4+Pjx+xjBzEYCke8jq7FylnNiIiht423FFpKy7bpGhyupYxmHIcS+a5+lkUs+mmsOxgCWUcO47qW3qIPRlzvaGLePNXu4dESu28+usvk+0xOpPf261RCn2+l6hEKsBc9cCXxGLqPSCrr7yEnysaZALTuk0wCY8ToWMjavZ+HgGi/kbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4VgNzLd2GwPmfcaMsSFRCI4BSETUXh5rOH5WChtlMdc=;
 b=ThBe9D0RyODelB83BIWupDjAnT/GFSvLPyUueb+cxlejFBuZlAHdsvKxaXkH0rPaGtD0J9IX20S2Km81nz4EFa68df30Hq27PiR6mRWYZpLuv7/HzP4sASUT2rMBhmxgUEXqBZXZ+us/nR6nIoIOKMssab8pGk1xtwt7vH44XqsHNgzWyiku6T8qzDwyjI8uumrd6K/6TSc9MPT4V+nOVvXvqpGtvuJILvrdEeFAAZitdutEj5kvcPb0v1cccfopIYGveCJOmgZLDp7kt++kxF73x19JlEi72ou6hrefPJ9Gwh19Ydknu5TaxBJ0hw15ocIsqP/zuC85KveIo/m8bA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8108.namprd12.prod.outlook.com (2603:10b6:510:2bc::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Mon, 8 Dec
 2025 09:27:43 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9388.011; Mon, 8 Dec 2025
 09:27:42 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 08 Dec 2025 18:27:01 +0900
Subject: [PATCH 9/9] gpu: nova-core: simplify str_from_null_terminated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251208-nova-misc-v1-9-a3ce01376169@nvidia.com>
References: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
In-Reply-To: <20251208-nova-misc-v1-0-a3ce01376169@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: OSTP286CA0060.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:217::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8108:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ec082e3-ef85-43f1-d493-08de363c09e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|1800799024|10070799003|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eERzaDlsTnkwU3pPWTgzUkFrZS8wTnZRQnlPUnFuK0xOWExJcjB4eCtlb0RJ?=
 =?utf-8?B?TVlOalErd3RRYTBpeVNzZWpQSjhDbzI2bU1RVUVtVEpsaG5nRjN6bGtwSG5P?=
 =?utf-8?B?QitSWEtKWi90YmlFNWVzdnVRZDZHbkx2bmVPUjVkNUtlYkRUcHE0aGtld2Nk?=
 =?utf-8?B?NGhUcjN4blRUZ0ptUC9FQWJCSldEZUh0NFZhR1NuK1lta2N4N1VlTXNLSGFi?=
 =?utf-8?B?SHkyeEpvVkgrb3lFaWtTZTNCWVBGSUhCaktwcW5sVDVlTTlJNVVlSXozbi9y?=
 =?utf-8?B?bXhrR2k2a1pibDgwdnMwNUJORUpLTXNTYlZzc2V0T1dXYkUwVzZTbmtvVEw4?=
 =?utf-8?B?VVF0NTdJUGVHNzhXdEx5Y1FXaTQ1b3VhdFBlOWU1SXNFanA3TE9QYVZ2SGhz?=
 =?utf-8?B?Q3dCZ29Yc0lwcWxtWVg5QWxMQkU1dm9BZVZQY2p0VjNaMmFlYndFT3g1VHEy?=
 =?utf-8?B?V2l6RXUwb0MySVZkWGVoRHRSMnVMUkhncE5YZHFxNlpLMjVxa2U5THQvZWRu?=
 =?utf-8?B?RTdnZmt3b0tZdVZoNlJEOWdaM3VremcwSlFKb2RVY2lWbTBuZFltVm9VOS8r?=
 =?utf-8?B?dVE1NnEvZDhjaklZTzBBYk11Y2ptbWRlRjB4S1A5QXNGemlZbzUycm9SVTJj?=
 =?utf-8?B?NnF4YlBaZzNHZEtraFhMWWxHNXlhN0pqSGVtb2M4K2l5NmdwMXhqY2FJcW5l?=
 =?utf-8?B?SnpqZWdMOEZNLzJEMzVnU0hJN3pkcE9jT2xGQWJkY1d1VnZNcXd6eFN2TmRK?=
 =?utf-8?B?K2F6VDZXL1Q3dVhnLytzV2lmdkJHa25EWjkySVJpZ1RYT3ZEMEtLSGJCZ0oz?=
 =?utf-8?B?T0NhdHkya1EvOGFrc2x2TGVraTNEVCt0aWp3L3JJTnJCeUJ6QjBBcitQZ3Vv?=
 =?utf-8?B?dTZlMHo1MVFEQ0FETEt1cDdlcVRGam0weTlBSTA2bFlIUkF4L2RpUFY3Z0lK?=
 =?utf-8?B?K081OVh2R0VNQ2NKb1hCOHNRZE5XaUsxRWxnSlVnL0lmYXppNE9nVnlYR0ps?=
 =?utf-8?B?a2UwVFZPR2M0OWIwTDd4aVBqaE5vQ3ZidUNEY2J0RU5SUTVtay9RbFRpczli?=
 =?utf-8?B?bksvQWRsOWhkTVRVQUxmcTdxU1pGR2dLaHlvTmFwcUMreGc2RkZUL2IrTERx?=
 =?utf-8?B?RE9wYmt2OVBHMzZ4ellRK0x0ODA3WmtBN2pVdk85V3FRK0lHdDkvdk9LQ0tB?=
 =?utf-8?B?QVhLckV1MzhJd09IMDB3aE5DcGJLTVNPczgyZ3ZYNmJtOXFQR2pPTWhKN1R1?=
 =?utf-8?B?dUVFM0xhaFhBR2QwY2o5cERheFRTWUZLMm0xWkpVaWxMdG11UlIxR24yNDV4?=
 =?utf-8?B?Q3NtdnBBa0p1aDZqYytIKzJEa3N6S0tjNm5XNjczcHMwRS85RFU0RkdLeUIw?=
 =?utf-8?B?MVNDNGsxQzFEd2Y2TXhORnpMcG4vSFhoMjhtYU11WHRvNFRLYW5hSzE5NllO?=
 =?utf-8?B?c0IrbVNyQ2RmRzNNNU5acGxCU0RVU3JOUXZKblU0VnBTK211S2tZN2FoakZY?=
 =?utf-8?B?d1ljUU0rcElFQWhDR0k5Rzd6SFNIeS9YbDJib1VYdGgzSWgvaGQ4N1lObFk5?=
 =?utf-8?B?QmgvODIrWmNIZTg1VjduMGI4WUExL3Fabk1iWFVQWUcwYjZqcllDZTU1SGNX?=
 =?utf-8?B?UktGU0F3VTZxamlib2tjcTdEa0I0UXhudTR5bWloRk1DS2wrU0xjczZTZVdl?=
 =?utf-8?B?b2s0RDhMZExDVXg1UUtPbndjaXQyMEJCMDY4SGkrTWNrUWZkUWV6dThnUVFS?=
 =?utf-8?B?Zk5RQ3cwSEs4SW9URE9XZWRPblBqUzNBNHRSbzh1cmZDdEFsL2R5Tkh6MjhR?=
 =?utf-8?B?Z05VeVRZZTlSZXkxVHU3NEQrbW5IZW9xdFp6RzB6N1FYU0pDTEU3ZDcyYzh6?=
 =?utf-8?B?TjZIWUcrQU5YdGpFY3NnT3hVRkdKQ2lpcEpRUk80cmJSZ05SK0xWZWU5Z0Rw?=
 =?utf-8?Q?wPVmqE00RMPUNBM85bjulvRGblGXhbAV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dkpUTVhSNWlubGJqVUE4d2x4Y0JsVkgxRStEa1FyblBnOXdGb3dPamRNekxD?=
 =?utf-8?B?VnpJK01JcEpycERycVE5MjVzMTBCZ0cvSlhseERqTFZkK3ljUk1jU3NKRzF0?=
 =?utf-8?B?bDc2UXhQaXNDNE9ab0k2NjAvQVdORnVsZjQwT1k2UTI1aWxnSjk1cE9UT1h6?=
 =?utf-8?B?QXRhT0t3NVk3VXNzR3hZdVdkV0ZRcUQ4TENCWkI4ZW1MUjlidVE5b09oWXdp?=
 =?utf-8?B?TnloVnZWVE1MWmpsTU9TNTBjNjFOVFNpa3VoUjhDN3FxbXFZUU9LVmc1cFYr?=
 =?utf-8?B?QW5CbjN3MW9zc2VUcjV4ODBVdExiRDMzdHljWm1xUVdLZ0wydm5mT2JBVE9Z?=
 =?utf-8?B?aEl6RVZ2QzlUZkFLVUxVdkxiMFZpVFE0UEo1SjJzWHcyaXU1QUIxYi9zMlpn?=
 =?utf-8?B?NXljWjgrd3VqNXBDNk0xZ3dqYWpwL0ppMnBYWXpOWHVvSzZiZlVLVU5zL3lt?=
 =?utf-8?B?eEdFY0htUG5LWmhuVkRseWNpTnhMeW9yWlJ3bEpoK0ZBd1VNODRmRVZkcTBh?=
 =?utf-8?B?VlhLUFVUeFZjUVlXK2FSbURsOUZVMXBqakJRTllJY0hEcnVScU9xbFlZRzFH?=
 =?utf-8?B?TUp1RXpUY1hjdFU3QncyMCtlSFN4UXk0Zm9KZXJlbXdLSzV4V2lRNjNlbGxG?=
 =?utf-8?B?Mlo1QzE4b1NicGI4TnlMVmFDOTY4L0dOcEFoaXF5Y3diZ2luc09KVEZXUU91?=
 =?utf-8?B?WVFGOE51VUluS1BSUmhxdlYzRys4MEppa25xaWZycWJZbzB5YzZpVWhWQWIy?=
 =?utf-8?B?QVpJUjVJNFZwSTB6NEpOUzVEU0wvSy9RbXFlWGtIaG5oSEdDeDVnSkpvT1VK?=
 =?utf-8?B?Nmh2R09EWWZlWVlKQU53RytNV3ozMXJWdGxXSjkxWVp0ZzBtZmwxYTlKNmZE?=
 =?utf-8?B?MnhyMDhNaVBBZW91UkplWDZuWFFORHlUa2d1QVB0cTVjdzlXZnMvenYxWjRV?=
 =?utf-8?B?MmFiTW0yODVDbjdHYW92MjM0cnRVS2lKWHc2TlFMQUkyMWkvL3A3cGEwOUF1?=
 =?utf-8?B?VUZZK1k3NTlIckY3QWd3SXJlN2xDWmp2M3VyRGtDTXZ1eENFancyS08zTldD?=
 =?utf-8?B?aFBoREFyT2ROV0dXOWxFaWdIL3MyRi9RSm5MNXNrSFJBcEpmYUFoSG95YzFN?=
 =?utf-8?B?V050U3ZNdVJOeTRoM1dILyt6MWQrYnhZbnRMczFBbGJVc0lNTXl2ZFBsZjFo?=
 =?utf-8?B?OGdVcEVQWlJLbmI4UFovSU1XNk9TdUtWMHhqQXkrTTgwdm1Nci96dEZveVI5?=
 =?utf-8?B?WHBub1dLR2UxNWZsZ085SW1aK0VFNjMvM2lCc2dHNDlLRnlZSFJnNGVhOENx?=
 =?utf-8?B?SDNubzRldWJsOXQrUlFuc2dTQlZjbDFrSEx6SFVIdVBua0Y1dkVxbTY0MnpO?=
 =?utf-8?B?bmVoeDY1dExicUVpWXZyNGozOFlObWU2enozcEF2K3RWZWEzQlp0S2tzT2pi?=
 =?utf-8?B?ejdjZlo3dFhyOHY4SVZCb3JCSGVjYjZ6VnltWVAwVWpzMWJiNUVlQmxmbFdF?=
 =?utf-8?B?WXA4a0hnSnVsbXkwZElxc3ArVC9QNGhlSy9mN0lpOFMvQXdZdkEyNWI5VW03?=
 =?utf-8?B?K093MmtYRW9SLzE2QkRXWjY1dzJ1U09rakYzMEd6ZGNlaWZDNnN2RzUvNktk?=
 =?utf-8?B?eVNkeUF1c3J6K2xpdHhKYWsyRngxTTJ1S0o1RzJENG82MUxIR0V5WjZhUXBG?=
 =?utf-8?B?Y0lIeGJIb2JYUWo3RWF1NzgvVHFHVzRpTnY1M0IzTFN2NEpvTHNPUi85dzZN?=
 =?utf-8?B?RkhtQ05qSm1KcExNbTdvK3pPOXFHdXBFTlVyL0tUVHJvcHJDZ2FIZUJZeTZ1?=
 =?utf-8?B?cDRRenNQMGVKd09YTzhzcCtMdWs1N0hSTTVjYTQvSVZDcWtZVitaZmFWSTUv?=
 =?utf-8?B?Q2QwNzE1bmplclY4a0loQnFtRFlPcUhTSWlQMmNNME5BQ0xpSElHQVNyREJG?=
 =?utf-8?B?d01CaC9FSHdLbXhKUWNFakdhcGUzYzR6VkxKTk5sZXNrY2JMSnkzMFVRRGgz?=
 =?utf-8?B?NytOZTBNUElJN1Z2REpiZTVNdm9MbUdveGZFWEdRYlFESFdYUFd5eXBERWFo?=
 =?utf-8?B?WVpESXRpTy9BUHkyelhNRWQwcFM3Y3lZMkJkaFN5NFdrRmFNL29BaE1QRm5R?=
 =?utf-8?B?cEJLR2V5Sk5OUFpVcDEzWHZrMStJV2o1bHIzNk0zYnFsa2FCVE1DN2tPREpR?=
 =?utf-8?Q?59qtafuw6ReJrlqlO3WOwnOa3aRdb9mQhs5K421/NfEt?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ec082e3-ef85-43f1-d493-08de363c09e5
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 09:27:42.8346 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m7QkdfNpoZmFbqDfU2csnFtbIvrd+wCchNCuSQQccBT0tTzg2gqieYDCn6VR7R6I91jmZbhplmdnSSwljLtw6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8108
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

The core library's `CStr` has a `from_bytes_until_nul` method that we
can leverage to simplify this function.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/util.rs | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
index 8b2a4b99c55b..2cccbce78c14 100644
--- a/drivers/gpu/nova-core/util.rs
+++ b/drivers/gpu/nova-core/util.rs
@@ -2,15 +2,10 @@
 
 /// Converts a null-terminated byte slice to a string, or `None` if the array does not
 /// contains any null byte or contains invalid characters.
-///
-/// Contrary to [`core::ffi::CStr::from_bytes_with_nul`], the null byte can be anywhere in the
-/// slice, and not only in the last position.
 pub(crate) fn str_from_null_terminated(bytes: &[u8]) -> Option<&str> {
     use core::ffi::CStr;
 
-    bytes
-        .iter()
-        .position(|&b| b == 0)
-        .and_then(|null_pos| CStr::from_bytes_with_nul(&bytes[..=null_pos]).ok())
+    CStr::from_bytes_until_nul(bytes)
+        .ok()
         .and_then(|cstr| cstr.to_str().ok())
 }

-- 
2.52.0

