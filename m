Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43D16B56F90
	for <lists+dri-devel@lfdr.de>; Mon, 15 Sep 2025 07:00:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00B2B10E2A9;
	Mon, 15 Sep 2025 05:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uIO8bf2x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FC110E107;
 Mon, 15 Sep 2025 05:00:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tjWueRAd5xLwht10HUnHe+V9lYZ+D0xrQD3OSSSmA0NSF4smREAGEU2K07lXU/z/w3GckcUEktQlutCLOVqGh/gF/HTrKFtlYGjtAC7758dLHzJbVX1iJ5cTL3zBurosJwwsEpHUgQHV2W/fYbE2J8Pt7u6R95nLEdp5v//AcO2baWBSXfKdCTfn529Z076tImCH/JXCE90p69jFcQGXVVrlim7N1feoPSmCIFwrN8GqXUlCbpxvbG2A6QgUfwsLxlRZOYqiUnPpZhUm8+31WJRpK6l1Bqve9NFIHo7uy/IqjwJAdcqSyTg/7rYaTXcgke5onOhw6bbYjaCvIrTowA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jiTyOrw4qdZN1RE9e/Pu7IsZa6DnyAE6mzKzkGMl1rw=;
 b=FyomIbJGeM65IphA+dgwsYkmeTgstW5p1HqSRGLij5YjAHScfGuBBP0tIGYfSY747qES1VJ3CsdAl2IQ5chXAjn5sUVWbu3i9QOpRmZHVBqzkLgofqs7OcniQ5+O1urXYqu5pszRiwHOgSWJtHHPGnSAdslaNG6g1dun5KodpJNdIxtFuV3Vox0lJ5DboVBnmA95S2jP6Mx87wcMiLfkPG4BaRhbagL46vRoz8fCCSQ/ylgmwsCH7VtJHFFGqyuuGsLOjdOT/JkcX1lrYZyQy2i3nzrMBVUAM5+KOb+mp87fPzgY5E+NIzqo1FDonl6Ur6Bm/+p/Ko81k6nSNTTGlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jiTyOrw4qdZN1RE9e/Pu7IsZa6DnyAE6mzKzkGMl1rw=;
 b=uIO8bf2xaWkHCMX9+3afM7h+GyH5JriTJ3ML2FQzzrCpSCkaqhIaBpJJN+vyTSNHI6/FBl5M+EKimeix19/m/NVFJl/5QahTW6MDb+bT1dDNCvZtAh2uj2ya2wZFWbNOjTZbum1fijoOskHWxl9S5J7El0wgqKllZY8/GJ3bW0W/fToOzUugk5CrygNJU1b+VsaYw0DlDlHDL9rdokx04o3n1RytxYHGu0gCv4PQB3vk6Alfr5AG70Fb5jk6HV1JDLolmaHdpPsr436j9hUkMbsFwZk/osGSUYiaIYHt1a42KoMapSvGfbNTWG2eGdSWCzWxUEBTRUEDym1uGwh5Xw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA0PR12MB4416.namprd12.prod.outlook.com (2603:10b6:806:99::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.21; Mon, 15 Sep
 2025 04:59:57 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9115.018; Mon, 15 Sep 2025
 04:59:57 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 15 Sep 2025 13:59:53 +0900
Message-Id: <DCT3XP3PVHJZ.2T0L221T3HW5R@nvidia.com>
To: "Benno Lossin" <lossin@kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>
Cc: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Andreas Hindborg" <a.hindborg@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "Alistair
 Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 02/12] gpu: nova-core: move GSP boot code to a
 dedicated method
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250911-nova_firmware-v5-2-5a8a33bddca1@nvidia.com>
 <e1755470-587b-4a43-8171-3d031b7fb4f4@kernel.org>
 <DCPYQNZG1OJK.2EE4JWJAROK57@nvidia.com>
 <ce74db34-77bc-4207-94c8-6e0580189448@kernel.org>
 <DCQ074EMFNIK.1OJLWJXWZLDXZ@nvidia.com> <20250913010226.GA1478480@joelbox2>
 <DCRPJKD0UHDQ.IOWSOB2IK06E@kernel.org> <20250913171357.GA1551194@joelbox2>
 <CANiq72n50MaMXeWdwvVOEQd3YEHbDRqeeRzbdY8hPnePtq-hnw@mail.gmail.com>
 <b1aea815-68b4-4d6c-9e12-3a949ee290c6@nvidia.com>
 <20250913220625.GA1564550@joelbox2> <DCS59IDCIKH1.2M3I6H0NVD0RG@nvidia.com>
 <DCSLPCSQRYOY.3BX3008H5CVQP@kernel.org>
