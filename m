Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B08CBFA614
	for <lists+dri-devel@lfdr.de>; Wed, 22 Oct 2025 08:58:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6976D10E6C4;
	Wed, 22 Oct 2025 06:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hY06tfRI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011031.outbound.protection.outlook.com [52.101.62.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261A810E6C1;
 Wed, 22 Oct 2025 06:58:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qjNnxTOzcXdR1WD7vwWeQ4xAnDIdIJRrmjriPU9VwauGCN3GvwBNhc4SST4NavMaiJa0biIf/20m6HIv69SQqOj21p0F/W8wf/JSxLCjIOD9ifqlbbSSEXUoWOJ9RJ5Hsjfh6olB97Zkvso2mfCDZRHB8kM8XELRJ95zz+7MvwxQERzgzZoF5VSNXU6jJAOuXy2h944Eey6U54Z59efQEe8obgPu6N9JrZKVWwa83qeII05ozX+V9sEs3hyHcYFiCMrWk1nOp6Dd8jfEYNMOPj4Ycaotgfc+qFGagembPH6Z4zBWwyz+NKfIxuA+LBKSyMGVUZyDTZESNBK1v0+pgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XFPrFrMOkhWQLOnHA7lCfuGc0FxNKzhJwU+QdV08Kn4=;
 b=MUouRzg9VoHZq93cZSDHUhz7ta1bSxn2W/NBrnO1g8euB0CwWmJ7BKrt60BBNwKydQWz6M9ODyOgBuH9aOIodY7rs+aZlbcDlhDwkT+QDrHDR6WfCHbAZkM2FK4CBMT5A8EXWDhPgAXz96eDMkFuPvNmFYSYQxhVCEMnIwgE0FX8iTKrTdzDGwoZ7ILNQ2/e96RIcn5nIn9Y4Vx6EdPAXAChGDBBrOWgByzg+QHQ91rz/EOI4F8GK5BZCiKHy1WktSIPYCNqvwxUQZgiD/PIt+q85ADGI85JWPAfVTXObvNhn5MI4b2yBg8BxbZ3JJim11BKkVKJS/ZzaqODYxiH5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XFPrFrMOkhWQLOnHA7lCfuGc0FxNKzhJwU+QdV08Kn4=;
 b=hY06tfRIQ8X0CgHObGa3DM4OrrxTpW/4Ilfys8LozqA4pJ6gNBzVIge4FZeIOfZsqYTbHr7Hs1cdDwrNhC4ckdRss3DJUy9aTSty4JDbG4UZUG09s/64VJb3xPvoaLF/ss+3RSnvjTDa5orUGjxoWu/whyYYfwLZKMKpu0LDkxIU/p6U7HMRicenxAbvfr+s4XKdiwbNkNb6WCUhh69/vMC5JzvPujKh8fMMvtRREHeTOCElFsgqGvBSvTNWHrzjMqfg3s70Ed/jgPfAzm1S/mFlCckpQoWaQ9hzQ47CoempEyd4e9tcHpJaJPzEUXmGSvGvApyUyo6bdF2VAwrH0w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Wed, 22 Oct
 2025 06:58:03 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.011; Wed, 22 Oct 2025
 06:58:03 +0000
Content-Type: text/plain; charset=UTF-8
Date: Wed, 22 Oct 2025 15:57:59 +0900
Message-Id: <DDONM9Z1XF2T.32OBDFX7FONJY@nvidia.com>
Cc: "Alistair Popple" <apopple@nvidia.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <joel@joelfernandes.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH 0/7] Pre-requisite patches for mm and irq in nova-core
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>, <dakr@kernel.org>, <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251020185539.49986-1-joelagnelf@nvidia.com>
In-Reply-To: <20251020185539.49986-1-joelagnelf@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0089.jpnprd01.prod.outlook.com
 (2603:1096:405:37d::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH0PR12MB8800:EE_
X-MS-Office365-Filtering-Correlation-Id: 896ab791-c97d-432c-24dc-08de11385831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|1800799024|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2NYTHI1RzUrcmJvd2MrUXNOdVRpM1Mwb1ZYK3FLZ1FCM1hKWWU3cW9sajZL?=
 =?utf-8?B?eDVQeS9wTEdhTElEandiQnBZam1KU1VMZHhpcmRXUUNWYm5haGZNQisrZUVR?=
 =?utf-8?B?Yis2aGVvU05RaU9hUEsrQ3ZkRXJpSWRJYm9OTXJEbXdnc0YxUVNYbjJMbVZQ?=
 =?utf-8?B?OXMxbGNVQXBZVE1aNzhXSzhraDFEK0djV2E3U3BOaHF2RUNRa0NUaS9qaC8z?=
 =?utf-8?B?bERDZFkwSWU3T2xOcytZTkl6WXpmbGpzN2F1MXBVQXo4aXl5UzlFVXNUaCtp?=
 =?utf-8?B?NWZNME9PK3F1ejNSK0YvRGVwdFBZeGhVMDZ3V2ZWVkYzVEtnVXpNWG1UOFVj?=
 =?utf-8?B?clhJTTZBTStVODR6MERJT0ozaGV5cmo0MGd4c3NvcjdPV25uUXV1dVVDMVF4?=
 =?utf-8?B?YVI5YURTZ2RHZnJKQ1dvY1N6TFBNM3VOcWQ1TmczcDdrQXBUWTQyb1FIV2ow?=
 =?utf-8?B?aXNBZXZJcUpkS08yWGxGeG5BOVZ5aCtZSlJ5elJIV0FNQWc1QkZIUitOKzZS?=
 =?utf-8?B?SktYTmtUeGVJZkJPSG00WW9Ec3p5ZDZzbWcrcGlZWXNuQlY0K1lPQUlBUHd4?=
 =?utf-8?B?cHYvK1ZSN21nWjN1OFRhOFdOQWF6UVE0VENHZS9BR1p1MVRDd08vZExsTVdj?=
 =?utf-8?B?cUJXM0pJRytSdEQ0ajNTUmRKbnlmMlNVVjlOU1JzVDhINWhLWG1VeXp2aS9t?=
 =?utf-8?B?ZGNhc1hSSVZYdkd5bHVzcVp5SGczQ2ZFSzE2QlZUeGxkMkR2WHBaTkFuSEFC?=
 =?utf-8?B?TVVwVmNNZVMzWUFLcmsvdVpEMThDampOM05WWW9TUW1QTzJoeStZLzZ0Vi9Z?=
 =?utf-8?B?TFQ1clA2VCsvT3ZPY1BEV21SQ3V0V0pTNHk4NVlUSUcvdm41aXVpUmVYUzdS?=
 =?utf-8?B?NXlLN3R1VE1PWmxPcUczU3Z4K0tLVFdoUm95aU90WTl1b1p0YjBuR3dmSHNU?=
 =?utf-8?B?MkNmRzR6VUJnUXY4QzFBTlpLV1dhdmtaUGhaTjhNWmFxS3o1T3o0TW5EMjR6?=
 =?utf-8?B?ZkpUOXdJVmlzeWNnelIrd2d3dFBRL09TRVhVRFhIZlRXWllzUlQxeXFHWjEw?=
 =?utf-8?B?azBYSEFRS1drYWlWZ3dYd1FRUEtiWjRNMmhyWEhDc2pjSlAwMHdtN2tNdkV4?=
 =?utf-8?B?MkJPT0l3VEhJTUl6TUh1ZTZDaHdoTXVVdEdadlhvNjNkNExWaDRjb2JqU1Nr?=
 =?utf-8?B?aGdpNlNsMDk0WVJaQmpKVkE3ajVYSXo3cUpLNTMrM0dLY2RzTWU2dk11bWY4?=
 =?utf-8?B?OG1nNjlGdG52eFgwSGg0V01sQ2xtYmlhcm41U2NSazROaVZKeHBWMmg5UW1O?=
 =?utf-8?B?bS8xWWJHcFZVNHJHWTJCdFNzbkVsOXFPNloySFFndHJWdzYyODNGZVdrQXNJ?=
 =?utf-8?B?OEdxMnVrN3ptSVNBdkx5VXU4V1ZHR0E2RjFiTEU2Q2YyVkZvbXNGcDFhQ2Nx?=
 =?utf-8?B?aDFjTm9NRHdwVDdQS3lHT3hTY3Q5RWpIelJGdmU3YU9kVndPWjdYZmgyOHQ1?=
 =?utf-8?B?NG1EenBFdm5sdXJRNDNzQWd0U1R3TUV6dGlUTnQzNStDc2hWZkRhZUcvYllG?=
 =?utf-8?B?Z3FpUUNQUHBWVXJqay9jU0FOdEVKZEMrWVVxc1lUczJpVU1mdnFWNnk2cWxu?=
 =?utf-8?B?UFZMWVpsaTdIL0ltamIzKzAxTkpvcGdZcmVQRWdaZFc0MzVmN1RNVW4veGMz?=
 =?utf-8?B?M25KRllJbzU5SmtKdG1jODQwcXVvSnE2dlQ5cnNVVGNsV3I0Yk96VHhLSi9O?=
 =?utf-8?B?cWdDR3g2dGxOTW4vc0tFSnNWTXNXdXdmcnNxS3ZRQXRxekV2NWdCcXhXVmk3?=
 =?utf-8?B?VExxOGxNUVY1bW9MUHN3VzNYMzV5L2RYSGZNRU1kUEg5Unk4WDRMS294LzNP?=
 =?utf-8?B?L0xRTHl0QjNOY2IwcEhqd1dZQUh2VmZuejdNMUlISllFcy9WZ1VSSlAwQ21U?=
 =?utf-8?Q?IzF3W2lTopWhuLJBbzpUfPyL2Q6BD3qG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V3cySmt3Tm9XUktCR0pITkc1a0NmRXZLa1JrRkd0Ky9XNEdrUTZHQUszejhN?=
 =?utf-8?B?dnBjL3c5UjQzRWtJcGtVUTlKZUk5TktFajUvS3VxcnJlSUxvdkxXQWswUENI?=
 =?utf-8?B?RTlDd3dweDAzTm5kUy93KzI2VlhHN1o1TUY0enordTFSMEVZV2ROTDdISGZs?=
 =?utf-8?B?bElJcmRWS0tGVC85R3l6dm1MSmJwYVcyNmRSRHpJNUVxU2ZJRDZEWEdSeHpW?=
 =?utf-8?B?YjJpNkF3eGd3YlZ4ODdkRDUwWkpKRUF6aU9kQUhTRUZQeWtadTUrRTVkdlVk?=
 =?utf-8?B?NGxBVG0xWXVnZ3lTZ1BubERzT3FQdThBVVZVbVVzTDB0bXhtVXNHTWdZakd2?=
 =?utf-8?B?bXFvWmNzbDdwVU1FWXJrYndCRk9XbG9CSVExVDJsYjFKUnM4bmhPWjNNZXI5?=
 =?utf-8?B?Yk5ObkQyKy85Mzh6NjZKREI4T1N5NjlXMjU5T1hYQVYvWlRJYUU0TWVEYjlI?=
 =?utf-8?B?SEx1S3I2NWZhVVRwaGFIRXVGdXhoWnJFS2JHdXJwVktlcnFYVnZVMVBicGtB?=
 =?utf-8?B?REhjTmxzajNtaEl4cDQvRHZDR3FmNkY4YzhUemorZzZrT1BCUkg1enpMUVll?=
 =?utf-8?B?VCtsVHk0cUFxcjVvbGtDazgrRXdJOFYxNzhJbTFCWXArMVhXRUNPWmJNWTkx?=
 =?utf-8?B?bVdxOTRrL0gwRmtGdUVzRFlzem84eWMvaFJNYXZMMk1ueUZMRUR6NEp5K3d2?=
 =?utf-8?B?d2pIbVgzRDFGZU1lckd4Sk5mZTdIVWZKNHp3bmV1ZEVKdWxyWlVNQ3ZKeU9l?=
 =?utf-8?B?THRUV3dFM0NyamQvWm4reDZmdTZPbmltNTJ0OFYvdWxUaDIxV0lsK3dNK0F0?=
 =?utf-8?B?VCs5dmttak1QN3RxWEdTa1JZNzR5WnRSMzdnclBacHQ4RUpYelZveFFPSlZm?=
 =?utf-8?B?M0hOWXRxVnp1RkhIZkFIUk11azFGd2oveUREZFF1L3BwMHZrZDNtbTRKUkc5?=
 =?utf-8?B?ZVNVT2JSRzFpVFhXeWt4R3M5ZGJXQW8rZ1hqR2ltUnVkZ2ZrRHRyM2QwcTRQ?=
 =?utf-8?B?K1ZjUGVVNVJ1NkRWbnBQRnB2VFVZS1VZZHZpUUJ2cXY3MEY1QVVZRERjOXpn?=
 =?utf-8?B?aWFSTE5aVGxXbjRWWStKSHYvQkhHOGpqbmJDcmh2RHZtZGFkK0h5ME5nZmFL?=
 =?utf-8?B?NmVQKytsbVFYS1RSejVDZmplT0dDMU8wR1pGYjhBN1RHbldIL1dmQlI4d3RW?=
 =?utf-8?B?eXRLYWg5RWZadG1qQmM4b05oWDg3ZFFzTy9BbUVDRXEvbnVodS9KWDdhTXRY?=
 =?utf-8?B?WE1tdFNyVHl4T2ZiQWFyaGZ3b21EMm1UcDliYXZEeDVjQTl2QUJCVnNiS1dJ?=
 =?utf-8?B?Q2hLWkN6eWl5SUVLYkpkdC95OU93eDFGQUt5YWRVMWRINmpVa3UrTlJST3Iz?=
 =?utf-8?B?VmNVT2tBRlJiTzNleVdrbVhjVmlqMzJIK0lUL2VNaytpVUZjQS9uMWRvOEoz?=
 =?utf-8?B?WUhXTFArL3VWRDRFTmNISGRUck0zaS9qV0dTVkREVDRSNG9Jb0lTSUk1Z0pK?=
 =?utf-8?B?eS9qQ09vVTBKa29pSFNTQjd3UlpPbEQwTWVCYWFsRzRxeXZsSzZ3UXpnNmZW?=
 =?utf-8?B?RGVGY1JzajdIRTRmc3QyMVNYekJYMlhvTVA3OGV6MlAxTnZJWmgvVFRlMWM1?=
 =?utf-8?B?RWtnU3RoWjFBQTgyWWpwdSswMVhLS1VOVDhTNU91eXZ3V2tOZVk1WTcvQWNG?=
 =?utf-8?B?bktTZEh2Vk9sSHhxNDJGU29sL3ZUSGg2d2lldGFaNXk3c3lId2tvbk5GcnV3?=
 =?utf-8?B?S0tjR0MxSjlINlJtdHp4Z3d5T0JObHFhY1UvTzlhTGdUdFJGS1BBckNpSU1u?=
 =?utf-8?B?SUJlcGRYUFRmb0VqY3JBKzRIUjBNUkQzY2tjSnNPWjhhZFZsRkZsN1JUaWF6?=
 =?utf-8?B?U25qdmJCVWxTUktyTDZIZUU2WDV3SmtZak92N1plaTlmN21WTGUwRXB1MWV5?=
 =?utf-8?B?SkhRRCtyTk9peW9rSUZNeG5RTm9kdms1Wng4OTNtaHBZUWlPNzQzUENPZ2RM?=
 =?utf-8?B?Y0N3Ujh5UVFQMVBmTW9EY1gzNTdwRmVYZStPYTJuN1dPZDhHd2lhNWtMLzZo?=
 =?utf-8?B?MDF0R0d1dEE5TTljN1RVTVUxUVRjSGRRVnAvRFB6ZDZYT3c3N0M4WWpEdFpm?=
 =?utf-8?B?eGNDUFlFMTZtbjVjbitFd0Y2Z0NDM2c0aDlOUnRFbk9TUmlGc0JTMGNacFVC?=
 =?utf-8?Q?vfYymG3yFR2tJC/rMit2FulWAsnF/a/3Sg/yj4/8UI+1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 896ab791-c97d-432c-24dc-08de11385831
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2025 06:58:03.1583 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cD+vYROEyUE5gJdGdktlvSDajnacJ/pvd19F/Z86J0txEqbqyDg/2vAVHBXgnk8qAGdWJA3e6L5BeUjaSsNQsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8800
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

On Tue Oct 21, 2025 at 3:55 AM JST, Joel Fernandes wrote:
> These patches have some prerequistes needed for nova-core as support is a=
dded
> for memory management and interrupt handling. I rebased them on drm-rust-=
next
> and would like them to be considered for the next merge window. I also in=
cluded
> a simple rust documentation patch fixing some issues I noticed while read=
ing it :).
>
> The series adds support for the PRAMIN aperture mechanism, which is a
> prerequisite for virtual memory as it is required to boot strap virtual m=
emory
> (we cannot write to VRAM using virtual memory because we need to write pa=
ge
> tables to VRAM in the first place).
>
> I also add page table related structures (mm/types.rs) using the bitfield
> macro, which will be used for page table walking, memory mapping, etc. Th=
is is
> currently unused code, because without physical memory allocation (using =
the
> buddy allocator), we cannot use this code as page table pages need to be
> allocated in the first place. However, I have included several examples i=
n the
> file about how these structures will be used. I have also simplified the =
code
> keeping future additions to it for later.
>
> For interrupts, I only have added additional support for GSP's message qu=
eue
> interrupt. I am working on adding support to the interrupt controller mod=
ule
> (VFN) which is the next thing for me to post after this series. I have it
> prototyped and working, however I am currently making several changes to =
it
> related to virtual functions. For now in this series, I just want to get =
the
> GSP-specific patch out of the way, hence I am including it here.
>
> I also have added a patch for bitfield macro which constructs a bitfield =
struct
> given its storage type. This is used in a later GSP interrupt patch in th=
e
> series to read from one register and write to another.

So IIUC, this series contains the following:

1. Add PRAMIN support,
2. Add Page mapping support, albeit this is unexercised until we have a
   user (e.g. buddy allocator),
3. Add Falcon interrupt support,
4. Add missing bitfield functionality, albeit not used yet,
5. Various documentation patches.

This is a bit confusing, as there is close to no logical relationship or
dependency between these patches. I see potential for several different
submissions here:

- The core documentation fix, as Miguel pointed out, since it should be
  merged into the rust tree and not nova-core.
- The bitfield patch is a useful addition and should be sent separately.
- PRAMIN/Page mapping should come with code that exercices them, so
  think they belong as the first patches of a series that ends with
  basic memory allocation capabilities. But feel free to send a RFC if
  you want early feedback.
- The falcon interrupts patch does not seem to be used by the last two
  patches? I guess it belongs to the series that will add support for
  the interrupt controller.
- Other documentation patches belong to the series that introduces the
  feature they document.

