Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A04AB3DAD5
	for <lists+dri-devel@lfdr.de>; Mon,  1 Sep 2025 09:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE8C10E392;
	Mon,  1 Sep 2025 07:11:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dq0v2mN3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2083.outbound.protection.outlook.com [40.107.95.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4782A10E392;
 Mon,  1 Sep 2025 07:11:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LsN8EYlj4jzfAwU3+ibyA9WsthMYFsWC6+PFp+4So1rcvOP2WBMxU8vAXHFMw9CN6w5XfHTLFXNIiG+OTvhMw9t730JUWN2B0gsLSwXGgAheq8WIs+8K/qE0/tNeJCqPRQJYUkXEbPWZoszzA5Tp5yU/DypwjAPwHwO7M6k2DziIs9y9nN6WBZoPDN0NQV3zoODQrGeLovzQdYxaR66haBQr2JE1QfI/P+tXPl+oNgULvY94W65N6rAgpRS1WOIjFzqPhgNyXgNg94EEQGrNg90/Xl/PTl5VD3ViZEnQrxUO6bInlcAPxptPSLm6QDZdI2K+kNxb1EM8H2B02gXocg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vpVlHThswQ0YpCl7XuUxwDTNnM0LOvEiEdqtMB5YglE=;
 b=J7ZTEt7iH4Y8ISxBzNjWRE2/deQphaWJjDyb7qwiw1Tdbg9lzy5ALU1TK70GzY/1QfXnnbacqKqVCHKRSSB7v8VsFbxGBkIuclqolkKO99pmAMIM7mTAZimKzoxk00szvKANxpW7Jd8XXlHcW6G8rT2s1q9h2/QftmPP+CVxQuj/jS2beStCjAf1epouL02gd+gTFdW/IwXglqhR56WnZ9OtjB8/wTEzq00Sar5CNvWE6WGWU/aUiVNO2uRwdKn5CS/Xr74qa3+HU4bPcVEjnn22ovIG98bBB0cxqMA7RcX7cMhEDBvtBCFVNaooaNmrl+1jv+5FdEXP8sgAERtLIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vpVlHThswQ0YpCl7XuUxwDTNnM0LOvEiEdqtMB5YglE=;
 b=dq0v2mN3jozuh0GMAYtsIgKXSB9zX4QLXUCrv0oPQNpS3OpnEGj1x+Zam7ulZ9VF8VaEMFY1c2f1turgxHvcfYOmmRmpCFRsVxXm8vmGTDn2LpTKDh4m5Gv88dyKhvaREEzbN5ghqkJCxRM8lkenEHIvjZRA5n//MQY2j2QZqJnCkbaeVtvyCvQVnPysjHCBI7QBLF49kx5SiP65gmIPo+mWSovYdcNhFw7Adrq4RcWvdLk+rwf6dG69G/JQT/UmcU3S2uB/kx2h3VUoGTYTcrF0EpWfyXXxR2hbBOuBbBCe0OQmhnEn+wgCvep6wXDSXgklY9LHEQollFe1k/6kbg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH8PR12MB6841.namprd12.prod.outlook.com (2603:10b6:510:1c8::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.22; Mon, 1 Sep
 2025 07:11:08 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Mon, 1 Sep 2025
 07:11:07 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 01 Sep 2025 16:11:03 +0900
Message-Id: <DCH9YHZ4ZCC7.36PEB9YXWP0E6@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v2 5/8] gpu: nova-core: firmware: process and prepare
 the GSP firmware
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-5-93566252fe3a@nvidia.com>
 <5338bd30-f3ed-42c7-af0e-77c3ef7d675d@kernel.org>
 <DCEVAXNB3EL9.YFTIP5RQCTUW@nvidia.com>
 <e249a1d1-f1fb-4818-b9d6-e0b5c17c61a5@kernel.org>