In-Reply-To: <DCSLPCSQRYOY.3BX3008H5CVQP@kernel.org>
X-ClientProxiedBy: TYCPR01CA0146.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA0PR12MB4416:EE_
X-MS-Office365-Filtering-Correlation-Id: e92c953e-ab7b-494c-b2e3-08ddf414b755
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|7416014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TEUrZnR6MFUvWEw2Z0NJSVFodXJTSG5lbmdtemFQT3RDZWhnTTY0c1RVWmYv?=
 =?utf-8?B?R0kzUTE4THMwRkJJMjRlbGZUZW0vcE5KUjM3Wm5xZDVTUFdYUHAwM1lvUEtZ?=
 =?utf-8?B?RGkwTHJmeUZVYWZHUE5teDdKNlovWmtYY3ZMbVZVSjY1MU50eHZnWmlMOVRT?=
 =?utf-8?B?ajMrMnZFTDV2NXdSMEdBV0Z1Sy9TZC9FQjBTSTdZUktFZjRacG1SSUdKaWZl?=
 =?utf-8?B?OUtEUUEwaTY3cHNPNFJGUVhYMDkyMEhrNFVMZG05QkFMUzNEQ3MzMXZia0N6?=
 =?utf-8?B?NDBlVjZiTTNZeGVBSmdvY3dIay84VXRTNFdYNSt3VFRHekQwS3gzU1pBa1VO?=
 =?utf-8?B?dkJMR2pOY3Nha1VBbjdDamlJcjJhTmRZd3pFeGh0RFBUdTlSNnpDVEMvdEZv?=
 =?utf-8?B?R3hHSXM2ZGxVd1l1U2pROUZGRmQvNjJIbzA0eS9YMXJvY0FjTVZBTjNYMXhi?=
 =?utf-8?B?bUZOekQwM3NVa1NRWE0wNEFucHBtQzFidFd3TlMxbzJSL3Z3R2FBa3Z3QllW?=
 =?utf-8?B?YnowbEgxQStYaENCMnE5NXh3Tk0vUExmdXByYkUwMENVcW9UTGFSVW5wVEdD?=
 =?utf-8?B?S2Yzd2s1eCtrU1BYN2laWXBhc2VFNXloeXdzbDV1QzFUWERYVDVZZGNOSkNC?=
 =?utf-8?B?RUljRkRJRVIwTUlsZ1A1ZHlDcEJpaE5Tb1hwVVUrdC9jK0hXY2FCYW1nM3NJ?=
 =?utf-8?B?RnZLblFsbmowYVVLVXZ5Y1N4NmdWSzRmMUZ4K2JONlVXRXJWSWhYZk5mUkV0?=
 =?utf-8?B?emM2Ym04bHp0ZXlnYUZpNHc1QjI3aHY5VzJIME1TbXBBVlRjQ0FNT09nSWR4?=
 =?utf-8?B?ZTZPcnUxVDUwNTRydkFXNzhoNXh2WS95N25YekhvZzdwTTBCK3dLUWViQkhT?=
 =?utf-8?B?Y3VONVlUNnYxTC8rV0YydVY1cU1RdmJYL1RKTGlzbW1zWTZPMG0yQWZtUHU0?=
 =?utf-8?B?K3RJUnFGMTZuZHlDTldlWHhvZWh4QW5DaVJWejhaVC9ha3BVb0xhRXI1Q0VX?=
 =?utf-8?B?MGxsTWo2UmpLaGp5d1kzQzNOK3YxQS9ESTJxaDNWSHpXdGtLREhwQTdOeXlY?=
 =?utf-8?B?eXp5c3N6d0hYMEdNLzZHVHBKekFVR0pzSTU4TGV1Q0VIQXkvQWVhMTJxbU5j?=
 =?utf-8?B?ZVZoVjc2T0VyeUcyMlpwQ01kWUd6Z0JQS09LNDdDRzJRQzE4QUZRZXdSeVlW?=
 =?utf-8?B?ZS9OZGs2UUY0eU1IVWNYZW5sTGZ1aFJrdyt2ckhsZnBId0pvY2FFeHpjQmR1?=
 =?utf-8?B?Qkt1MG1WN2pVa3N4RlIwcmxtLzg5eWJubk1Kdi9JRU5XRFNhK3JuZUpFcm9J?=
 =?utf-8?B?MmhZSitVRENodVJYcE5mT2lUTWJ3akZ1M3pnc3R5M2kyMU55WitHWjlTV21k?=
 =?utf-8?B?Ulp4d1ErQXdSalNHelBjQ1ZHVzVWUHE1QUtGdjF0T0NWK2lFdGlFNXVjamtl?=
 =?utf-8?B?d2Y4cFdhUVo4aHN5ZGUzeUlwdFV1Ti9jcEpkNkRYOUJrS05JaVJ0eHVFS1hV?=
 =?utf-8?B?MGRrbXNRWmo5UXlqbUp1Y0ZuS0VqQm5Nd29OWVNvMlJtRVpFVy9OUkxiUnRo?=
 =?utf-8?B?eXRiVVhFRjQxcmpTUzZZTXpPZGRVVC9HSDJxam00STBTZ0R4SFNCQVBRZ2FY?=
 =?utf-8?B?Z2V1Mm0vREszQnlCMFVuTEYwWlNsUFRING9EbjN3NWROQjVheHIwbys4QzJS?=
 =?utf-8?B?aWdDcUExOTdVbGl4dnR1eEV0UHVxQURwR3FlZW1lWEE3WmRKd2NqcktHUnFX?=
 =?utf-8?B?cTZ6T3R6YXpLeFlsWjBMMituZHpUaU9KOE11Nk1JbVN0K01QQnRyQW4zdXU3?=
 =?utf-8?B?cDRRYTY2ZnI5ZmlYYkJtRVRkMjRRVlN3QkRkeUdrL2U2eDdoTDVhSWw1aXZN?=
 =?utf-8?B?R3o1S3gxOVZtM3R3eDNWQTBPL2pQT2E0RXdTdUttRkxCbStTZjE4Y0tvZkRz?=
 =?utf-8?Q?zCG5yihnp20=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NmdxKzdoT0xhOEUvZE1oeXY4K0lHZFo4QjJVYnZ1Mi9EYW1kS3RFVmdSVEhY?=
 =?utf-8?B?RWJGOGlwbzk1R3BKQVJrZlRNQ0xsNVNVV1pFWW5UYTlvb01jRzY3Q2ZyK24y?=
 =?utf-8?B?OW93aW53dkM1M1BNaHFNeTdSZmg5Qy83VFcvcFMvUEo2V3dqU2dHdllQcENR?=
 =?utf-8?B?K1JtRmJNQ2ptRHdQdk1uY3Z6Wi9QRzdNRWlLWnNYdjBSZVZMT1pDWU5iWkpi?=
 =?utf-8?B?WGpGMmZWSmJkQjFyclNDZmlEWlVWK0FPY2ZjRGxveDk0emZJRlRpMDEwZWhu?=
 =?utf-8?B?UmVFZEl2L3JMZlJnUWRuVUdvbEVHZVpOYWRLYUR3b2tOcGhpZnJjRnJobWpN?=
 =?utf-8?B?QjM2ZEl6MC9oMi9pdnNILzhYOFI1Zkh2VXVrckt0SEJoTzlYWnhPWUJSMEY0?=
 =?utf-8?B?ODhvd3k4ZWtwRGQ2dE9XMWo1Vm5DalR1V09FQ1VZejlORVNzUTNNbDlONXRL?=
 =?utf-8?B?SUY0Ym9zYVdtYVZtdjYxdU0yTnNYZ2F1QmZCK3llalU4N0RsNkkwT2t5VmRr?=
 =?utf-8?B?cC8rdk5GNmtQeDU3RlcwRWxjSy85a1BOUHMyUldlU2U5K0xXOS8zRVFMM09r?=
 =?utf-8?B?U2dpeWd2ejBkWXhjQi9iaU83VHR1Nzhpa1J6MW1ZRk52b3h5ejFWMlh3UFlv?=
 =?utf-8?B?b0k0VitwT3NsUGErcnA4S3dBWVJ0ZnpmRTA4czlScVpMZUlKZmVCMUtGelY4?=
 =?utf-8?B?OUExQkdNMjVNY1o2V1N2VEk2VG5lZFRBN0M1MUxTM2NiMDdUQmtaVXFhcUpV?=
 =?utf-8?B?VHoraFBJYkFmMUdObjdZaEhTOGJ2Rk96ekptWkp5SXhOVFRCUmMraGNtaUxx?=
 =?utf-8?B?Y25CdU8vWkVBRWJ4MHJOV0VPMDRpb051c1JIcS91WHJlWERBMUxPdFozL0Qw?=
 =?utf-8?B?SnYxbWYrU1BSQ1pkUzcvemVuck16Qm13d21EMFdFcGp3Y2drejcxMytEWnNM?=
 =?utf-8?B?cFg1N0RQaHVGM3cyMW9jL1p2S3lldTB5YUR2T29QZkovNVhGOEZYcEk1TitQ?=
 =?utf-8?B?OGNRSzBwNHU3NGVFRG1hQm5tTW1wMUkvb1lCZGtua3RFRitKYnFTb0ozTm1t?=
 =?utf-8?B?TmlBZ29SdFY0Sm5GN0tNOVFHc3Q0elNGZDZhaXFZazNnK0FTampVRllzSnFB?=
 =?utf-8?B?MndJWVc2SkF2aE5HOU1HczdCR3pxNEROSXViVi9oUCtxZks0bVVKNGcrclNL?=
 =?utf-8?B?Q3ZyblJtczhWL2FKaW56TkwzTTluWGZZaHZQOGs3WEUyRnllSHpTUVZSeTV2?=
 =?utf-8?B?dVB6WVZhNyt1R1JCd0RPMWVpTXhQZXpqeTBLL1hqUCtiRHJKT3dKUXVUanNC?=
 =?utf-8?B?Q1YwQ1BPb0IvWGJ2Yy94bnBJMHlySTB1WHplVXhQdTRiY0t6UDNQcnkzUzlu?=
 =?utf-8?B?S1R6dnY4a3J6SlRNbkNBY0dFYTJsTkNFQWNrWkRYallXY1NWMlY5Ung4N2xW?=
 =?utf-8?B?MTFrU3h1NTh3T2YrdThHZUh1MjJXK1laTTJHVWkxeHp4cXdDWG1xQXU3Nlow?=
 =?utf-8?B?SHppYTYxNkRkNDBTblA0ZmxuNlhxQ014UnFHMXZ0OEZ5RDhRNDBKaUJQYnJ0?=
 =?utf-8?B?MWY2amlrVXMvUUF2SEttTjJiUTg1L2lLaExXRGlqTTJwbTdLZW9vVUFmdk13?=
 =?utf-8?B?azgyd2tVNmk0dGxzVWswQTlha2Zhck13Zm5JZEllR245ZkZMc1RGT0NLOEZy?=
 =?utf-8?B?NVZQZEZnTS9Mc1NwVmFTWW1Ccy9MVk8rVGEwYVZMa2VtbFp5VHUvUWExWFh3?=
 =?utf-8?B?WEd6ZXE5WmRCbWRzRE94SU9UM1FhUVhtczVFQytiSm9aY3hTTmtXSmtyV0Fu?=
 =?utf-8?B?cUZpUlg2U21mOHRLVzVqU2FvTUlVOU56U2xtUEdmRjhIVlVKYmRNWXpxbFFK?=
 =?utf-8?B?YUtPd3l3UGpNOFRnZVJVTngzN2FjcmNuNEt1VUg4cTR3NUpxazg1ZUNHTW8r?=
 =?utf-8?B?L2ZudVBtSWVaREFCaXRqdTBDcjh1dUp4TGI4RGowd2oxTlQ2bFFRaHVpUC9Q?=
 =?utf-8?B?TktxWkNxN0RmempGMzNWNlJYVTB6V3ovVFRjZ0VhZFZFeVRuRWZjTTh5eS92?=
 =?utf-8?B?cUhZa3ZJSnhOOXJ3QnF4VUZvTDZkNnlQTTVaOEVYd0dUMVBBeHNnYnMzYVlB?=
 =?utf-8?B?Z2s4czhwdDhGMkJHQ3FGczJtTFFZS2txdWh5d3hHTTZmeEdGaUdnd203NTdk?=
 =?utf-8?Q?wupsn6+FLo4YZFRanDTJ4+fNRxiPVq182sV+TzIq5azi?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e92c953e-ab7b-494c-b2e3-08ddf414b755
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2025 04:59:57.1065 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LEzggfL/5VBkPoLEiyjSu+QQn3Sy4YLqFwmDKtP1U3ol2UfJZJQMQ9HIZQRVXv7uKGkMPy6P8bqZnqpuCVKaYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4416
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

