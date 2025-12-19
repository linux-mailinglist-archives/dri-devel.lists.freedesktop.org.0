Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA132CCE5D2
	for <lists+dri-devel@lfdr.de>; Fri, 19 Dec 2025 04:26:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C751710E156;
	Fri, 19 Dec 2025 03:26:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mkliJqlp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013019.outbound.protection.outlook.com
 [40.93.196.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF76810E156;
 Fri, 19 Dec 2025 03:26:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NQcN6JrdWX8qsNxmV4Uhq1onpLaMpuF/ZciDgEPeh9qAIYfNKwlduuNBesJtgcAWTRCAQrj/kmE1VcwJfnihBvz+9/Hd0FGHrDPNxyd24WGzli0ZUEIQXjU2kd6HSig6vk7mUmVonW+4aHNdzPJztLHvHoKofeVSD3ie0k2lRUdVB55bFcGRtE4SVYERIEh0dwDKBT3wEfsoqk15Zqc5fA7GIFwR1EYIeQEKaj7Ym7G0LbeS5Nad3+Ss9wwE/8yk0uAmR6L8v7GHLloKB3BBgH084XneWBUpnJIiWvobjda6E0RDhYq2EoQ4WVzROOsRBqe8uCBoYHquzkzZ3PNTBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x32PQP1WQ1Q7VRtzlDF2TLJc+H1Fh4ZfCYc5+f+KhEg=;
 b=ydwNmGdBRADAL3DYJqh1uI+IMbBPhMGfHZazvYjRkVIDxoGDUBuM4Do7tDQMzR1fVj1zvYERShREznf36biOwqL9v6vG74+/Zv1RJJA4PgQj0z8rZDqbVg+M1QadDQw8SeZ4X+tUo9PCAOzhabni3XeGqzCm9q1dQdTYRPA0mXDqLbLkbxnnDsgm+4IV9ITa4ovWWGm+oPxSoxBH2nPww7Gezwcyh3h8NU7Kln6QKrUqgh8fILt/WBP5GajBZGSskvRc0jDGrNOXUlQuRB7fnhFk6mqE++Lkz+ljimTh3YqYwN7v22Znwf1dAA1cGxSRymuQVrRL6fWT8lbHg7+ogg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x32PQP1WQ1Q7VRtzlDF2TLJc+H1Fh4ZfCYc5+f+KhEg=;
 b=mkliJqlpSNPtgWoLs5zkOosylqQEpqIg2XASblM9RV6QykxIT4tXPqhKn34fJxPkxkbUdCl+1W+HdvWKCCGzvXnNLJ8ykzVL7+MhZxIjkKszL9oGU2GoX85o1RpQUEeW/kxpXJv+m3jk6LZs5207Xx7MzNU0Uitwe6/fqvxuBvKWAkVcJs7LOaERh4YCo6Ia773Uo6+C0GCVcbkdtfIMQz5etDpQJQtEeDmqJSFP43xNVmSlDAPwwaEMYa9OqGkRGpvYSs5oj3EgOvjunMug+3V1h/A0LXHTeRX6FkPH/uL6+5k1d3JeNkQpRvYolabz/e0P1bEmiMExwmhY6MhtJA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM3PR12MB9326.namprd12.prod.outlook.com (2603:10b6:0:3d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.8; Fri, 19 Dec
 2025 03:26:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9434.001; Fri, 19 Dec 2025
 03:26:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 19 Dec 2025 12:26:24 +0900
Message-Id: <DF1VFVC7OQJ8.1FOMG6C5M2I8V@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Simona Vetter" <simona@ffwll.ch>, "Bjorn Helgaas"
 <bhelgaas@google.com>, =?utf-8?q?Krzysztof_Wilczy=C5=84ski?=
 <kwilczynski@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Alistair Popple" <apopple@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-pci@vger.kernel.org"
 <linux-pci@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 6/7] gpu: nova-core: send UNLOADING_GUEST_DRIVER GSP
 command GSP upon unloading
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251216-nova-unload-v1-0-6a5d823be19d@nvidia.com>
 <20251216-nova-unload-v1-6-6a5d823be19d@nvidia.com>
 <C890CCBB-76C0-4E70-A7B8-846E34DABECE@nvidia.com>
 <DF1DLWE9OOR6.2P43ATQYNAU3A@nvidia.com>
 <47F9A9AB-42B5-4A5C-90CA-8A00DD253DA7@nvidia.com>
In-Reply-To: <47F9A9AB-42B5-4A5C-90CA-8A00DD253DA7@nvidia.com>
X-ClientProxiedBy: TYCP286CA0214.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM3PR12MB9326:EE_
X-MS-Office365-Filtering-Correlation-Id: 82c68511-9d38-495a-4b69-08de3eae653f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eWxEVGZ4eTNyTWN5VW9vR0VpT2x2UnNoZDd2TU1rczJ1VTlibFp1cTdiS2Ev?=
 =?utf-8?B?dkZnWXhjeUNYcXQrVzh0Y3BtaitmQkhXY0NHT0RnNTdWYTN5Smt1U20ra2d4?=
 =?utf-8?B?WUFrSDVzRnEvUFZsbk11RmRXeENvYVViZFpwS3FLeHRBOThZV1k3RzRSeTJo?=
 =?utf-8?B?OW5ESkVsb3d5UzJiMjdRK2hXcC92TS9CK3BSTjVPOEN6MXpsYTNKRTBacXNK?=
 =?utf-8?B?WlRFT3RyMnFDNGxuQk1MRDBtajMvT3NwL04vRGpmREgzeHhXdDBvLzBYWU84?=
 =?utf-8?B?YWJUMGM0OFRBRkhPQy96bEtIVkpZMUVOMHF5S3RWM3RiWU9QbUR3WitNK3Ux?=
 =?utf-8?B?NjlFRmt5UXkrcElnTEVPbFVlYUszWmZSM1lkT21SelVON21WRS9qUVZPUmtm?=
 =?utf-8?B?UGZTRW1aUWhCWDNudW1PM1lGTE03cUVYcjh1aWpSOTFFOUlCMlBhMzdFYUtL?=
 =?utf-8?B?S2tYVzgvc2F1RUZXZVJVQjQ2WFZYNHVlclFEQ3lDZ2dwTWlXVVFKdCt1TzFh?=
 =?utf-8?B?N1Q1N0lERDRzWWFyUmRjNWlXcEozT1VWQ0lETmNmY1pTUHA4K2g4cjh6SVhq?=
 =?utf-8?B?WXVydHNWdkRUamRHMWIyR0R0T1ovS0J3RmR0MkFYbC9LbWFSdjhOd1VVNW9C?=
 =?utf-8?B?ZTRzMStTOEtidDJpVVVVVC9hRkVPaUo3cDlmcE84N0h2M3FobmQ1S3pZeFd4?=
 =?utf-8?B?Y1ZDcUVQN3Y2alp2aTFpVEIvSU0rYlFEVWlKd01lU0xNbUg1d2czZVhHRk4r?=
 =?utf-8?B?dDBPaFRqdTRTR1VDOVZYYmNiUTZmNjZHcC9wRGVpdGt5US9PSHVJR0lZVVh6?=
 =?utf-8?B?Nk5COERPNDUvNW5mUXdjM1NTcTFBVG9LSjZYSnJzOFdQYzNuRjJjYzE0akJo?=
 =?utf-8?B?TEQrU2t1ZVg3cUhQZGJUNzdya0swcEhiWEQzQUlsdHkrSjlRdHFFdWZpVllU?=
 =?utf-8?B?VC8rbXFDaTV6NGxMWTdKOHE1d2tqMkxMZXNBYXRYUWlyaEk0R2ZYdklnQ0FZ?=
 =?utf-8?B?MUQ2WlRMZjNkL3FUaU1ENXo0d3J5dkhldHYrdHZscFozanlsNFRmVnQ4YlVR?=
 =?utf-8?B?aThabm03OWhGOXF1M013VSt4MmRoYU9MdFlsdHBQb2lFS0ZjNHpBYmZZeVd6?=
 =?utf-8?B?RHVJeWdocUF4Wlp1SHlFRW03SWl6Q0NTeGdkV3dVVEJCVjQvWnpiYnFvNDMr?=
 =?utf-8?B?QU5rQ3FjUzZ6bU53eENBZFJCQjBJNUxWU3JXMEN1Q3dia3ZSRm5JYnF6bEg0?=
 =?utf-8?B?SXJpMzIxdXpEQjJma1BmRU9URXl5NkVSbUxQRzZrMGh5cThyREx2OG5lenhJ?=
 =?utf-8?B?REI5cmR3UkxTSTRadUN2dEFXeDMyZy9OdFJxT1hzdFZkMEFmS2M0WWN6cVh0?=
 =?utf-8?B?Z1JqSlZ4d2FGdGxSeVNIRmxUUmpzMWdKMWxjakpsbVB6bWdsemh3M2NMQWZG?=
 =?utf-8?B?QWpXa3MzTndVMXVpaXdveG9sK1J4ZG1RK3o4bXVXNmlubjlCd09TY0RMeDkw?=
 =?utf-8?B?aHJ0Syt3Y2EvQkpYaFpST3N4RkMwQTlQOVF6aVlVTmZhRktRalhwaXovcVRH?=
 =?utf-8?B?RjFKb1h6SmU0WmpiZzB3dkNFRzE1b1dObVB2akVzRStjZGJVOEFZTWxHcG9B?=
 =?utf-8?B?dWE1NEQxUjJzTkhrMGVONEc2Ym9GenNIR0t1amtNM2xyWmV3VkhhSFpjeTVw?=
 =?utf-8?B?dnpsK0hhS3JCL3MzQlhWcGZJSHhER2JMTk9QWW5wN1R2SGp0RHNRL3dWVjlM?=
 =?utf-8?B?bFhrdnFwRlhVQ3AwcTZFNUc1WWxrNVo1NDMzcWVhRWFuVGlDNUJlYXAzekVZ?=
 =?utf-8?B?Um4vZ1AvcFE4aXk3TEVxcjZhSklueHh0c1F4Kzd6T3hnclJnMlpNRDVia1Fa?=
 =?utf-8?B?NU12aEV1WU5KRUxTUmNURlZvYXpFWUhPWkxjaU04Si9RSHBBTUUzaWR6Qytm?=
 =?utf-8?Q?Y1qB0AEkuFcyPI7PqR3hnJU/PlSigiHQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YWd4NnhjRExMb3J1UmlCZmdwUzJKakwwWFY0RUsrdytnaHVRakY1V09Yai8z?=
 =?utf-8?B?VndDRWl1WjIvdzNML1BEMGllRW96OFpIMXdiL0l0QU1UcVRVV2tsZ1VIVDNQ?=
 =?utf-8?B?V3VkV20xamJxT003OTRKOERDSUgxS0FWVHFXZ3FtN0JubGpvcXFLZ0lKZ0dE?=
 =?utf-8?B?aG1wRzZEb3I5QlFWc3BzQ2ZRMFZOVm8yeWxhR3hMTy9QWFk3bysvOWREbGlr?=
 =?utf-8?B?TE5aOXJ4UkYrUFJ3WGFVVUZsU1JXNWdhVThRQ2VQQWNWdjFlejYvVWVPWkRL?=
 =?utf-8?B?eDJ0eVdaSGJ5SWt6b01XYXdBaGRTdFIvV25hbThkWTQrdVVPQ210VkY1bFc0?=
 =?utf-8?B?UzJ6VmtrODBDaUhoWlM4Sk5JdzhyZys5L1I2eTBSUEFLVHlkb1V2d0NyZ0or?=
 =?utf-8?B?Rk91MEM2RVdYdW45QnFydDNxZVBlMlgrcXkxSDVMOU03bXZMekdwTE5RbE9X?=
 =?utf-8?B?a3JwMTRReVRDb3A3dEJ5RjF6NFNsbHcraUc4eURtbGo5RGR3OU51QWRTczV5?=
 =?utf-8?B?YmVDUXRPd3ozSFZpZlNvOFVPeENabk9Rd0ZSUGZPUDEydS9HRGdtSkZybm5v?=
 =?utf-8?B?UzFISUZ0WkM2UlRaTXRsVTN6RW0xTVF1Z2VmOHVvV1lRTmo5RGxkZVRBYUI0?=
 =?utf-8?B?ZXZBclVyYmZRMmRNQjhWVnl4WktDUmNUelBsbG14TGh5Zjgvb0FiK1diUndZ?=
 =?utf-8?B?VkpaNkphaGcyMTd2OUQvYmowd0QvM3JJTXJCVHkwcHFnSHJ1NW9VZThXSmFy?=
 =?utf-8?B?d2xEdzVmYTBWK1NpNWh2K1kvemMwcVhNb3pZVjBFaGUyNFl1RG5jWUtTMGpU?=
 =?utf-8?B?M3ZhTStYa3lhVEJ2TG1WOGdJM0ZDZFVvSVVLWVl4cEpMN0lxOWZzTFVRTEYy?=
 =?utf-8?B?SUdkL1dzak1YcGVUOXgvWHFiZnNkOWlIL1J5b3FlTmtyemg1WFhBc2ErUzhB?=
 =?utf-8?B?ZDUvaXpwRVVLYW1WY2FJRmxQT1lBSDFYdkZjVEpYVk1VcC95dXgvNjc5M2RN?=
 =?utf-8?B?aHAyQ3E3TSt1T3ZDWUx6cTVwOHBlUmFtN3BTclJKOWJ3SWxoODZmUVpiTXNL?=
 =?utf-8?B?TGcwNHZ4anRJZXd5bmFBVzQwUktrelZnWGFWK1FpdFl4RWhoRE1vTWtnaVJ6?=
 =?utf-8?B?Rnl2NFZVdE83MkpMZVB1WXFHUDliSUYycHJ5Snc0OTZGZ0xMbDhlb2dwcDF3?=
 =?utf-8?B?S3pQZkswWE1mODd6NlR4aVVhTVRlNG95R3hxQUkwQ2ZnQVpCWmgwYXM3S3hs?=
 =?utf-8?B?YmF2cEFmUnQzcGxlK05MYzd2c0JwVVpOUG8ycGlrd1VrdEVEd0c0N3VpTkhn?=
 =?utf-8?B?a0VLOEtLdEtic1ZQMWFIOXN0OU4vc1cyMUR0UmVYTFAwVGx1YUNKSGNwTENm?=
 =?utf-8?B?RVA0VEZuSG9kbzN4c3R0L1BLN25GZVV3OHBWOXNrMWtJbEt3MjdOdXVpSVVy?=
 =?utf-8?B?R09PMzF0cWszbXI3NlBMYXR0NC9CcUZYNkhjR3pzRitIMVFESm8xUU9XaDNJ?=
 =?utf-8?B?VzhzZmhOVlkzMzVTSW9PcGovRC9rbXZ2dTFocnIvOTZ4eXdLNExBMldqYTY2?=
 =?utf-8?B?aFNhUGs5NEl1cWtiTDJhYldGM0NIRVAwYnRiS2dhUXFOeFVOWTBRN3lsRUw3?=
 =?utf-8?B?cU5TR2hxS1c2Y240MDg0bk1qVG9zUTVrTHBJYlo2NkVIOFZvMnB5dFY4UlBG?=
 =?utf-8?B?SEJiYkpUdy9rV3BrREpxRHFTYWJWZHFpNis4em5QaFVJNWtmUUpkZ1NWSk9z?=
 =?utf-8?B?VmkrZnpmdm9QVU12d0x6V01NTnptdlI2b2YzbXU3bHJiYTIvTEJuSHdkNEln?=
 =?utf-8?B?amZpakpvK1VvVmZyQjJOcDdiM1lGR09BQ2hJTXk5STRHOVFndnZ1WitxeVFw?=
 =?utf-8?B?aG9WaFJ6VnFkUnpLRkhKWS82S056OFAwOWJGcWJsdmZSL1RZUTZnejJhZmFZ?=
 =?utf-8?B?cVZwaTlyajZLUjN2UDl4U1cveHJQQWhSekZ3UDRCeVRDTkNjckxBSkZaWmNJ?=
 =?utf-8?B?aEZneFJvRVM5bUFFTFZBbWIvR29ZMUFCc2Y4TitMSktubFFwWnZYWE1ZSjZU?=
 =?utf-8?B?QmwxdnQ2NEF6OWJqeHNnd0ZDSWhhRUlyb2dtcDBORmh2b00yYUh6YUFITjlY?=
 =?utf-8?B?ZnFFS2VLN0o5SlJxZnhEZ0c4TmVYVkdPY05PaitGeE1HbXNvRUdPR3hrRncy?=
 =?utf-8?Q?05CvjareJJVW+FeZTUQRGSSdlCAe1SI8VT3euUB40wzl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82c68511-9d38-495a-4b69-08de3eae653f
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2025 03:26:27.9536 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ybUJ0I2LQ//kMlfPTC6uA4FcJNqkNxh7XNEArBRPHcrReffuvZ/5fRXFV9n63PdsE/a4B1Atu/FiAt37YzMQDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR12MB9326
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

On Fri Dec 19, 2025 at 5:52 AM JST, Joel Fernandes wrote:
> Hi Alex,
>
>>>> +    }
>>>> +}
>>>> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/g=
sp/fw.rs
>>>> index 09549f7db52d..228464fd47a0 100644
>>>> --- a/drivers/gpu/nova-core/gsp/fw.rs
>>>> +++ b/drivers/gpu/nova-core/gsp/fw.rs
>>>> @@ -209,6 +209,7 @@ pub(crate) enum MsgFunction {
>>>>    GspInitPostObjGpu =3D bindings::NV_VGPU_MSG_FUNCTION_GSP_INIT_POST_=
OBJGPU,
>>>>    GspRmControl =3D bindings::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL,
>>>>    GetStaticInfo =3D bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO,
>>>> +    UnloadingGuestDriver =3D bindings::NV_VGPU_MSG_FUNCTION_UNLOADING=
_GUEST_DRIVER,
>>>>=20
>>>>    // Event codes
>>>>    GspInitDone =3D bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE,
>>>> @@ -249,6 +250,9 @@ fn try_from(value: u32) -> Result<MsgFunction> {
>>>>            }
>>>>            bindings::NV_VGPU_MSG_FUNCTION_GSP_RM_CONTROL =3D> Ok(MsgFu=
nction::GspRmControl),
>>>>            bindings::NV_VGPU_MSG_FUNCTION_GET_STATIC_INFO =3D> Ok(MsgF=
unction::GetStaticInfo),
>>>> +            bindings::NV_VGPU_MSG_FUNCTION_UNLOADING_GUEST_DRIVER =3D=
> {
>>>> +                Ok(MsgFunction::UnloadingGuestDriver)
>>>> +            }
>>>>            bindings::NV_VGPU_MSG_EVENT_GSP_INIT_DONE =3D> Ok(MsgFuncti=
on::GspInitDone),
>>>>            bindings::NV_VGPU_MSG_EVENT_GSP_RUN_CPU_SEQUENCER =3D> {
>>>>                Ok(MsgFunction::GspRunCpuSequencer)
>>>> diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/no=
va-core/gsp/fw/commands.rs
>>>> index 85465521de32..c7df4783ad21 100644
>>>> --- a/drivers/gpu/nova-core/gsp/fw/commands.rs
>>>> +++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
>>>> @@ -125,3 +125,30 @@ unsafe impl AsBytes for GspStaticConfigInfo {}
>>>> // SAFETY: This struct only contains integer types for which all bit p=
atterns
>>>> // are valid.
>>>> unsafe impl FromBytes for GspStaticConfigInfo {}
>>>> +
>>>> +/// Payload of the `UnloadingGuestDriver` command and message.
>>>> +#[repr(transparent)]
>>>> +#[derive(Clone, Copy, Debug, Zeroable)]
>>>> +pub(crate) struct UnloadingGuestDriver {
>>>> +    inner: bindings::rpc_unloading_guest_driver_v1F_07,
>>>> +}
>>>> +
>>>> +impl UnloadingGuestDriver {
>>>> +    pub(crate) fn new(suspend: bool) -> Self {
>>>> +        Self {
>>>> +            inner: bindings::rpc_unloading_guest_driver_v1F_07 {
>>>=20
>>> We should go through intermediate firmware representation than direct b=
indings access?
>>=20
>> Only if the size of the bindings justifies it - here having an opaque
>> wrapper just just well, and spares us some code down the line as we
>> would have to initialize the bindings anyway.
>
> I am not sure about that, it sounds like a layering violation. It would b=
e good not to keep the rules fuzzy about this, because then we could do it =
either way in all cases.
>
> Another reason is that we cannot anticipate in advance which specific hel=
per functions we will need to add in the future. Down the line, we may need=
 to add some helper functions to the struct as well.  Also having V1F07 in =
the name sounds very magic number-ish. It would be good to abstract that ou=
t with a better-named struct anyway.

The rules are not fuzzy. The only thing modules outside of `fw` are
seeing is a struct named `UnloadingGuestDriver`, and the name with
`V1F07` is not leaked.

Even if we had a different structure, we would still need to write the
rpc_unloading_guest_driver_v1F_07 at some point, so we would need to
refer to it in `fw` anyway. The current design is not any more lax than
that, it just removes one step.