In-Reply-To: <e249a1d1-f1fb-4818-b9d6-e0b5c17c61a5@kernel.org>
X-ClientProxiedBy: TYWPR01CA0046.jpnprd01.prod.outlook.com
 (2603:1096:400:17f::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH8PR12MB6841:EE_
X-MS-Office365-Filtering-Correlation-Id: 1df2f4f3-de3b-4c50-11b9-08dde926b8c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VGJzN3IyaitzT0FDUGFDNGQ4YWdUazBLL01BOUd0Ymc1QjJmMFdPTk9yekFB?=
 =?utf-8?B?WlpoVkp2ZldPK2lwdElta0tqQjZBY1BaR2FSaU13cjgxdWs4Q3l1eDN2MHE3?=
 =?utf-8?B?c1llMGlVVkJwTzh2MStuVnNCSkZ5OFhYbkpqejV4M1NTTmZlTnAvbWM1VUQr?=
 =?utf-8?B?OUlFM001MUdWVUUvY2Vzc3pjL0JVcW80bmpZUlpBQzdjdE5VWVpEMWp3V2hw?=
 =?utf-8?B?TDNpMmRkM3hZZWNTd0VNZDBQNXBEM3o3NEd2aEZDVUYxek9XYlF5WTZqZ0pY?=
 =?utf-8?B?bmJFNG5WRm14RjZVSG1SeDlLOFdWQy9KQ3NIUUZpcXh6RmtuQTFJNGpOZDJo?=
 =?utf-8?B?ZE5BRS9jaDhBK3V0WHRBMzUrOGdXdzdyckVoT0M3ZHFzcU9hbHV2THRkS3hx?=
 =?utf-8?B?NXR4UkYwallHVmIyOG9TL0hKTFZsVFVocmt2ZkVLSkxoUmdSek1QT0RBWDg1?=
 =?utf-8?B?YlNoU3dNMCtWU1lPUHNwT2hNYkNTUzJ3RDJnNXpFdzQ5VWlmdTQ4S1prd3Z1?=
 =?utf-8?B?K1U3Y0F4WW1Qdk13VGlocE1sdXZ2UGlVR2JVTjFqeElDZU05RGxOY2lWVXhF?=
 =?utf-8?B?WEVIUWkyU3lGcHVGcGM0REZpQmwwaHJ0eUIxanp6cVpEcTFkbU90UzNoUHNH?=
 =?utf-8?B?dGk3R0NHWVRMZnZHL3B6TU14TjVmT3A0ZndoWDROUmxPQ3Y2QkpIRmExdFdr?=
 =?utf-8?B?UkZ5RU53QUV6bklUOGRIYU04dHI5cm5tQmJ5MU40dys1Rnd2Z3FDMFlRZy9Q?=
 =?utf-8?B?Tytpbkl2VktteVRkQjdHRWlHZldTaXQ4dWxPQjZpWEtUc0lZVWhrTHlXVDZJ?=
 =?utf-8?B?TDFGRE56RFRYVDM0bXdVRFhEczJXdmlubTdQT2Faajc4UUZjQXRndFVXNFBE?=
 =?utf-8?B?VVo1TTFuU0hNWTV5QVVFNUJUNmtCVXMxWU9zRXRQKzVqRWxaMmw2KzgwdEx6?=
 =?utf-8?B?ZW1hbkpUTEZBSTNZV1JuaXd2UnpzNFVOS0k0b0hvaHBnTFFZVW9Kb1c4czZJ?=
 =?utf-8?B?TmVtNEY4UVhwMkx0QVNCV3dOM0kxZWdiVm9IR1ZGMGZYN25HRlBxTjdmQUVE?=
 =?utf-8?B?UG16dWF1Q3BjeHNlbWZCZ2Q2eE1CWnZ2NWwxRkkwSWhmYVk5WUpCVGFReGRP?=
 =?utf-8?B?c3JkS0FtSXlGQVhsZWRRUzNzelQ0YnlQVTRiTUZjano0cE5OUzN3RjRvcEhU?=
 =?utf-8?B?b1hSdlVpTXBKMW1XNkNQVlVmbHZtVHlhV1pmd1ZPenRhSG16L24rNFlkZ1Rm?=
 =?utf-8?B?VlRhV3ozdzlxdUNiUUl1ZG80WUh1cW10L20zVEp6bUZSMkNrK09pM1g5Q0h6?=
 =?utf-8?B?VTk3UWpKUW9HcU5WY1lja3RMZG52ZFZIaUdaK29RU1JsVHdoOGUxRWc2Vmdl?=
 =?utf-8?B?ZnY5RWF0N1FsbjZTcTdpM2RucFJNYkkwRVBITGpqaXBWTkNnL2g4Q3hnWGZO?=
 =?utf-8?B?NGE0d3lpbmFjdTZycytqWjhoaWw0b3hvQUhBeVo4cnpWd0tYc2RzVzRCZzRh?=
 =?utf-8?B?eWpTZ25uSFVVUGJhZCtVU0UvNEdLUlNWT210SGxEOXEweXdDQ0RJeURlbWVn?=
 =?utf-8?B?VmkvdW9KVEVlaHFETzFNc0I2RHR0aTNwSy9USDhCZnVDVHA4TndMS1VJSHQr?=
 =?utf-8?B?NzBuMHFSN1h0ek1uVzdlc2h3OWswN3FNNHFoMXFQZHBJcU1hOW5KU2NJZEZa?=
 =?utf-8?B?WlFLRkJqRFIvZ2svdVhJVFppeXV1aFBIbnV6MmRyeC9vQllsbVEvYmlxUnJF?=
 =?utf-8?B?NXBIVytRdmZGanFaQm55bXBVa2FYbjdqV3AwSDBNMFZRMDdKNDNkTmh3SFhY?=
 =?utf-8?B?YmVib1JaV1B1Q3JJWStGTTQ0ZUJxWS9HaEd0cjZiRGh5TDdlb0I5MUxvYmEr?=
 =?utf-8?B?enNMZzRTN1o1bmthVnk2MkVsaU1tNTEyWkV0ZHFsUW0rbmJBNFN6Y0NGYnBJ?=
 =?utf-8?Q?kjK5CyP/f6k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NS9ma29oTHdBZmRPY082ZjhTYTNCODNFbncrTVowTHJUVVI0SC93QWcrYjNY?=
 =?utf-8?B?TVVOZFE3VmUxMUoveU54ejFqUFNEQ0lwRHVqeHdFRFJQVE80c21NWkMyMVN1?=
 =?utf-8?B?Nmh3RFhYYzFGbDhMTUhrWXN2WllYYzB3NDQwY2l1NWVadGc1cmxaUSt5d0ZS?=
 =?utf-8?B?UmU5Z21GYS9ScjdyVnFuak9vSUx2NTdZeW5BTnorSm5JaWtOZ25CaW9ucFhP?=
 =?utf-8?B?d2Q3dkRBTXBTRkRuSDY4UzRqRE14dkx1R1dxUklXb3JybXFpdzJlNDhkOGtw?=
 =?utf-8?B?YjZnbXlib3kwd1kwc0ZHQ2UvUlVaVE9lS0M3NytuYUdORzBZMDhiT1l0MWdu?=
 =?utf-8?B?VzNNNmxGMUxJSTREQjBkUkttUHRXeTl5Q0VnNGMyYVNxUzJrL0crYVRvOGFB?=
 =?utf-8?B?dTNzMjc0cHRIaE1xckhEWXlzRzliM2FGTXFxYVJCd1NNQUdlTTVOLzhTck91?=
 =?utf-8?B?T2JmeG9JMDJzVWtZVlFUbS9sUWVJWHd0QUhNWGJPZDVHcWtKL0JzMlp2K0Y3?=
 =?utf-8?B?emFWcUJjZGFUSDkzT1F6WmN3L0I4QjBWdGxxVC9lTXJKREZzbE82ZHpvRHhC?=
 =?utf-8?B?MmlZM2kvQjA2RTRibkN3L2RlSkFYaWQvSGthdHMwL2tudmRTMmM4d2lETUhW?=
 =?utf-8?B?eE1rS3N6SHMyT0cyeFFZbmd1Um9NSU84YlBDYUoweHhPVWJLbW9GRVdjZnJs?=
 =?utf-8?B?S2l1RC9VQW4vaFlydVdxamdzNzVndU9WMEVQYlg4bmNRZURXVVA5MWdUd0lY?=
 =?utf-8?B?SUZ1Nmo4N2ozdEViWlZRbnNhV1RxZ01BdkdGa00xS05FaWl2TWxsaEpFeGo1?=
 =?utf-8?B?bUdGeWxlMFhRdnphTnlkMTlXM0VDVlFEV1FXVTJ2MUFCZGFORFZrbHN3RkNq?=
 =?utf-8?B?YXE0WksrN0hLMU11UUpvT3RIbDJRT3RZTVBoUXBtaThINGtxeEdOTGNERGxm?=
 =?utf-8?B?ODJRamdxQzNwS1EzeUFqaWJpOTJTRndubDVvdk1McHc3dEZya1JZYWpVWmpF?=
 =?utf-8?B?Z3p3VmlzYXFwZGt3bG1jY2pWL0x3OFNWYWNQUFpHQ3lxMklma3ozMFlWUDZU?=
 =?utf-8?B?SktDazJZdFh3T3RmN0luYWxzeFVUeE5uMWZraGZ3Y0Y3NllCTURmZEFGekFR?=
 =?utf-8?B?MjA4ZjUvVE11SmZocGN0UVJZMkxPbUpZbjFxUkNuRkJ5N0lqQWFCUzBDUURs?=
 =?utf-8?B?R1diNTgvZTcyNGdUeVI2T3ZhMHZac1I3cWdiaE5JeW9SSm9VeTN5QW1jTXR3?=
 =?utf-8?B?blF4K1pMMUcrMTRmOGJJS0o2Mnp0Z3NRV3lWcFVmZ3c0S21WaTF5R3RpQnQ4?=
 =?utf-8?B?Ukd6alA1NzJYeFJrOGd3T1BNZm5DT0RDL010R3hOYkVNRFVrVERCQVlsYVRk?=
 =?utf-8?B?M290T1JHYWtWd0wzL0x2VGVMRmJ6NnFneDFFWC96T3RoTjkzTVA5Y3ZkT01N?=
 =?utf-8?B?RmJQbHpKTTRyRVVNaEhNMTI4cWt6bDNQWFpYWEUzek5MQTBJaWFxVXRta3I3?=
 =?utf-8?B?d1MwWTNGOXdNdllRS1NwV3Z0eWJjNlora2lNdHBoSDZVc20xL0MwR1dRbGh4?=
 =?utf-8?B?UC92OXZZcXAvRXVEMEszNkVBTHZqZlI0WlNvWFFlQWlNU0NuZjh5M256UGpB?=
 =?utf-8?B?VFBsZ0pJcUV5SlU0VXV0MG1nblhrUlA1KzNpYzhvMXJ5VGNzblJGcll0UG1k?=
 =?utf-8?B?RENKcGJrTndEYzF4RnZjcnRQV2Jra0E3MjRvaUF2dENIUzBab2NrSE80NTNh?=
 =?utf-8?B?cTREcjBjaUJMYmJ3eXl3bTFjdWM5WmVzcTVTZE44SC9jaGFDaER4bXlUcHZv?=
 =?utf-8?B?Y212aWdEK0dTTFBybzBPdmowVmhlc3VLOHFFV2JXSU9iRWVHUTFvVm5YYTF6?=
 =?utf-8?B?S0JpZ1RQdFo5aWZDemRYdkdpbXkwQjdMaWxmNWRzcHp1ZzBYRnBVQmx3L0xW?=
 =?utf-8?B?cUEwWnJhVXU1QnVDV1p5UmI1RXNFU2N2UUd6Z2YyM0xxdC92ZDlhbWhHc1pQ?=
 =?utf-8?B?VGdsakxPclNtNlVxRVRNRU5lRmtoYmticEt6cU8za0tmeUlUVG9GSkw4a2ln?=
 =?utf-8?B?dkFGWi9pcm54U1Mvckg4dDEyMklzaWcxNmd2U1dmNWlHQUlheDY2M2RWVGxI?=
 =?utf-8?B?V2c0Qm51bHBKelVXcWRnSXIvNkxEbTlRTG9ocjdDN2NlSkZHUmNZNHhsR3R2?=
 =?utf-8?Q?BDkxhpvifee0X25sXbMmwcjcEb3n+xY8CDzv7gbXjUde?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1df2f4f3-de3b-4c50-11b9-08dde926b8c2
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2025 07:11:07.6468 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O/ryeHELaKhFTJoglgpm1ELFRsVvIjuuIHt1zGtqQ3yZVzoUL8hkrqCcSOPeBvrEb1TXdhXY2YW/K/bYSkZDMw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6841
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

On Sat Aug 30, 2025 at 9:56 PM JST, Danilo Krummrich wrote:
> On 8/29/25 1:16 PM, Alexandre Courbot wrote:
>> On Thu Aug 28, 2025 at 8:27 PM JST, Danilo Krummrich wrote:
>>> On 8/26/25 6:07 AM, Alexandre Courbot wrote:
>>>>    /// Structure encapsulating the firmware blobs required for the GPU=
 to operate.
>>>>    #[expect(dead_code)]
>>>>    pub(crate) struct Firmware {
>>>> @@ -36,7 +123,10 @@ pub(crate) struct Firmware {
>>>>        booter_unloader: BooterFirmware,
>>>>        /// GSP bootloader, verifies the GSP firmware before loading an=
d running it.
>>>>        gsp_bootloader: RiscvFirmware,
>>>> -    gsp: firmware::Firmware,
>>>> +    /// GSP firmware.
>>>> +    gsp: Pin<KBox<GspFirmware>>,
>>>
>>> Is there a reason why we don't just propagate it through struct Gpu, wh=
ich uses
>>> pin-init already?
>>>
>>> You can make Firmware pin_data too and then everything is within the si=
ngle
>>> allocation of struct Gpu.
>
> Thanks a lot for the write-up below!
>
>> I tried doing that at first, and hit the problem that the `impl PinInit`
>> returned by `GspFirmware::new` borrows a reference to the GSP firmware
>> binary loaded by `Firmware::new` - when `Firmware::new` returns, the
>> firmware gets freed, and the borrow checker complains.
>>=20
>> We could move the GSP firmware loading code into the `pin_init!` of
>> `Firmware::new`, but now we hit another problem: in `Gpu::new` the
>> following code is executed:
>>=20
>>      FbLayout::new(chipset, bar, &fw.gsp_bootloader, &fw.gsp)?
>>=20
>> which requires the `Firmware` instance, which doesn't exist yet as the
>> `Gpu` object isn't initialized until the end of the method.
>>=20
>> So we could move `FbLayout`, and everything else created by `Gpu::new`
>> to become members of the `Gpu` instance. It does make sense actually:
>> this `new` method is doing a lot of stuff, such as running FRTS, and
>> with Alistair's series it even runs Booter, the sequencer and so on.
>> Maybe we should move all firmware execution to a separate method that is
>> called by `probe` after the `Gpu` is constructed, as right now the `Gpu`
>> constructor looks like it does a bit more than it should.
>
> Absolutely, executing the firmware should be a separate method. Having it=
 in the
> constructor makes things more difficult.
>> ... but even when doing that, `Firmware::new` and `FbLayout::new` still
>> require a reference to the `Bar`, and... you get the idea. :)
>
> Lifetime wise this should be fine, the &Bar out-lives the constructor, si=
nce
> it's lifetime is bound to the &Device<Bound> which lives for the entire d=
uration
> of probe().

The &Bar is actually obtained inside the constructor (which is passed
the `Arc<Devres<Bar0>>`), so I don't think that would even work without
more clever tricks. :)

>> So I don't think the current design allows us to do that easily or at
>> all, and even if it does, it will be at a significant cost in code
>> clarity. There is also the fact that I am considering making the
>> firmware member of `Gpu` a trait object: the boot sequence is so
>> different between pre and post-Hopper that I don't think it makes sense
>> to share the same `Firmware` structure between the two. I would rather
>> see `Firmware` as an opaque trait object, which provides high-level
>> methods such as "start GSP" behind which the specifics of each GPU
>> family are hidden. If we go with this design, `Firmware` will become a
>> trait object and so cannot be pinned into `Gpu`.
>>=20
>> This doesn't change my observation that `Gpu::new` should not IMHO do
>> steps like booting the GSP - it should just acquire the resources it
>> needs, return the pinned GPU object, and then `probe` can continue the
>> boot sequence. Having the GPU object pinned and constructed early
>> simplifies things quite a bit as the more we progress with boot, the
>> harder it becomes to construct everything in place (and the `PinInit`
>> closure also becomes more and more complex).
>>=20
>> I'm still laying down the general design, but I'm pretty convinced that
>> having `Firmware` as a trait object is the right way to abstract the
>> differences between GPU families.
>
> Makes sense, it's fine with me to keep this in its separate allocation fo=
r the
> purpose of making Firmware an opaque trait object, which sounds reasonabl=
e.
>
> But we should really properly separate construction of the GPU structure =
from
> firmware boot code execution as you say. And actually move the constructi=
on of
> the GPU object into try_pin_init!().

Yes, and I'm glad you agree with this idea as the current design of
putting everything inside the GPU is a bit limiting.

Regarding the firmware, I also think this should undergo a redesign -
right now we are putting unrelated stuff inside the `Firmware`
structure, and this won't scale well when we start supporting Hopper+
which use a very different way to start the GSP.

I'll give more details in my review of Alistair's series, and hopefully
send a v3 with some of these ideas implemented soon.