On Sun Sep 14, 2025 at 11:42 PM JST, Benno Lossin wrote:
> On Sun Sep 14, 2025 at 3:49 AM CEST, Alexandre Courbot wrote:
>> On Sun Sep 14, 2025 at 7:06 AM JST, Joel Fernandes wrote:
>>> On Sat, Sep 13, 2025 at 02:29:54PM -0700, John Hubbard wrote:
>>>> Yes. It's only "paranoia" if the code is bug-free. So Rust itself
>>>> naturally will look "a little" paranoid, that's core to its mission. :=
)
>>>
>>> This seems to be taken out-of-context, I said "paranoia" mainly because=
 I am
>>> not sure if excessive use of pinning may tend to cause other problems. =
The
>>> "paranoia" is about over-usage of pinning. Personally, I don't prefer t=
o pin
>>> stuff in my code until I absolutely need to, or when I start having nee=
ds for
>>> pinning, like using spinlocks. Maybe I am wrong, but the way I learnt R=
ust,
>>> data movement is baked into it. I am not yet confident pinning will not
>>> constraint Rust code gen -- but that could just be a part of my learnin=
g
>>> journey that I have to convince myself it is Ok to do so in advance of
>>> actually requiring it even if you simply hypothetically anticipate need=
ing it
>>> (as Danilo pointed out that in practice this is not an issue and I do t=
end to
>>> agree with Miguel and Danilo because they are usually right :-D). I am
>>> researching counter examples :-)
>>
>> You can look at the definition for `Pin` in [1], but it is so short we
>> can paste it here:
>>
>>     #[repr(transparent)]
>>     #[derive(Copy, Clone)]
>>     pub struct Pin<Ptr> {
>>         pointer: Ptr,
>>     }
>>
>> There isn't much getting in the way of optimized code generation - its
>> purpose is simply to constraint the acquisition of mutable references to
>> prevent moving the pointee out.
>>
>> I started this patchset a little bit skeptical about the need to pin so
>> many things, but after seeing the recent additions to `pin_init` and
>> rewriting the code as Danilo suggested, it starteds to click. The
>> supposed restrictions are in practice avoided by embracing the concept
>> fully, and in the end I got that feeling (familiar when writing Rust) of
>> being guided towards the right design - a bit like playing bowling with
>> gutter guards.
>
> That's a great way to put it -- I had a similar experience when writing
> pin-init and thinking about it purely theoretically. Good to see that it
> works out in practice (and continues to do so :).
>
>> Yes, that means redesigning and rebasing our code, but that's also the
>> cost of learning a new language.
>>
>> And yes, things can still be a little bit rough around the edges, but
>> there is awareness and action taken to address these issues, at the
>> compiler level when relevant. This makes me confident for the future.
>
> If you have an issue that you cannot work around, or something that
> looks off, let me know. Maybe that's something that pin-init can deal
> better with or we can have another library that helps with it. After all
> pin-init is specially tailored for the kernel to work :)

I was thinking about the lack of access to already-initialized fields in
the initializer when writing this, which has been covered so thanks for
that. :)

One more thing I still don't know how to do without unsafe code is
accessing structurally-pinned members of a pinned object. I had expected
that projection methods would be generated for such members marked
`#[pin]`, but I haven't found anything yet. For instance, we need to
call mutable methods on a pinned member of a pinned object, and the only
way I have found to do this is to use unsafe code. Is there a better
way?

