Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACF14B406EB
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 16:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4A4E10E771;
	Tue,  2 Sep 2025 14:32:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dajVoGzY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2056.outbound.protection.outlook.com [40.107.93.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C0B310E76C;
 Tue,  2 Sep 2025 14:32:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wW+dmGk8WvVdjSFD14ndOCvmWh0lqGaFuAwBZghK5Vgtk34OZauXtOHWlluFjJ3CJjmOqx1I3h0fopPoqagDexlsatScWZPi1J8ZeWfHVYBco10I4hNTzItCDpRJpFdNNM6DtskbP/r31lVPm6/2sxaz9YWxjhjkcQsV66C7Qg5tCbAbfISD1Pv0l6XKLZky7HYlC06JzpeMtvNETpn5MNmWvOGC0E2uPens5WInSmQkYVbmlTGvaurS8TP3wt+o6KYaVnDuFVQz5bpwCDuCz8FJl+i3mc4AyCSLdcCgGBHnT0M/25caRGHBJrpzlhZ+Tdm76T3Rdp+0hWPjKmV7hg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11fdBdw5kdQOOY7SiWW2SIjX5WEG0dPVkVlfG3IE5nM=;
 b=jLlCVeYDRIdAvIBPtD0y2KD1pdaFLh0c/EBJ70HlYbkCCwlsVIcQiC+0ZTfcY0ZjHVvrgNpd8Ex6T8BFaia4BAtYPjHX9Yecyyn7YEDu18rtveKLRJIIEDw8WnEnWZBrIwnDygP7smvpjkI6aMZ0xkNErY+D+HmykZzQGBv9/NL5KS8KforcZ+FzygQRpQWJJYr4/tXblnF7CSxpZgbHhXsAAAyuPyZCCEiI/wDOrKpUadXgwPPFEjtpcK8ShEM6Ea7a3WZxNi5Vtildrd73EwCOnQDlxYVUyiabzXzTMQqs4weFQDJIA3P0ZSaJ9AI704ZI7eRQAiSZeD+ca8z39g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11fdBdw5kdQOOY7SiWW2SIjX5WEG0dPVkVlfG3IE5nM=;
 b=dajVoGzYF5gLOaOmGxMA1suNrjiL4uAqe6K+xtz/F9l6TPtHVMA3dJ4HyjQE7l1djBXxTpD7mMDruasTr2CH6KvNC2tl1ekpEqKgeONKICyIfWslgA+5MXnPYQhBfBM7dvcR86Bqs9oNU7eIxrPGVwttzppms9uCdAwUSyF9k9zPMUNurvqR6QU5+a0LqvZh4zOcjVxBoiBqk2AABk1TtLsH5AHsZVpHfH2usEFx5akxbJvZAPkc7fsiVmqfXjO8eRBm+AFKJWOuWs2UEUWk+t+ZYrnwxiQcJcAAgpobi5MVlN4kGVMOkc85SMsMqM672J6WENSBOhol9Ga53yblPg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8955.namprd12.prod.outlook.com (2603:10b6:a03:542::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Tue, 2 Sep
 2025 14:32:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.027; Tue, 2 Sep 2025
 14:32:35 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 02 Sep 2025 23:32:03 +0900
Subject: [PATCH v3 09/11] gpu: nova-core: firmware: use 570.144 firmware
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-nova_firmware-v3-9-56854d9c5398@nvidia.com>
References: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
In-Reply-To: <20250902-nova_firmware-v3-0-56854d9c5398@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0008.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8955:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c7a0bd6-f870-4ac3-1ed4-08ddea2d8f6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|7416014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d3VjNzBqWFF5T25QVzdvam9mcGYvM1lGYXlsalFnSGJmUllsYnorVG82ckE5?=
 =?utf-8?B?M3JSZ1hZSkFTZFQ4VDNKUTJKTUhMRFpqVlJObnVNRmZxQTlDQkNjUUlQS3BZ?=
 =?utf-8?B?TDNjUXRGMTZnWTRVQ1plcXFXOWRyMHUyRVpIOEFDNTJLZERIQWthRUE1Vit5?=
 =?utf-8?B?cmRyVE03WUduYnRzczNmZDYyaTVqRFd4OWxvcTg2SEdZRGViQmZ4ZkN4RnM4?=
 =?utf-8?B?aUVpUks1eGRkbkljTzdHR0V6akJCb1ljUEZFSXI4eGxURWw2U0F3L01nY1N6?=
 =?utf-8?B?VVp1aEpXNzZIOHlhSEZON0xhVFI5OG9abFBJQ01iVUJJRVVSUlhZTnpjS2Rt?=
 =?utf-8?B?V1VMR1pKZHBEdFJQdUpEMXRGSndEaGVDaXNaTGdkQ2x1akt1WUNicW9MSHB0?=
 =?utf-8?B?K0hsOWZPOSs4dWFSWnlHeVlLakJMSVluUi9KbHVlUDIvL2w1UWNEVFVKNS96?=
 =?utf-8?B?VEJVYUllYUtNNXlWSmMrMW91d2dtT25CK0kvL29UelpjVjhBbityR0JUemkz?=
 =?utf-8?B?YjNmZUtzeVBadzFCRmNxVUY3bFpSN0F0MlljWTg2eER3QzRrVnJjTzMrb1JN?=
 =?utf-8?B?eWwweUFWVlk4TEZGMHI3QnBld2JKOTYwbERGcFd4TXJMck5RcWlVSUNia3Fn?=
 =?utf-8?B?L1dvYnZ2cUZORFA3bjhGYjJHLzVXVTMxYTgwdjhUenBiWm1uSldKeUtTdFNF?=
 =?utf-8?B?RFhqWFZxVzA5NHJLRjNCYWpKb2lYdlZUeVo4bDJKVU9BMVByOXFUb1JrL2dw?=
 =?utf-8?B?Y1crdlZCdUN0eHA3ZmJuSHJLQUxvZEpEM3kzWWYzMWVqMWdwTldUZzV6NGt4?=
 =?utf-8?B?YzZFZVk3VkVRUnRRSFBnSlo5SDNlNmV6eXZMLzlOL2xoNDNhRVZEY3dIWUY1?=
 =?utf-8?B?QnhjU25UeWgxZ1ZHVVEzQmlucG40MnhqSmtHYTI5Y1ZyeWx3OEg4UFN6aG5I?=
 =?utf-8?B?MXRFdjZ0YTQrdHB0YTEwVUZXbm80SkdRUmwvdXg0eUdKMmRQNVRUOFJiM2VC?=
 =?utf-8?B?SWk0RlBhUWhpVkw4bmR2SHEzOElXVnh2QUZBVFo0MDJnQ29WQUNrcC9CWHl0?=
 =?utf-8?B?TWREalRiNmVnd3pldlE3Yno5S1VpVVFsU1ZqdTEzQXJFelh1T0RKZEExMUhN?=
 =?utf-8?B?ME1DbW5lQ09YeUxBaldoMEI0UmFhdWVJdHV3TjR6bFhkdGJQVXQ1TThXc3ZJ?=
 =?utf-8?B?d1g5Q24rZllERTRIWVByZ0habXBTQ1FXdFNBajUwa3VtRFpvd0NrZlpiK2FC?=
 =?utf-8?B?VEZkcmxiaEloeTQ2T2ZFNG8rMUk5SVhnMTVENXNOcEttclVBN04xaHRUcE5E?=
 =?utf-8?B?dUwxUmpCNXFjQXEzRUhNckNzVGd5RnZsNlRFaWdrcXpvMHQrWHJBOEJVczdN?=
 =?utf-8?B?QnlaaUc5OHZ2R1dVdG9waVEydk9UbTBiYnJYSmczbXVVMmRGdWwrTVcwdTBw?=
 =?utf-8?B?dEJtakd0NGplZlpDVFI5aTFrSTNGdStZeFEwcHhIU1ZVV3JuZnVkRlZ3MC9R?=
 =?utf-8?B?VlNJcmdCSVJDVmYrai9LUVdLU2V4NTd5MU9FeXpBNjAyNmw0NnV6a3FtZ0VG?=
 =?utf-8?B?MWVvZ1Vpbk1zQm5IejY4TW1rZFpYTXRpUkRzcVNxQnpwcWRWVnNJMFI4R3FL?=
 =?utf-8?B?cm9vUVpwYnVtNkZjN05ydC90VFZ4Y3pJaHpnTTJTeGY3VjF5N1ZTdHk1M3Fw?=
 =?utf-8?B?M0lObkdwR0JVZVYxd09zZUQ5OFh3eStxOXRKeE0xRkFMTE9pNEM0VUpjWkpK?=
 =?utf-8?B?WnVEZlNJZTdhL25iUTREbnpTWEZxUlFqMDJtVlNmcXR6MnlPSHVxNUVhNEdq?=
 =?utf-8?B?QkgwZzYybytDS0lscVZJQm5tTDNBS2pGZGJOZ3RCeHlJM1FMRGQ5MDdNSER3?=
 =?utf-8?B?bWZrY1IraU9LdnpEUm1LTDlQT2ttWUpqVE9VeDFLVTlwT2U3c3YxbFVJNHc5?=
 =?utf-8?B?MWpuSHFvU3o5ZDk1QjAveVV4SXViV05ROGMzQ1JnTXhBQjYwZkVyK0g5RzNu?=
 =?utf-8?B?eUVUV0ozSjlnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(7416014)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RU9PdkJuQUNtdVFENFQ0UXhQQWxkdjZwSTV5RyszZHpYNEt6OGJJK3RHS1Fm?=
 =?utf-8?B?OGJlODd6d1RGZkRkUGNrVHFxNXp2dXlwWXZ2YzlaYnhlNlVydS9jUk40ZERz?=
 =?utf-8?B?RGJTY3R0Y0RMTXVzb3NkWXdUV282QWlhdnE3Tm5QWUF3QkEvNDR0K1psd2p2?=
 =?utf-8?B?QXJGNHU1V09xcGNwellWOU9lYXBHa1VSTUcrMDl5bCs2V3YyRXl5cHFzdEhX?=
 =?utf-8?B?cnZGLzA2cmxEcENlOGRQcEhZMlMvZTI0eWpjdlpGcVpRS3YyRFNwdTQ5TEtQ?=
 =?utf-8?B?czZHWWtFRjFQVlR2RkNyc2RERGxXTTJqSVVSQUNFNnVKTytNSlJGd2xzc1hH?=
 =?utf-8?B?Z2NhV3J1NDQ0dzRTOU9DanBHa2xWVWdtZ21RQWlNZTVqUHRjMVRCTGEzcFB0?=
 =?utf-8?B?Z3o4TzA1WUowZ2VvcEcxekJJWTd6b3pjN1YxdUdwUEZyY0FJTm5oTUM1dXBC?=
 =?utf-8?B?cFBUZGJSVy9qVUFBbmRIWnR2ZGMrN1h0WHBNblRUMEhRUkhyR1dzNStFSkNN?=
 =?utf-8?B?QjRtOFJnZnpIaXJtM2p3dEtncXdxRnVnZmg3akxpdklhVGp3VFhlVzhaQkhF?=
 =?utf-8?B?Y3lyb3l1WU5NeFpXeUJSUW5DaHRHYWw0MFJYM2Eyb08yMjBoQXZQbzloZWtK?=
 =?utf-8?B?WlFOU2dXQU5LTis1Nm9tdFVMeFI2d0FKTnZiZUpveU5haXNFYURwaWVLTmpJ?=
 =?utf-8?B?SldXRXN2NDdwMElXZktLd1did2poSnJOVHBoUEZqVis3a0kxdllyUVlrNXFV?=
 =?utf-8?B?LzNRYk1nL1RxM3hFczBrUUI5TlpWYy9ySC9mUlFnYW1PS0dJV1p2M1pOU0hM?=
 =?utf-8?B?azU2MUZqQlNBc1VvK2cvYXpoM084cTV1Vk9Id1d5b2VubWtIUi9maXBnNWhs?=
 =?utf-8?B?TVV5aUFVQm9iaGV6UGFPU0c2TFdBV2l6eG5adDdmU1ZEL2tEOEhlZE1VeXNZ?=
 =?utf-8?B?MWw4REY4aWVyaU1ISEhQN3NCYnl2WCtXRHhSTG9NazRvWCtVSS8xRXRSMzcv?=
 =?utf-8?B?UG1PMVlJRTQ0Sis5QzV5VzZBaUlrbjJ3cGhoWEZvOGlNK3BBOVp6NjFIbktU?=
 =?utf-8?B?c0FMWWtaYklHN3U4ZVNrekpncnd3bGFsbi9BQzlsWTFJMmJnZTNCVXcxN0pF?=
 =?utf-8?B?cTQyT2NtRzB5UXR2TXZzQW1hTVVUU2hVbU1ta1JsNnRvTnNPODJIZFMveEhO?=
 =?utf-8?B?T2lLWjc0ZmF5UkIrVkg4SUlvWlFzeHNEL3duNHRPS3JSK0g3bDNCQ0U4U0F6?=
 =?utf-8?B?a28rbnl0WDVwemVXc2QzRUJhT2xEbWdZb2VUWnRDKzc1ZHdwSndRRFgrbko5?=
 =?utf-8?B?Z2UxWjVWN015d2FFV3M1OUVFUmJDQTk5UmRaRlF2MUwxZWJLWmtlU20ya3h3?=
 =?utf-8?B?SmxMUk15a3JQQTIwR0hGSWNtWWd3UExXZkJ4bUFPYlJpZ0tOa2paU2gwOU1D?=
 =?utf-8?B?S3FGMlhNQUw2OVRhQk8rcGk4VGRvL2ljRWJoaHZVN2VrYWZSV1hQcE9GWDUw?=
 =?utf-8?B?YTZzN2paYXpGZVViaVVpeVhrYUhlWUU3bFBTcTczb2dPL3Zwc1FOWXN3REVR?=
 =?utf-8?B?dmg4c3RybWFZREYwSkhVYm9XMGdvNUFXMGNFc29yRHVqQStMQ3k1TTFBM3FH?=
 =?utf-8?B?bzZ3M0ZydUZmT094ZGJtNEplVVk4TXFBSG05TmJ3ekZ4ZGRpL3E2MGhyNVlN?=
 =?utf-8?B?SW9PbVd2YjhNcWE0SXljUCtkZmx4c3FRb0MwRURYY1hEV1BUQ0ZlTDFvbDl4?=
 =?utf-8?B?ZnFJTzNucXNVVjVLK2o1K1F2QlZJQ0dmWCtxLzE1R3Y5Z3k1SmMxRlFmQUhj?=
 =?utf-8?B?S0ZyNWhlQmpHTm5QQUQxVkcrZkhJUnhudk54SDV0VFhkQ1Vjc1RuSGJ4QmFi?=
 =?utf-8?B?UXIvN0U0T01pcFlMU0V2TXJaT3dsa2dza0dvU0MrV1FJLzFBQ29pY1lTNU05?=
 =?utf-8?B?dTJWTHB5bEN2TGdydkhMNUZsQkJMbGRYcTZuZXlZNnJpU0NhQU5jQW9OUEV0?=
 =?utf-8?B?a0xrRy9CRklHZDBZbEg1M1pGa0NYNExsOG9JeVMrekQrTlFuQjd2aXQyckdx?=
 =?utf-8?B?OEZCdzFHbkExTmVzdmNjNVpaaVlSallZcG5RTHg3bEpTZm5DQmphZDV4ejFJ?=
 =?utf-8?B?M2hVbHdubTJUeFFMTkNyOFJrTlZHY3NWclhkdnk4M2xNSkxXV0NCbVdheEhZ?=
 =?utf-8?Q?CMYRsT/ywvZTxFAp8zleijgqGa2376q/U+/eF6wAtWyp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c7a0bd6-f870-4ac3-1ed4-08ddea2d8f6c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2025 14:32:35.8530 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KZ9AjYGrLoQ7nlcPSuDBYLKwQLS6+1OSx0DwWKpYXznGtbNMcdWOiUGG2k4mJFX4/QwqixPfkRoZSzq4Uw7bfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8955
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

570.144 is the latest available into linux-firmware as of this commit,
and the one we will use to start development of nova-core. It should
eventually be dropped for a newer version before the driver becomes able
to do anything useful. The newer firmware is expected to iron out some
of the inelegances of 570.144, notably related to packaging.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index af7356a14def2ee92c3285878ea4de64eb48d344..9a97e97a3c7b4ac65b66e4e5f092839720ded82d 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -21,7 +21,7 @@
 pub(crate) mod gsp;
 pub(crate) mod riscv;
 
-pub(crate) const FIRMWARE_VERSION: &str = "535.113.01";
+pub(crate) const FIRMWARE_VERSION: &str = "570.144";
 
 /// Requests the GPU firmware `name` suitable for `chipset`, with version `ver`.
 fn request_nv_firmware(

-- 
2.51.0

