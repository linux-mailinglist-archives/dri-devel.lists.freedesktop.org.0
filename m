Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 78CFFCC0E4D
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 05:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C04F510E69C;
	Tue, 16 Dec 2025 04:28:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qDmyJU+2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013058.outbound.protection.outlook.com
 [40.93.201.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7EBA10E69C;
 Tue, 16 Dec 2025 04:28:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MrAyNdAaSp5uAolHpe3y5g2C4/QqtAeiF3NUlaZlEmhqkeTYo+OFbqrR5+d2zW2b6qkYd9kqsFyD+WMvcZ3HvuophFqk2dnc9T6Z81JKZfFKxAGNG+MtiijfgCDALfWRs61UXCXZkeJCAUI07nP79vzxpqCzWgFopKR12MFqZKtJWewFc7XU2soaiMWiam409qYhmKMW9Alx3OvIcaHb3bVeORVAaeygJZXMEn+0FXk43w9MTdSRYP12vPKo1Cu5TJA0LqSqy4nMrL6DaG48clZZ+WAqVag4Uhq8lioPE+qYN+D7plrs81TmU1TahG4nB2AH85RF6fILcep0DarKOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1zeO7s72kBYHeKFwjlt1UCOec7OUIWIRIKIzf8JPvTc=;
 b=Wku67Y0WFTeljt9sajwJ9B2hrb3jqQL7391SemPJIeAA2jhAF78XTdV5RHvWVWj51a1ckQT1zKzA/iuqx+/OAmuVuxRQNluYC1i3cxUsEqIte6pV0nsS9C9vfwUXXNc7aMJfgim9A1FHz+3P6s9qh813CVIWyt5VnrJWFolloCFY9fezSNACKgU9HyiI1ytgQgn5xL73a/xtLvC8icUKHHKDwcMC3ybdYIu6hNSDa9+owd8qVoJV2w6iDHSdG1tv9shtrttwJxoLxRY7UFY0nSgetOUGpFXOAQ7eaqdW/A+CHJ+T+dI/q1iTq+BqHoVBJZa5RPlB22bSeCCx9Pncbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1zeO7s72kBYHeKFwjlt1UCOec7OUIWIRIKIzf8JPvTc=;
 b=qDmyJU+27KfvdTiZlzLpqUtyc4WLG7YGFy7ch9jzDb6KdM3/fjm0XpSUCLFbAjt1LxQFgfieZbiLc4PIYn8PMJLshrcmZPtRUE6qAshT+mbUezxzoKvwF+OlfQXWSRCYpnRo31nV4/WWGoSXDgIqcmY62lF38JFhGMSFj7Z5n1KEBKrViRLF+nISC9w0x9BowW49ys8wtXofFaFBkF0hIFkmAAVBVGV5cth2+GkW1xbq0cj41zAIgkLc6bsqVCHDGcQ4a9xa8FI+7wBMf1SSTpyaKX9FhrMb8lloKKTS5++Adr2Y6e3JqDK6sw0JQYH6kxvUFQSZVqr64mQHsGZtrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8754.namprd12.prod.outlook.com (2603:10b6:610:170::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Tue, 16 Dec
 2025 04:27:58 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9412.011; Tue, 16 Dec 2025
 04:27:58 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 16 Dec 2025 13:27:29 +0900
Subject: [PATCH v2 09/10] gpu: nova-core: simplify str_from_null_terminated
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-nova-misc-v2-9-dc7b42586c04@nvidia.com>
References: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
In-Reply-To: <20251216-nova-misc-v2-0-dc7b42586c04@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCPR01CA0020.jpnprd01.prod.outlook.com (2603:1096:405::32)
 To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8754:EE_
X-MS-Office365-Filtering-Correlation-Id: 0ff75295-50da-4534-4337-08de3c5b7d9e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|10070799003|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0YrQWFZNFRsY0tWd3F3NHF6MVpqRTVvNUFQQ21FVFltYXR4MkZtTnBWTXVl?=
 =?utf-8?B?dUlmZGROVTZXVHRDVmhKMzQ5VjBKMVFNUTNySkxydmpENGJEMUJSMVlML1dY?=
 =?utf-8?B?a0pTeWhxdU1LSWI3elF2M21kSUVDNzY5Q1EvRUUweTNPRkM0TU5DbHI1dzU0?=
 =?utf-8?B?TTFiL1FxODVNZjFicG1ZQ0JvQU55Smh0dHFJRXRSWmxOK1d5ZXIyQ1VhN0pO?=
 =?utf-8?B?SWJLNW1meVR4Wk1XRjc2WkJrOTQ0Qm1DNWZiU1NoYTRPMDhIZkc1MjVHVGFj?=
 =?utf-8?B?R2lMcnlRSTdTMHRwd2oyaHVQWTBVbEZCdVZSK3o2aXhoa0RsR0NwQWxhMUNq?=
 =?utf-8?B?bGl0blk4SmVBbDkzcVdraDhTT1VWTWpWSkROUWZhWVhVL3RDbjR3Yi82cmxJ?=
 =?utf-8?B?OW8vczFsT1RsYzNhY2RCWWEyMzd6eGdOU2tCYkN3aTBDV0ZXUEk0M1JZYnI1?=
 =?utf-8?B?Vk5qVWRhQ3ZoaTBTZjB0RXlHTDBjcko4NEJiYnE1NUVWNnpma1ZPZEVROFZM?=
 =?utf-8?B?Q212NWRGR2lIbFh6S2FIMmorclJpKzEyVG8rYnQzV1YxK3g5RUFpUXdqTEhW?=
 =?utf-8?B?Nlc5aGRwNGkyOVVhRXhtOFkrNmJoN2hqSHd6RG5JcFo1cEdKaXNjaXFZRnVT?=
 =?utf-8?B?akNoTFpvU2YvRjBOSzVNd3ltdHJhR2wwNG1hUWJhTkw3dVVwZVJ5K3ErSlVV?=
 =?utf-8?B?WEJDTmM2Rlk2OXRNR1JFRThSQmNpMGphamtlL2lhU1JHMHhRc2ZxTitBQlE4?=
 =?utf-8?B?ay9Fak5iUGlnM2pSbEt6VER4czlkSXRhSWkxSm1IWWxzVlZBc21iOFFIZXdB?=
 =?utf-8?B?RmR4Mzc2THVodEI2dHIxb05ITWl1OUs3Q3pKZ1crNkgrNVdEa3hobkd6UEdn?=
 =?utf-8?B?OTZTOVIyQk5FNG05dkVEQzJEbVVGOFJTb0loV2NTMnZzY0lia2ZNaUV0bkh3?=
 =?utf-8?B?aldhN0F1TzNvR0ZXQzJrYUU1ZzRYUXduU0FSQ3dMQmVyYlJBS0tUNDN1SzNm?=
 =?utf-8?B?d05wcXlnVjVubld0d0ZTYUIzczZoVXFOeEtKQU53cU52VkpzaHhKN3M1K2l1?=
 =?utf-8?B?OGpaWkZqUFJNaG1QUVRWTzRVZ2ZidnBDdDdhQUNud3BFNmVzU2RJUmtEMU5i?=
 =?utf-8?B?alRhUS8vWXFjd0Erc3Y4Z1ZWRGxQOUhNZmw3eEZLSndHNlVhUGdWVjZRWDlq?=
 =?utf-8?B?NUkxdFVCR1E3MS9SbDcvL29UWC9laUR1aFJkcGZ4akN3S1NWUkdjWERORFly?=
 =?utf-8?B?SEpMd3FSNlZkeXRkaEM5R1dBZnkzQTIyYkpENjcxOXpIWDdQdkpFak9VNG1C?=
 =?utf-8?B?bE5CM1ZESWdZdm9jN0pLNXVKS2E2cVVHQVdTLzhjWnFJQ0FGTmU5VDIxWjRZ?=
 =?utf-8?B?dXZ3Q01VSkYyT1kyTy9Vb1NUNGNnbXBvcjZyQWxkM3RuSWR4aU9WcEp6Vjdz?=
 =?utf-8?B?WUlJemdFbEFML01jMHZhYnU0ZXBvOFBXNHlJYVpKUnZUZVZsSGIzOXdpRVpB?=
 =?utf-8?B?SW9rVmcreHdtZGF2TjJFc3pzc1RiYXlhMHVlM3Iwc1ZTQ0NqeXkzK01LcnFH?=
 =?utf-8?B?eEtSRUExWU9uNzJXRTJ3aHNOejdicGRPcUxPWkZRT01wMEFxbmt2SWpHaHhm?=
 =?utf-8?B?UlRwNGl2VTd2ZXhVbVBlREpNUlVIUnVWWjM1Qkl5K2thckMvMmtqdmYzUkg4?=
 =?utf-8?B?SGVnNG15NVd4WjBqWTl3cnJFaDJjVjc4RTlhTDFMbVFLcGRCcElteVZVQzVJ?=
 =?utf-8?B?QTJmNERhdUJqOEtlekQ4V1hHcmtjdEVXamZtSjg2QU0ycXVPYVBHSUdmNnUz?=
 =?utf-8?B?b2xDcDNtNWN5SEhOUUlDdWpmSHYwUktFaXlSY0UvQ3RMN1ZuVVFZQ2E5VXhZ?=
 =?utf-8?B?bUlzd2dhUXAxWDk2MUp1cWdpcU5sODFrVU9iTWFWd0NYdHc2YVJlUTB2NUh6?=
 =?utf-8?Q?CE7ewjLxq6DT9Ns9FKIvcIjOxXvY1u3l?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(10070799003)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WENiV3pxUDh3N0J0SHc5S0M1Wm1Bd09xSEowdXhGRTR2UWxFNk15bnZmR0Va?=
 =?utf-8?B?dFpTcDBxQi9wYkNUZmdLdmdMOVdkM3VTK2t0QVdiRDdPc0tabmRDeERKYlVt?=
 =?utf-8?B?OWo0Y0huZ3pXNGN2UzNBRHpTRmkxM0lScFB3Sm0yeUdVWGV6cGlHbzdCUGFL?=
 =?utf-8?B?cnNJc1RWRy9HUUl2czg1OUlHNk1IQ0UrTlVRcDBQZHFrRG16eDZIdytjU3Av?=
 =?utf-8?B?UHFpaDRXQ2s0cTNQM1FOem9KOExCMHduZlk4U1hrUzcySTJsZ05xQ3ozanlv?=
 =?utf-8?B?YnNFdHZkeUFMOEtNS1pWSzBJWkZmQnhCU08yY2JZZjZmR1Rqb2Y4QVNvZDhi?=
 =?utf-8?B?WW1xMVVid2NuVmlBc0J3R202d0Rub25yRlhzTXFMN3ZvdjZGcStoaEgxZk5u?=
 =?utf-8?B?NUJRaGZQNGljMlcrMWp5bmNyUDVzQWhrKzVMWTVnUVJvMmdoZXRqSlRpQ080?=
 =?utf-8?B?dFY1ZDA2aU45THhvR1BBdGpLbE9pZTlqSy9YT0RsWWZIR2t0STlhVFh1RUJP?=
 =?utf-8?B?Z0Z3eXF1ZnUxR3A0VnJFa2FqR0VyeGRaZUpwazgva0dHVFNqOTJIK0ZWM3Yw?=
 =?utf-8?B?RnNQbmowOXFvUzBoWlE3NVpmRVRabE5WOEJkT09vNFJuV0NGQ2RRWHVVcEY2?=
 =?utf-8?B?MXhoTFRxamtncHB3OGdEWEJ3MjNWb00vcGJwd1NHNHN5cFhvYmNsNndnQVZO?=
 =?utf-8?B?SXJFbW9oQUZGUlMxSVJWek16RDNzQmpVc3NuMWpxNnlDbVRETmVRZGRIb0lZ?=
 =?utf-8?B?aXNOUTQxVE5SdERIdnJpNnBwNkcrWHN3aUVid0dQZmJQNEQrV05VenZZdmVU?=
 =?utf-8?B?RFNkWXEwWDFXRGpzYjBnbHRVNVRMMGFabDlOT0RTcjArd2NjaU1ObkNqZ0ZB?=
 =?utf-8?B?VmZNQXZzOWhlK1kvaUE2SEY3Mzg4MHdQakRYandoanNXQVIyWjdrMWF6dzRl?=
 =?utf-8?B?bnZBNmJnelp2WG9HR2IvTmVUMnBkTTlabzNjT3FNNVRLbENNOFJRVnFOMnZr?=
 =?utf-8?B?cTAwZ0tacFgwSGpoV2FmUWJxbGpmeFh4Y3dnSE1hU2NUSE5jWlYwbFhVZmpM?=
 =?utf-8?B?YWlKbnJHMStWaUQvZmR5MmVXa3ZyNlFPTjFQdHdxOGJUaDNVQXFvMForQUNS?=
 =?utf-8?B?RVcyTjBFNG1hekdzbmZCeVZwQlEzbk1nWFJSR3FZWWFiZ2hkVks0dWNUSXIy?=
 =?utf-8?B?QWhHbUoweWpvUDE1bW1QaUxqblRxRDJJOTdJZUVHdUFZUTFsdys2d1JiMGRo?=
 =?utf-8?B?Qkp6ejlaZU1lZ1ZjZTVGNWZjbGdiWmlBcFNHNm1uamhXejlQa1V4S0RLTmF2?=
 =?utf-8?B?Z2xXSGV2dEtRSDNhaUU1YjR0Ump2REo5THJFdlRoclNBbld2MUdLc3JMTzVo?=
 =?utf-8?B?Tm9nV3pRZmNtRlhRZENhMkpYTHI0RkZZVTg1cWxNcDd3ekw1QlhUUTBVQUFx?=
 =?utf-8?B?ck04azF4Nmt2RUJOcXNPOE9kTHBuaXVzT2lpUXRhSHlSWWNybHpoUjM4alc2?=
 =?utf-8?B?a2I1blNqc0VUZUovVFEyQ0RTNHFQR1JTb0xyc0JKMWVLekFnclVFUWt5aHdZ?=
 =?utf-8?B?ZGd5cXBWYjFDN3Q0ZXpWMm8wRFZ5MHJ2bDUzRmZrczZSSkljMlFxODdZQmRq?=
 =?utf-8?B?emo5dmhTWUtjTm1Fd2xMSUJvaUp6OGt1TWpySWlCV2t3cktjMS9GZm9rVkJG?=
 =?utf-8?B?L24yMEY3MnkyS3BoelBmdjFUMXV4a3lZdjR6OTh1emdDVDdYMSt2RXdrdUZZ?=
 =?utf-8?B?a2dsZjZJbG5LZzFVL3hGZkdzVkMwMG0wRDJTMEVwakNmRHlaT3JFS3dqeCt1?=
 =?utf-8?B?Q2Zta0NydDV0ZGRGekg2Vzl3RExMTWswbitTS3RrNWZHR1FzYVBKMWtLQnRK?=
 =?utf-8?B?akw2bittQU1HS3ZKMGo0R0FlQU1kMzJ1MjRBdDZvVmdlcDdoVndHMDVYeUUr?=
 =?utf-8?B?cXRIb0dHQjhHYnA1UzhEYlU5WExhVXZNZ3FGNEdVZmZ6V2JkMEljL1ZTaDVT?=
 =?utf-8?B?WG10V1QvdGNGRjZKNlpWWDJWbndtcWJuaStWdEIzY0o3QVNKb2VOMVVoV1hP?=
 =?utf-8?B?VmxReHpvNTUrdElQZmp6bkJJZnBXS2J5UVhheHhJdXQ1SSsrNTMzdUViSGR1?=
 =?utf-8?B?ZldoZVNGQzVDM1BBSThnYWtDNWFadkZGMWZjUENVL0JFb2tPa25HdU9yTTIv?=
 =?utf-8?Q?vvMyMYp7dv+I4TusH+LZRsztybVmeLPY01uEVqh9UHXF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ff75295-50da-4534-4337-08de3c5b7d9e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2025 04:27:58.1392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 61qgtmpMRCmPRlOgXXoEF1XFZUEo29FXD2p4PdYIyd1oJUrWsvu/a3cjk/V1eoeZxxh0EzINrVAHfxiA+x61gg==
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

The core library's `CStr` has a `from_bytes_until_nul` method that we
can leverage to simplify this function.

Reviewed-by: Lyude Paul <lyude@redhat.com>
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

