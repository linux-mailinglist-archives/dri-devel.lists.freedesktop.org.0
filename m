Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0650B277D9
	for <lists+dri-devel@lfdr.de>; Fri, 15 Aug 2025 06:44:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF3D410E081;
	Fri, 15 Aug 2025 04:44:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="X4r88gxK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2051.outbound.protection.outlook.com [40.107.223.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4364310E081;
 Fri, 15 Aug 2025 04:44:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oOJNfU8U+Owomxo9KPUc8wxDoBUXacmobqJmVnrhIWx35grusBAGvxgIMonvYkfpWNMOkRkzreFkilJ4Rt6viQis/r+D7y8GopHeGKb6/+fe4htvrxzBV8xhdOXXKc8yAolBPSg97Kn9TQKmOBeTcJNR/DRQMf0CCiXRuABCigTpPZ6d9JcfWJZoOcpx2g6nxYnYHxerkX72gr/eXYQRXt3MxkmGySxu/0d/acw4tnSHI8OIbfTJw0N/SPaIr+eM53MBVW5QQLpYQsRb9j/0KDE/8IqDsiN2HnolcISJ6t9PfbvgxRGtE8XOCqOZN7UOI72EdyEDJXNohtlM+v4fmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iytgXDFo/kPoiDag2lQIPDvrfwShdzenDFjrtrmiFSk=;
 b=HTycA4c8YJ0/6+4Ge4z69jit80jYbNrU7T1thTB2j1jqA3oWl2beynulGQFInJTQ8Sc/T7UWNP7DMfTD/TBhH/RJoEu6Vo7XEouHmUvI4c/RWxMoU6D4APiO9nZsJWuQOby3V+guw20vFByqVrRk+5P7t0kNT4e1YokRb4X4IjbD+XSfWqNH4m7/FtpDPbU++fKDUzEcLeQjxfrVm1aQfgwnPamCj2RwSQUg80JIHYhnZ1mXJbFGPJzb3LtES1NNUaJJM2MFIraEZoJE5G+FhweajXsgdOmoo2gy3dI5o2HQ9HtwKQI4JSwMZRedyrCv4nxJZnkVS3a5WsnwIx4jRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iytgXDFo/kPoiDag2lQIPDvrfwShdzenDFjrtrmiFSk=;
 b=X4r88gxKUQzpRI0vVRvPhoCOIOcjI+7Grq/BU2yN024I5RJMGYwmfR+TQu5UGx+HCobpTX6ludr3oU4m6LzK4LNFqPsel4EEc/H4+qJdJ8Uer+T6i174vRI8lZNYRSx+IfwPEdY7thLg9WlqyIGolMGM/DLpXQS1DE0XOI3hJzORT1t2KnOT3DrJL9d/0DvP2LKrh+iN5VoqbmCNv+cYb3JE7oXrlV8VUesfYIRtt4ib0mYU5SgpgMkfFrOU8AnJJdIPVghH24fSQn3XyAg768Xx27YAH5RV5SX8YsfXil3g+xqeFaUUhmV0daAEUsu0LGCUDDyeXTH3b8E4ngPz4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB7175.namprd12.prod.outlook.com (2603:10b6:806:2b2::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Fri, 15 Aug
 2025 04:44:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9031.014; Fri, 15 Aug 2025
 04:44:25 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 15 Aug 2025 13:44:21 +0900
Message-Id: <DC2Q6WVI644W.YAL6XCZEH6K7@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Lyude Paul" <lyude@redhat.com>, "Danilo Krummrich" <dakr@kernel.org>,
 "David Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: "Daniel Almeida" <daniel.almeida@collabora.com>, "Beata Michalska"
 <beata.michalska@arm.com>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, "John Hubbard" <jhubbard@nvidia.com>,
 "Timur Tabi" <ttabi@nvidia.com>
Subject: Re: [PATCH v2 00/19] gpu: nova-core: register!() macro improvements
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250718-nova-regs-v2-0-7b6a762aa1cd@nvidia.com>
 <850ad00575d7ed5e1f065a599853d5d2d47ed47a.camel@redhat.com>
In-Reply-To: <850ad00575d7ed5e1f065a599853d5d2d47ed47a.camel@redhat.com>
X-ClientProxiedBy: TYBP286CA0040.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:10a::28) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB7175:EE_
X-MS-Office365-Filtering-Correlation-Id: 30aa1810-fb28-4d4b-d5df-08dddbb6694a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|1800799024|7416014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eG94a2ZMQ3ErZHhocXgvcVlnM1hQc01jRnJ1TzlWTExnWjFmZ1IvOFNyaFgx?=
 =?utf-8?B?bEtjck02MDBxdUV0YWRBNUZXdW55REcwT3VKSjVKWnVkSlpNQk5KcHdTTEps?=
 =?utf-8?B?aGVSakRScUthc3BIcGdLalFmRlhCR3pNT1VyZUJqUEUyTDFmREVqT3BBc281?=
 =?utf-8?B?NkpRTXM4VXRCUkNydmlsZkJ0VXVNYzhlOTNmekxqU2xWRGx3Ti9jUUVmWXc3?=
 =?utf-8?B?b0pHeE5Lb0orYXZEMEdvaVFaaE81cFJVbTJUb0NmSXNvS0grUU9MeDRjSzd2?=
 =?utf-8?B?TGNIYUFzdG9iSlYrS3NxWnhkYXMvWnRoZnNPcjQ4QnNGN21tUE5HcyttVTN0?=
 =?utf-8?B?eE1VMzhEQWZMRjNIcStWS251NGQ2WGdoVFFEd2lKWWJXR2FDZDJKWGNGL2I3?=
 =?utf-8?B?aTl0TXlUanFmcE4yaW0vWENSZ2doZHJQV1puWVNBcitsUWtqWE81TG43SHp2?=
 =?utf-8?B?Vm41TTkzZDlTWjZzVFRiVkVrT3daZ2Myb2syOVVoVkx1OGR2NHYyMSt1M3NQ?=
 =?utf-8?B?TDIweWNjQ24xOVRsNzkwSXowL3JnOEVQbGkySFZCUWhRWW1QbHZ2L0VBdFpW?=
 =?utf-8?B?VDBPRmlIeStoSUthMXkwbmNzbG9sVVR0aC9QbnRzV3lSMkZIeXd2U1paeEpJ?=
 =?utf-8?B?VUNEaUpPeWJGeW16ZkNTQWVMVEIwT0ZIclpiY3JQWEt4NjFyNHd0dFByM29n?=
 =?utf-8?B?ME1LSGUrZVBrOUorZnMrUi8yNFF3TTZzOXVkUWR5STF5K05FYmhMcERCNU5Y?=
 =?utf-8?B?Q1BBaDNZOE0zR01CTWpyK2txQXZEYWRQdEt2OEVqNWI3Vlk4RnUvVDExaEh1?=
 =?utf-8?B?OWtEUG9kclAvTkMrZ1NSUHNXbENQM0x4bzU0QUpOTlRya21DK00yMFBRTThC?=
 =?utf-8?B?bi9wVjI3ZWhnR2hFczhVcys1d0VuL2liV3ptSm9YQm5Uekc2ZWxyOGIvYkJI?=
 =?utf-8?B?eGlLWUJDV2lLSkhuRG1vQjBtcFhHR0NjOWhxL09GVE1pU0crc3pzaCtiR0R1?=
 =?utf-8?B?dDIvWExwS0Q3bG9uVThMdExFaDIzS1RVOEtGaWpoaDlidm1waVZaZVovcUMz?=
 =?utf-8?B?Q1ptNkQ2U3VJL1RuQ2hGRkQyZE05NXBPbkZxUU4wUkdNY3UyT1RGOE1OVXpW?=
 =?utf-8?B?U3UrVHRoRGM2ejgzN0kxL0tsNWRuQVpRQVdhUklmZmxMSTZoV1dWejFnR0Yv?=
 =?utf-8?B?dlM2a0RiSWNxOVJ0RFZwN2ZDTm5RZ3VKb1N4VC84YUJ2Ym5OUWRnVnh4Q0tE?=
 =?utf-8?B?ako2SE9hYTNPcXlWMzh5Y1hWT1B1OCtxd2lnZ1J2bFU5QXJZRnJYSGZwZUJp?=
 =?utf-8?B?YU9PTE5nSWlJLzQxN1oyRXNYVmNzQnFybjI4Zy8vRUsxcjNZZ3pMME5GWHFv?=
 =?utf-8?B?NHRvZ0ErOFNRUlA4NGtobXpWVUo5dEo4YjA0ZVV0LytpNTUvd1pPZ1Q0a3hB?=
 =?utf-8?B?Yjh0V3d0d0VidFBRdVN5bVVubDZMNzZlcEgwUTFuU0JPc2RHTkIwS0lBbFht?=
 =?utf-8?B?OWx1TU42L2lhaGZOOUR4c3pxWmNxVEF0aFNJOUNCSWFmZjlBNnMvbDN1SlE4?=
 =?utf-8?B?a3hWcC9JTVpjVnFaM1p3aGJLZVNpWVd1OWh4b3p4RysrWmtEVEMyK3JSaEVT?=
 =?utf-8?B?aUhhaWJoZStMTVNWamFBeW5kTHpoVUlsN01PeU05Vk5KalBQVXk3N3djUjEr?=
 =?utf-8?B?aDg5dmc5blNpU2xsV2l4NEg2eU51bm04UG02NTNZaWdNUWVSYk96M0s1MFYw?=
 =?utf-8?B?bDJQUkFvS2l2c0Y2YjZDQjdaUE96UGVyMlFVSUlTZks4M2ViRm5CRHcyNFVC?=
 =?utf-8?B?UldSK0tWUUV4cVNENWdsVGpGSlFmVXZaeWs3VDR0NTV1clpuN3ZkTGorMEVD?=
 =?utf-8?B?NXQrQ2dUSW4rdXRJN09xcGpmbGJoM2gxQ3ZpbzZEYUw1WDRpZ1U3aU5PeXFn?=
 =?utf-8?Q?0n5fIrcMuB0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(1800799024)(7416014)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVNlbkhUYTZQdmhJTExTYlJhbk0zOUhnMHRGT1RpZTA2UGZXT0VoQkdXWlFi?=
 =?utf-8?B?MVI1RnFSR2MrK0JiUVpnbkxNbzBIUFVIYkxiQnh4ajVQc0lWWGs4eDNPM3RX?=
 =?utf-8?B?SUkrVGxWaWhtVUF5SXg4SWxIbGc0SUo5S0pDUWp3QmgxbStlSmF6UmVBNzk0?=
 =?utf-8?B?SzVyUjdIb1J1aFpRd3RhTk0ybjdmSXk5eGx5ektmNlNtaWJ6UC8xaU83c1R2?=
 =?utf-8?B?L1ZMWVUxVnlOY3ZkZTNDTEw0dXd5eHVPSUpEaVlJWW5VaGhBdVdIYllxTEt0?=
 =?utf-8?B?T1hvejhZUkNtMWFwNlNDcDdiTG0rUFVMS0NVTUIzMXVTR2t5MWp6SEpJYlBK?=
 =?utf-8?B?NklCZHhmRU9EUUE1QkpVeGQ4WG9WWVdvTVpwaW1Pa3VrTC83ZzZlRktvclIv?=
 =?utf-8?B?QlNLcCtXajY5UnhiQ2pXcjZqeG96ZVFjMTZsUHBER3pyOVAxVU14eEpmdSt4?=
 =?utf-8?B?NG5OTzdBaUdJZVJBcTI2aDIzdnB5OUwyNWlkR1VSUHZ1eDdLekpDbmIwb20v?=
 =?utf-8?B?YXNzM2FwSnBZcXRKUmwwWEY2RUhJWUNtanJsUjhtVWZuV3ZiazVWNTNjOWVs?=
 =?utf-8?B?dWErSVNrTTduRGwxNitKbHJhYTZuNU0vRkZCYjBnTGV6VFZtSU9IcE5EMnpt?=
 =?utf-8?B?QUN0R0lhSzJYUXVCMnBLajZQLzVLODhBUy83Uit2Q1hsR0lmQ0RZL0piTmVK?=
 =?utf-8?B?OFdVQjl5R2h2QVNJZ1hVZGQrREJFVFlZQ0NKLzBzZUdHT2FiQk1FK0s3WVRM?=
 =?utf-8?B?dzFGS1lScHEvMnVsYWlvZ1NCNmJ5KzRUMXg3U2RYa1gxN04vRTVpNFVPTU9h?=
 =?utf-8?B?eU0yREsyZFhLa0pwNjlwdHNmdThGZis3L05rQ0J0YnlmamszbzdYcnVPY2dP?=
 =?utf-8?B?cUV5TThSZjFYdEF4MS81RGk1YWpDWkMwRHJScEF5RGN1VU9qQldLcnJEYjRC?=
 =?utf-8?B?TnpWZnBRN1lNNVROd2ZJVThjMFJJTzhRekoxMGwzZ01tcTQyckk5SmVWQmJO?=
 =?utf-8?B?SkRiZmJ1bG5wSEN4WTBpTDgrNDFlcXdZbUg0QThFRHAvN0xDU096RzZydDFF?=
 =?utf-8?B?aFlpUVlnUHIyd0NGNXRLRGZOb2tuYzRINjBzQm1vbUZGWUJwaTVNQU9iRk5G?=
 =?utf-8?B?dm1NTE1zdW5ZWEQ0aEppSnFuekdjVi9ONWVJNjZXZ1JjZWhQTlVaTWpHYkpH?=
 =?utf-8?B?dzFYSVE0NytQUVorc3N3eUhSR3dhRXM1bHNtZWRuN2pmTzc1ZS9aai9wTmZa?=
 =?utf-8?B?ZEx5OVp6U1F4UUl1cTVQNi9WVENraDBBbHhXWm9SZTRnbkdUeWIwK3NTOXVV?=
 =?utf-8?B?dXNCMngxT1hBTmk0MjBjQlRGczh5dlBQcXd2bVJtK2dDR1hMNE1ueUFtNGtP?=
 =?utf-8?B?ZW1OL3Fxbm5HYnBZdUlzQ3kzVDdPSDlxUFdaTzd4Wmd4WUhjUkV4ZlcwVWFK?=
 =?utf-8?B?QUhpeEZEeFFIYXpFdXlwQjN0dlBCdmhOblAxaXhNVS9raFBJMHphajFXbGd4?=
 =?utf-8?B?RkRKbWhBajVOdHFXQWhiSjh4bEZqZWYyTGlDRm5icEFNVzRhcXh2WkltTjJH?=
 =?utf-8?B?Vk9pVGhMaVprWFdhK1E1cjh3Y3A2T2pGaExsMTBnSE41bTdVVjc3TllsbXBx?=
 =?utf-8?B?SHFUNDFzcVkyUFltQWpJanFpU0JWeUliOFBMZW4zK0l6ZzBOK2dMeXJRZ2Rj?=
 =?utf-8?B?eTNuaWFnUzN1RHhwMi9WUDNSdFoxUmlmTlA5Yll0STJxREt5OHNveVpmdWha?=
 =?utf-8?B?aTNGcEs4OXQzb0RWVm5pdUhZNDk4Z1lsWUJwYjZhUXVlYno2Njcwbm9yR0Ew?=
 =?utf-8?B?ZWxxYXJWL2FoTUI3N2Z6a2lmRzBkb2pVckZwVExqVmlmekVuS1pCWit6OU5T?=
 =?utf-8?B?RmNUdjdoYTlKL0YyNlhobTlCUVo5UDNBUnp5R29WcVgyWnJEb0svd2JGUnZp?=
 =?utf-8?B?L1Rrc2FubjI1R1JBQktGUlRycnFibFRlbnpUdGdtQW1ycWdzVjNSd2tXNDd3?=
 =?utf-8?B?NXFIbVZPM2hLVlZtRmFnaFJSMUhVYit6SHNZZC9YM0N4RGwwZjY0N2g3RERR?=
 =?utf-8?B?dytSbnRKeG1YSzcrL241ckNXTjRJMjZkN3lKajU4TnRrc0Vud1hRVTZwZVZj?=
 =?utf-8?B?bllsQTZoUU1ueVA5emRrc1lsc3k2bDRqS1VxR3MzRm9WQlROdk10N0gwNW9r?=
 =?utf-8?Q?gjUQbwO0YSC4H0eDn2vm9NIZ8JNtq/gmVkPBLsR73Jdu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30aa1810-fb28-4d4b-d5df-08dddbb6694a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Aug 2025 04:44:25.6772 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UbDSIO6Cm1C8ATvhZYiLoqSCjjRzusf5wsqRHqUsTddSME53x3asf26wDEaQYgloaxG9rQ7ib698PnqP2IZrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7175
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

On Fri Aug 15, 2025 at 7:52 AM JST, Lyude Paul wrote:
> For the series:
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>

Thanks! Pushed the series to nova-next.
