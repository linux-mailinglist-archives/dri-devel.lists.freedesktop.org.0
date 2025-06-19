Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE798ADFE76
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 09:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BC6510E9BB;
	Thu, 19 Jun 2025 07:14:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VwZaUpZq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC3310E9BB;
 Thu, 19 Jun 2025 07:14:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M9wuwqLi6rtiXVOKEHsOXv7bTF2IZp9o6rMw5N9SjOx9j2Dd+zCHtXaSuVK52bmF94+4kpwb5Lp+PbvQ5IKT9pxfhCQ4BOHZdVrzXT9dRfdrS4NyNvMhbUXrzHaED/36mzsE6xwK98imcDggnziSpVxe/NGy/qbqU5RQxnUycuzL3KY1WH09vHU8oYJj+RzMe+gCdKdoLPa44ok3kDFgGB4LcHeUtrwgO1NIxWq9cTVRLSzDZiAWMMhh/3lIJsL+PcZ/7/cBZWVXxhRin+4D5dhWvCMyPU23bhH3/u4H/6rr9aphywVy4FMYgYEVTyJAWQFsjX9JN5XCb7I0kVZXDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZqPWN1i2wY1zeIkqUr6BelZrFeDu9RJw6OjMYUjCIVg=;
 b=iKH1qIeOuYbqvtIQcyY/A4gqpN0AyX1PwY9e5loMFSF9gF9IeyznRynStzHAY4cjtpz6a2UHOQ06psQeNZgZe4CQXJmPwPVQ5z9ArLrSLNkn4om7FaUq1UYL0Gia8uJn8AHtTuPlgptoY1L5nH//PKZIg3l5QDI8C0tf3U75L+q8qzJhrRDjYVwC1DK1T8e9Hi6oRoSpH0Zn7+k5MdGMUXXLcTchyIhfy3iIk2yZ3KUpYm9cpRLs8zLH3KeKkOA4AVXxDKBgZ2kYkJydOOzG+4CxdqC42G0Zwm01YKX1jt/g578NTsKdQXuSDyqaRvWKR/q59ZO3/fwuy10VGp2r9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZqPWN1i2wY1zeIkqUr6BelZrFeDu9RJw6OjMYUjCIVg=;
 b=VwZaUpZqadNrIg4b8fkB4Epzn1gQuso4bRxAfi09/c/DgM6rUDvcTzQWCTa1RSOLhz23bKntCn6Y8XYl2NTEZlPpoBoRDhZ9/t/GSFGGz4eAoLK+ESKuWUiO9jmCnN0zp/TkJEuzawwjKI7ezuHeKnHYkzlRtkPOOCVSssgNwZBA4hEsT3GhDH1Ly5W1g8p8xuXRV+ZtkXuCsjWR0TFBK0BIsF19jdHN2vYNQabeacEdtBqdSz6Tv8mjQTRJMAITvZAyzOmi2tAy8QFS1EgaKNZh6gGkhQHAfC+WHg8+qDxpVZStnFXdUQqQAl3zmrP5onclVow+FotCdtd7CwclWw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB8474.namprd12.prod.outlook.com (2603:10b6:8:181::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 19 Jun
 2025 07:14:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Thu, 19 Jun 2025
 07:14:05 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Jun 2025 16:14:02 +0900
Message-Id: <DAQBOGIUHI90.2NO9AVT4IRDTY@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Benno
 Lossin" <lossin@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>, "Ben
 Skeggs" <bskeggs@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>, "Lyude
 Paul" <lyude@redhat.com>, "Shirish Baskaran" <sbaskaran@nvidia.com>
Subject: Re: [PATCH v5 00/23] nova-core: run FWSEC-FRTS to perform first
 stage of GSP initialization
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250612-nova-frts-v5-0-14ba7eaf166b@nvidia.com>
 <aFMeJZuXsBRhUxJC@cassiopeiae>
In-Reply-To: <aFMeJZuXsBRhUxJC@cassiopeiae>
X-ClientProxiedBy: TYCP286CA0226.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: 9231aa64-5e32-4660-8603-08ddaf00e00c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZWNkdFV1cVMvbmFhMTB0QmQ4d0N5YllUWDZVS1ExME1VaklXQ0FpNWJENDY2?=
 =?utf-8?B?VXdTLzhQL1MvTnRxKzZhVURZM011S2tScGpFSmhqbHNqSHdqM1I4ZXN2SWpj?=
 =?utf-8?B?L1kyRTBaSWhuYk5welhwZG0zb0wrb3d3VDdhR2Z3MkNjdmZ6ZGdzQ0ZMN3h2?=
 =?utf-8?B?NXNPdzZ2QXFLeCswMHp1WlZTOGZXaXRjVTk2UGd1NC9QalpRaEF5ZWVrblkv?=
 =?utf-8?B?eDBaN1hXcjZMMGgxTkJnZ01iS0ZwUXhKKzB4SGpSSGJQU3ZadksyUytWQm5T?=
 =?utf-8?B?MlVTRUM5ZHpmQkkrcmZlS241RXNIMEZadGVzcFMrWEM0MmZDY1hwUys2SzVl?=
 =?utf-8?B?eGduWXpod3VXL0tmMEd2U3JaT2FjbVVTZzZVcmNkY3YvNGxHdDRhREJTVmdi?=
 =?utf-8?B?SWtXaFpEaW1rT1ZtYkNrZzJ2UnZMd250OFhhV2dhV0R5d1l0dUxXcmhqOHVB?=
 =?utf-8?B?Vm5LT0l1RkUzUVpvMk1wN0tEdlk1amNvZEZjOFU3c1ZKL1BiNkFSVWpFYUJx?=
 =?utf-8?B?WUlnUVQyZzBjYlVjZGZkWC9xNGlGL1ZlaWNJa2RXbTBZNXJzVmhJWEY1aGF6?=
 =?utf-8?B?WUNlS1hCOTFpNGVIODRhaVZtYWREUXhCTEtxbTNrLytQK0FONS9rSHc0UER2?=
 =?utf-8?B?R0dmREM2WDVxK0hDRWpDMlZYUnloNkpsTEQyb01TdlI5WWJTNDFlTTBqZ0My?=
 =?utf-8?B?d0h6Zll6dzdNdFUzY05oWlY2M3JzcEFaRmY5NktuSTZrcVFLK1lCS2lxQ21N?=
 =?utf-8?B?SlFNbFVBQTcrUGQxaGp2ZndLYVY3OEVnZG9jc2xxdlpRZDRZV25scms4REcv?=
 =?utf-8?B?MC9sKzFJUGV0SHFGZ0c3czlXa2xYRkFzRWVVNVR4cXBnMGh5a1Q4bXlJc2tG?=
 =?utf-8?B?YVB4bEtZd0licjhRQ084ay9waENiRW1hRkI3UlFSMml6bnpOclFtZlRiVDM1?=
 =?utf-8?B?Zlc4YWZIQmZobXBYVTNmTU4xR3hUa0J4K1lLMWRna0VxQzdIeVVaeVBLRko4?=
 =?utf-8?B?eXQva2loeEFVMm1HK0RBSFFER2s1TURXVkI3QjBVM2dHdU9rOUtuSDdLWjBC?=
 =?utf-8?B?SGQ2eEtKT29BU1lkYit3WU5ldkZoVlBZNXZOR2Uyeks4bEpOeGdLUlRaWCtH?=
 =?utf-8?B?YTRON1I0aVpFbFF1UVZBeG9hRmtaQVVSN2dSWGRLUTVDUyt0OEhVdzN3NlAx?=
 =?utf-8?B?N2lwNDNXYnNUT1BLWWxDdGdFbVFmK2FmT2pWVFgyelYzUWFRaDFHWGdmQklT?=
 =?utf-8?B?bUpHLy9aVHcyNk9aYVAzcUJEelRFTzZuTVFNaTk2UDNDZHNDbzVQOHJPRHZ0?=
 =?utf-8?B?U3JXTVZURTliaTJNK25obW5tbGUwVDNFZ0RSWVZsbDhlQitRZHBXeTYzVDNL?=
 =?utf-8?B?M2lUQjlTdFBkVzJYT1Eyb2FQc3RUMHNaamZQMUF3ZHZUYURrMThodUFmb2l2?=
 =?utf-8?B?RXg1aW43RW1LRVZFdnJUWWFqdTFtaGFwWndMS0p4ZWdYSG5OWVU4dWhmcmZm?=
 =?utf-8?B?MzRHcGV6b2xwYVNnZzdBazdoR3RPWitIYm9sU01lUTF4aTVMa1VZaFN2RG1i?=
 =?utf-8?B?NExyeDNQV3ozMmFIQlBpN21XL0FtcW9PdS9KSFVmSHNCai83RDRud21rYjRj?=
 =?utf-8?B?azh4T3BGSFFSSmtFYmFiNkJqM0tnVUdmWWpJbm5rYkJLNUV4M0VJc0VhU3dE?=
 =?utf-8?B?TEo3TzdlZkFETTliT2RKRVZ6Y2JaYzNXaFlMZUorK05EYyt1bmF6bGxXREhv?=
 =?utf-8?B?UVN1RG90UlA1SVZ1ZmphNWpHVFFLL1dXN050Zi91Q0xmcjN1SlB1ZmRaam0z?=
 =?utf-8?B?YUdHYTFRdTVMUXFoem5DRDJaWEZxLzFQUjZhZ0kzU0RmZUJTblpkR3Z2MnY2?=
 =?utf-8?B?UWdXL3F0TDNUUE5semJ1Wjl6MlhuNHFzN04xN0FZUUdZdnd6bzhIZkV3Vndr?=
 =?utf-8?Q?7WysgY3Mcxs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sit2OTdsbWdwbHZVaTlrRmgrVjNLcGZ3aGlRS2lEdW1VVldnSjVvdUV6WHU4?=
 =?utf-8?B?TmM3cFdwb1MxRXBzdExCai85cWZjRlk2V1VuZmhFYWtvS1RHTXkwY0QvL2pp?=
 =?utf-8?B?V05HMFJHRlB1aDZlVmN5UkJwSm5sU2FrY0h6Y25PQ2tGakJ5akpDeDJlOUFO?=
 =?utf-8?B?VUNaZklmSG9ydnFzWHRjNWdiSjFYZVhlYXREbC9pUDAvNS81UTdJR3FBaXd6?=
 =?utf-8?B?azE2S1hETWZvVnZRNXB4Y0FIOEVHWXhBUGQvYzV6WDNycHlDUnliUk9LRnNR?=
 =?utf-8?B?KzU0aHFWQzROalJFUk5XTEJFODhaRFFVYUpUZ2xNa2J3amFOSUg5QllieTNJ?=
 =?utf-8?B?MFpseElCUHRkR2lEVnpxZFkzMENkTGNVMUVDQVFSSDhWNHYwS0tuR1E3Vml5?=
 =?utf-8?B?QVl4YmFiTitDU0pmMTlQZmkvVTd2ZXJickRaVTU4RktEMjV6RlB5VHFJZTBt?=
 =?utf-8?B?VlR2eXM1ZWJoM21laXYxVGhlN21qRnV1UkROWXQzWThSMXZITXRuZmxyUk95?=
 =?utf-8?B?aXpUT0NjRW1OaE9ES1gxNEZCMXF6MGhEZTZ5Z1pTV3VKdkVtQk51ekI3OXFI?=
 =?utf-8?B?UnZaQWxEKzFtQVJqRjQzR1gvdkcwNXdFdGdRZFhQbktMemNNWnFZRXcrYXZV?=
 =?utf-8?B?OFR4MGxkZkhsTGFGMWMzNjA1SHZiMENYRGdFMWdiNWs3dm92YWEzaThLYjdZ?=
 =?utf-8?B?SmZ1d0pEREtxOHhtTWtZUVk2clh0TEx0V1dYYzlrYktrdldXZVR4U01scndP?=
 =?utf-8?B?eTVsUG5BM1lPSnlyZFZKNmM5b21BUkdOWC9zSDVrMjlKd1piRC83NEsyVC94?=
 =?utf-8?B?T2RCVHdvMUVpQVo1elJxeks5enZEM1BIV3ozMmdiWlJBSFRUVGZOSk4rN3g2?=
 =?utf-8?B?S1RoejMxZzh2ems1ZHExdFU4QlhoRnc1UEo3aEQwK1ZPMWpvUzEwaWNPYTB4?=
 =?utf-8?B?VnA1dVFPYTl5Z0hBd2NHTGVrMnAzNXEyc1VOYlFOWWNvSXVva0o3WHdocnl4?=
 =?utf-8?B?M08vTWF2aHJybG9DY1lIbFc1Qjhtb0kzWmJkR3dyQTJYR1dkM0JpOStnN2JY?=
 =?utf-8?B?bWRHSW5kTExOb1AzajYwNWg2Y3g0d0l6TUNSeWtHbDVDSHIydnJld2o3RnpR?=
 =?utf-8?B?eFh1YWJVekZKakh2NTFKTEcvamNVWEVHakFkYkV5ajFYcEZURTRrMmt4Zksw?=
 =?utf-8?B?OGQvL3Q2RjBRVGQ5b1hMcXhYSENFSzh2Q0trTm5Ha1JzdHF3cy9Gb1pCWUxW?=
 =?utf-8?B?TkNYMFdJZXYzdmNYVXJ1bklWRVMzMzZBdHRDZjd6d0lBRXBrRUZPTXdHM3pj?=
 =?utf-8?B?bElXb1lrUW9DWllObmtIdVp1Y0lURVJzWVBpNWh3dGhXQktLY0VPazEwYThS?=
 =?utf-8?B?OG1CTXZrdjhvcGkvb2gvZHZ3ajdpcHB5VTk1c0YyRnhIakJYYzhZUU85OWhT?=
 =?utf-8?B?clRCVlB4R0FxdHQ1QURyUWVXK2szVjZnRWVua0J4Y0dUOEFQL0IxRFlmRjU0?=
 =?utf-8?B?SmY3amwxRjJweHpQWFFkR2lESnBYTWJ6Tkk3YjZDeCtNakJIMHFSSERQMkxh?=
 =?utf-8?B?V2I2VjBVWlZvWFpNVlNSREo4NnFsaGRJdm4yVzcrTGhUWWNBV3FlcEd6bVZO?=
 =?utf-8?B?OXBqT2VhVnhVeHlSd2N1b1pLY1I3VytXdUJTbDRBd2x5Z3JqZkg2QU0zR3VB?=
 =?utf-8?B?b0M5Zkt2REpiZFgyUThxei95RnVTdTRobm9sUExwMU1FOGJVQjNsYXdadnQv?=
 =?utf-8?B?Vi9FOXgyNDZhL2ZOZ3ZuK2FYaTIxb1lmL21pc2F2NDFoendrdjlpcUR1UGxV?=
 =?utf-8?B?NG9jQ2tjUFRITFFseTZ6dTVkK2hlbTdtemZldVVwWm9HaVl5M2VjVG94Vm1M?=
 =?utf-8?B?RzB6bTNobGd0cEdVL05MVHYvcjN0am04N0ZuMGhQbnZiMEdDTTh1OSt0UThC?=
 =?utf-8?B?V1Y2SWl6Y0labUFXMjk1M3RkU2tkUnBiVGpNb2grRm02cWJaY1pqZG80ODly?=
 =?utf-8?B?cGh1Wm1TSldZRStJMy80M3ZDTDdqMk5aTmg0bXdMWUJNb0p4d3dZeVhoaDhW?=
 =?utf-8?B?SDRydmZhdjFTcEpMc1c0aUpHR2pCOEF1L3R5L21hVUw0ampEeUlvdWVJVElT?=
 =?utf-8?B?c09lV1ppSXpUYzk3K0NyS0k1S1ZSdTJybnRBeTlLZlRGYm4xQVR5TTkyS1pI?=
 =?utf-8?Q?WDsHBTD2F3Qm2eBspotjYP/UU4q+vvtw8bZ4+9IS24/L?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9231aa64-5e32-4660-8603-08ddaf00e00c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2025 07:14:05.2374 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ek8cvtRJROjdxYXDWzkiM8Ltn/DZ82SbKIqKU0opMuB1Xfh2wJoZ7s4ZAohmbXKdPouvWxA9RETfwEuS33Zu3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8474
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

On Thu Jun 19, 2025 at 5:14 AM JST, Danilo Krummrich wrote:
> On Thu, Jun 12, 2025 at 11:01:28PM +0900, Alexandre Courbot wrote:
>> Hi everyone,
>>=20
>> The feedback on v4 has been (hopefully) addressed. I guess the main
>> remaining unknown is the direction of the `num` module ; for this
>> iteration, following the received feedback I have eschewed the extension
>> trait and implemented the alignment functions as methods of the new
>> `PowerOfTwo` type. This has the benefit of making it impossible to call
>> them with undesirable (i.e. non-power of two) values. The `fls` function
>> is now provided as a series of const functions for each supported type,
>> generated by a macro.
>>=20
>> It feels like the `num` module could be its own series though, so if
>> there is still discussion about it, I can also extract it and implement
>> the functionality we need in nova-core as local helper functions until
>> it gets merged at its own pace.
>>=20
>> As previously, this series only successfully probes Ampere GPUs, but
>> support for other generations is on the way.
>>=20
>> Upon successful probe, the driver will display the range of the WPR2
>> region constructed by FWSEC-FRTS with debug priority:
>>=20
>>   [   95.436000] NovaCore 0000:01:00.0: WPR2: 0xffc00000-0xffce0000
>>   [   95.436002] NovaCore 0000:01:00.0: GPU instance built
>>=20
>> This series is based on v6.16-rc1 with no other dependencies.
>
> If compiled with rustc 1.78 there are missing imports of size_of() and
> align_of() which break the build.
>
> There are also a few warnings still:
>
> warning: unreachable `pub` field
>   --> drivers/gpu/nova-core/fb.rs:79:5
>    |
> 79 |     pub fb: Range<u64>,
>    |     ---^^^^^^^^^^^^^^^
>    |     |
>    |     help: consider restricting its visibility: `pub(crate)`
>    |
>    =3D note: requested on the command line with `-W unreachable-pub`
>
> warning: unreachable `pub` field
>   --> drivers/gpu/nova-core/fb.rs:80:5
>    |
> 80 |     pub vga_workspace: Range<u64>,
>    |     ---^^^^^^^^^^^^^^^^^^^^^^^^^^
>    |     |
>    |     help: consider restricting its visibility: `pub(crate)`
>
> warning: unreachable `pub` field
>   --> drivers/gpu/nova-core/fb.rs:81:5
>    |
> 81 |     pub frts: Range<u64>,
>    |     ---^^^^^^^^^^^^^^^^^
>    |     |
>    |     help: consider restricting its visibility: `pub(crate)`
>
> warning: 3 warnings emitted

Sorry about this. These are confirmed fixed in v6.

