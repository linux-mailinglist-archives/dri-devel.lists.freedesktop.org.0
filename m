Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 54D71A947C4
	for <lists+dri-devel@lfdr.de>; Sun, 20 Apr 2025 14:20:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85B8F10E32C;
	Sun, 20 Apr 2025 12:20:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BigI8zzt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E2B10E32C;
 Sun, 20 Apr 2025 12:20:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pWynV7RaRyi6DXhrZ7aGNkUl/Krs2S+UuoqRk8xO2o6SWrphi0HbNwFcnIjMfV/OhN07C6nfi+v6k3HP/H1/Ap0o16meqNXl3Qy/pgVDeCsndHYU2Cq97maUIF+vOrJZDfpjtPIs+PlxQ/uz7/yH7q45KuwNRX/TGLuB4tvISQ8AFVPL6j0nHDL5ubAQRXw/3llMjkDTAOTz5VA6ztaNCmE7xI8hVe553TCT1LwKPeaWq2UEkAjqpGORjVySZ8RpmE9LpugHr6OMEF0+d6YvibR2U25lwNAi9e8lJIgB/RZFMbxlkJTzE10vHW9r2qaScpDWDfUe87bQ24fYoquTqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5q1DLsbggUy6nA/vvuMo6CHEN/wFF6JGXvl3n2fdKTQ=;
 b=HH0WEg+FGJ1isDpJU232vh8MxFWxFwmPy0Q1B8Sfu/piHMOk3ift0Vp7+NpJXwnmnFhGpIb6yd018UAACK3nPyFlqLbztBE8P2s5DwIM5T2GQy19vybYOX+NGou8DSVEblhqAAtVIJ2+iZJXDbXaPoepYnfJc6QfW45/KWNIllrIK/q0WNBWHfPH3+V5WLlldSR7PGCicEO2bJl86pvu1pfn5myaJ+9LhEWuEOssNu+RuA6uqmp6CYEdra1B8b8SpfR0PN3+vyPq/02GmVi6GDlUreQdTvCybUHFf/2GRbtTvjjKNo2z38fv+wvQmJrbdlvrbAkoV9VEnEq8d04aDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5q1DLsbggUy6nA/vvuMo6CHEN/wFF6JGXvl3n2fdKTQ=;
 b=BigI8zztAv/9EBTCqNXQG+vvFE51e2mK/Du6VTfvas5T0xW6ohzTO8mL/8zTqKrBFaoUW2DPJvxIckjgZRFNZSyNzxY7rGwQmfcSDnQueV5u1JGRFJUerGgMNc9fyRXVWnOtWLGEYPoeNBkPmDv586iz2rSwroJapiEXusXmkvObBRXtU/ohNgGm7dFUxLj3GNMDkRVj6DYp2TSMqjrfyX/VaM8atXatLpR/3npB2vurbkEWnZd60tI2jYeDmHslcuu4sjIdxKX99Qj5d+geFypatmW/w+izZ8NPa8yF4x560Iy95c+jfkGDA+LR9TYPxLhMSWXF7QjaPFkSMvO11g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB9175.namprd12.prod.outlook.com (2603:10b6:510:2e6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Sun, 20 Apr
 2025 12:20:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8655.025; Sun, 20 Apr 2025
 12:20:45 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 20 Apr 2025 21:19:48 +0900
Subject: [PATCH 16/16] gpu: nova-core: load and run FWSEC-FRTS
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-nova-frts-v1-16-ecd1cca23963@nvidia.com>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
In-Reply-To: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0073.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31a::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: a8c0cba1-4a35-4986-41e9-08dd8005c6e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SzFFSmhqOXRQSlY5NHp1R0M3N0I2YldMTnJ4dUFSTWZYOUNwVjhFRnd6MGJF?=
 =?utf-8?B?SVVGQU8wVWR5akF1aWVxdmNpS1lkd3QyQ2F5cVVHWmtsVjNMWXBXUnAzZGhC?=
 =?utf-8?B?d1FGSGdqbXU3M1JlT1BGWFBUMjYyeTlBZGFBaFh0ZUJxY1N1cXdqVlF4WkQy?=
 =?utf-8?B?WVJ2UERKV1p3RXFHR3UzMnlPNmdHTkFPam1ZNFpwY1FwU2c1cXhPdDFCWGU1?=
 =?utf-8?B?MmF2UlJpR2N4d0pSTFI3YldUbFRsdE5YT1J0ejh4VzlabEpFUUFnQThZcGdt?=
 =?utf-8?B?UTRJRkFwRWVtZXByaUpqTy90VWx6MVpTUk1JTWFrK0J4RnNCa0ZlZ3UxNUlH?=
 =?utf-8?B?TUJHQWowQ0JiRktLdWJPSlphckpkc0xveUpCeURLa0ZyRXpSS00yb0JEd0F0?=
 =?utf-8?B?NGVZckVwMTVYWExIMXVhVWJZemgyNjlYVHV4SWhMQ0FxenAxU2ZUakRLbEtm?=
 =?utf-8?B?MHhsWitRNHZjbjZSS0F3N2YwbHhuVExiT21vOXI4WU95THdtZi9nWUVBVFM4?=
 =?utf-8?B?Y25WbG9kMjJjb1JVLzdDMjk2UzB0YnkxdWYxRlNzUGYwTWZWV29RK3VZM1pI?=
 =?utf-8?B?YWVPNGV2Rk5xU2MyVERQR3UxY3NoMndhc2FSN0FWbDhQcVJZeGJmSkZZc2xO?=
 =?utf-8?B?alJRZ1JOME9vWitRWmMyOUxYWVV6WlhybUdwOXlYeHJqVGorTTdaUldRN3oy?=
 =?utf-8?B?bHJha05BTmxmWmptZG5QdWFndFdyZlowUkRsYUMvSDRadE1XbGUwSERNbG5t?=
 =?utf-8?B?Z205YkxKR2h2b3UydjkvQ2RiSkxESTVBU1llSndGaGZNR25Ma0ErSHMvWDFh?=
 =?utf-8?B?ODNucm9nTkZ0TVVpRzJxZlNQRCtLbmFmR3FZakN3OE9RNVpKendDYjF2Tm84?=
 =?utf-8?B?ZHJ1d1kxU1VSS3dGUG5BelZMU2RwWkhreWF3Qm10eWpwa3pvelA1M1FRWHM4?=
 =?utf-8?B?bGtaOWxwODFLaitqaCtLbXp4Q1hSY0RNU2V2eGMva01mMVdjbEdBRkp0S0J5?=
 =?utf-8?B?dlJFNng2QWh0UmIzMzNsR0VUandBbUtjelBnUlh5NjNxamRHL3FMVDF3c1c0?=
 =?utf-8?B?VTBmK3NUKzRjTjluY241Ukg4aTFJc1EzMDY4L09QekhXY296bnpRMHJ0aFBD?=
 =?utf-8?B?T08vQzJvbFU3d3NVSVBySU1FM21UOWh4UEtMaXFjOUpaQTNnKzVPeGdoV1VP?=
 =?utf-8?B?R285bk5BT3VMM3lsM1N6VEovbzBXY1ZkYk43V2I4TzVkbVJNbTJtM3R6c0dL?=
 =?utf-8?B?NEJvNURVaUduTDB3UUdYeG9jc0hjZzRtaW9zOTRZVks1NTVkQ1p0YkNtTElp?=
 =?utf-8?B?N1ZGT24rdEIxNFNDVXpqRGlEbS9IRSsvVzhacHdTYmtYYTdBR1ZMdzZqR1pY?=
 =?utf-8?B?d2FBdTFMeFI1VWhSb0lCZkVqKzJPTjI2ZUY4Wm9Cd0NQUG11SnBVQ2xsVVlZ?=
 =?utf-8?B?KzNmTHBCY1dQYWdrTU5pQU54NUJaOXN4T2FselhiVEx5enFjVEQ4YU5MUEta?=
 =?utf-8?B?Rzgza0FtQjQvbEdpaGlydHdOYmJSQm5jd0NjeFMvMmtaaWlhRm5nUGpvMEJH?=
 =?utf-8?B?Q1FWOGxRaEIxcFV5UEEzanlHdmdMNXBvaE1QL2NJNVZUeEZtelVWRVBBenlm?=
 =?utf-8?B?ZE1LVUc0R0RReHB4TnhhcG8zQTZCMTdkWXRUUmI5eUducnNMVisrVGZlVWJr?=
 =?utf-8?B?TndwK3JqaFZiWXl1YlMzcWUxak9hdjc3Rk5INGU5eDNRQUJlUm9XVEZpZ1ZQ?=
 =?utf-8?B?TEs5d2NxYTB1bWs0TUFFUmI5YjNOWDIyc1haeW9iQmxtRlRFS2w3WU5EZnlW?=
 =?utf-8?B?NUh3N216MVZiUkF3blMvdWttbVF1a0pvVXcwMmoxOHFYZ0ZNZmUrSjlpTmlE?=
 =?utf-8?B?TFA4RHdGUUYxM2xFTi94dHNPY2hFYkNJem1xSzMzNi9icmhhN0YxMVpuMEpl?=
 =?utf-8?B?Y2VQdjNRbUZVOWNVcXU1d29FeU5wcU9hUExLTGJhNlRoaTRTckhCbmNZU0J6?=
 =?utf-8?B?SGdMaG9TSU9nPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YmVqZjlVaUxFU3dmV0wrVW50bnhWejIvNDlUaXlxWklMVEVBcnFlR3BpT29s?=
 =?utf-8?B?ZnpoQ1E2cXh6NDh1QUdTdDhCUUhia1AxNGxVZVd1dmNoQnRrclNtbTI2emox?=
 =?utf-8?B?OTR2ZUlhQ21naERjVmEreW9QeDJrOEUzRWFIaFNuUUZ4aXRFbTNlQm05TXpB?=
 =?utf-8?B?dTBqNHg4d0ZrYmNuQjlVM1RsanNhT3lRajRwdGtDY0xXcTVGalpNWUlBOTFZ?=
 =?utf-8?B?TzV5WnN4bWlkb0ZnZ2FJTmYxMmZmMktFRHlhdUxKRVoxMTlJSFpEKzYxUXZM?=
 =?utf-8?B?VVFpNGlkUFRXcnFJeml0TkZtM1dQM0xGRmRGZCt4M1ZlaHRpZWc5Z3hpSnJO?=
 =?utf-8?B?bzVtdDZyWUlTYkkxQkhjRFFvSE0yK1VOdXA3allHb0RsYjdFUzF6RUJaMWgz?=
 =?utf-8?B?ZG1lRVNGbUI2cm8vQzlqSFROaCtpUWlEM0twTys0d3U1ZlNFSGFtM2Ewa1dJ?=
 =?utf-8?B?T0lOeSs2anhaYmx3YXZNQTlROEh0UXdHek82R2s4NTFyOS8wNzhqaUdRM1hZ?=
 =?utf-8?B?dHJyZ1l1YmxHdjNzQ2NQMTcrMXpqNzNVcEJYNDlnbWpscXhZeGtEWS9RYks5?=
 =?utf-8?B?RTdiYlEzTU1kbkgzcU5McStRaVpHNEFhL1VUSVh0OFBORlZWbkpwK1RYM3ZS?=
 =?utf-8?B?Z3BlUHJmaGtSdDVleE9ZTFRBTVc5OENIN09YbUZlaTN4NEtrcUpjZ2QwWHF0?=
 =?utf-8?B?MTZubExoRzJXRC92TXNrRXIyZDJLWitqa3hTWU1waGRhSDUzUXZzdVcvRXQ2?=
 =?utf-8?B?RGM4Z2ZOVzRTb1pLOUpVdlVCVi9nZEppSUs0VXJLZ25uMUJVWjFqTzgyZkV4?=
 =?utf-8?B?dDNjTGhVeXl2Y2pRTnNjdEtZNWgxM0tHL1NMYzQrUDFLNFF3eG4xWFNxWGNt?=
 =?utf-8?B?R2JpS2xibzBkU3hZVTVuQWVicWs1V29naC9zMUc3NVh1Nld5RWhjcTJGMito?=
 =?utf-8?B?c3o1NTVtT2hHbzZWQ3RZWVBuWDdGKzJ4UUo0MWhHQnZRT2JIVHhUU3pWUTc3?=
 =?utf-8?B?NldrS21sOHV5UzE2aDdFNEh2UUhLSmpYKzJyRXFVOGJhd3FkQzEzZUtkZmtI?=
 =?utf-8?B?R2xvQUhGWXZRdTdSZkJQQlZxNUozWno4bGs5TjNIS3FUNU9lZm9kc0JWdStB?=
 =?utf-8?B?TklraVhIbDBIUHE4NjNsTWNwT1RDMitiL2lVbU5uMWkzK3c2WmRmTCtCNVNY?=
 =?utf-8?B?OFk5M210SW1DQ1o5b1NnZU5oaXVGSm54dTF1M3hTekdrSmhoUnpKaENJWHZI?=
 =?utf-8?B?NXo3NUV4ZUd3N1dqbWE0NTg1d0s4ZDBQdC8yc3dMWVMrQjQrT1NkS0o1dDVm?=
 =?utf-8?B?bzIxVEtWVkJaM2swM0FSQVZsSEVhNVdGblRyQ0V6WThWRy9QUG9nTWcxMVY2?=
 =?utf-8?B?UXcycVg5bGxxMkhWMGkvTXN6UDdOckRkek9IckczOU9NQ2dYY0lpVjNKSlJj?=
 =?utf-8?B?c2pzUWIvampDWnJQVTFkUlFuOHg4ejFVbFRJcVE4Q1BlZzlXcnAwZk83SjdO?=
 =?utf-8?B?dFhMaHMxbkd2SkY3eitHNjNoTjVsMTUyd0l5ZDJvWEJZS3RTRU8zYis0NW9S?=
 =?utf-8?B?VzVGV3hnRWtNbVlxekJGWjNOWEVOL1pMZlBXNkFQeWtOSWo5TUZjdS9FNU1S?=
 =?utf-8?B?MVFwL0pPbkswMTVXUUxzaVR6NlhJUC9MdzhHSnRhWlBhbmQvQVpOL1F6QWI2?=
 =?utf-8?B?QzBMUEpXZWcyNWFBZUtYSFpYWC94ZnZGT2E2TlRMSlpEaW1HN3FnWlpKTlpZ?=
 =?utf-8?B?dW5lL1J0L0laVGQ4ekl1bUxwa0xYNzE0dHROcGlEQlFYNHZpYVRHTXpTNW1H?=
 =?utf-8?B?S014QjN2MXpES1dGVFFyQ0hHbVBMbXhkcUMwRmd2N1lzTDd3MHNHVEdENlVM?=
 =?utf-8?B?RFVsQlIyUng2UGhpdHVsSzYrNmlHLy92L1ZGMTEyRis0OFZlcVdwa29obWFC?=
 =?utf-8?B?VllnL0Y4MlM5SmpIYVYzOTNiSGpibmYrckpaRDR0WGV5S3Z3RlgrZmFpcVBx?=
 =?utf-8?B?MWh5WVkrRmQ4RHVrZks0aWtzdjVjVDFVRVBvR0JwZEg4eGtJY0lZVjh5K3dN?=
 =?utf-8?B?OTRLMmdqQS8zblpYVGZ1dDhvZll0dC9wWVlFZi9RVVNtc2x6WGRYcUVWa1pS?=
 =?utf-8?B?Q3h2VElheXBYTGVpcTR1TGpBc091TDZHd1kzdGNEZGhnMTI3N3p5ZDYwYmxp?=
 =?utf-8?Q?7PLWZt7l6no4NYMgHkOMAsmtt4WT0bmxVqG3SKmnZSB8?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a8c0cba1-4a35-4986-41e9-08dd8005c6e6
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 12:20:45.7727 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWxVIBl2U/ADWBLwDJiL4O07JkWnylEwB+9OkiYgYAXuAqFEe/xa2lQP52OdDe9BXk1FvcP2hpqcICyNqRA3UA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9175
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

With all the required pieces in place, load FWSEC-FRTS onto the GSP
falcon, run it, and check that it completed successfully by carving out
the WPR2 region out of framebuffer memory.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs |  3 ---
 drivers/gpu/nova-core/gpu.rs    | 59 ++++++++++++++++++++++++++++++++++++++++-
 drivers/gpu/nova-core/regs.rs   | 15 +++++++++++
 drivers/gpu/nova-core/vbios.rs  |  3 ---
 4 files changed, 73 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 71f374445ff3277eac628e183942c79f557366d5..f90bb739cb9864d88e3427c7ec76953c69ec2c67 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -2,9 +2,6 @@
 
 //! Falcon microprocessor base support
 
-// To be removed when all code is used.
-#![allow(dead_code)]
-
 use core::hint::unreachable_unchecked;
 use core::time::Duration;
 use hal::FalconHal;
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 5d15a99f8d1eec3c2e1f6d119eb521361733c709..4d03a0b11b6411e22a652183e975f6889446ed46 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -250,7 +250,7 @@ pub(crate) fn new(
         let fb_layout = FbLayout::new(spec.chipset, &bar)?;
         dev_dbg!(pdev.as_ref(), "{:#x?}\n", fb_layout);
 
-        let _fwsec_frts = FwsecFirmware::new(
+        let fwsec_frts = FwsecFirmware::new(
             &gsp_falcon,
             pdev.as_ref(),
             &bar,
@@ -261,6 +261,63 @@ pub(crate) fn new(
             },
         )?;
 
+        // Check that the WPR2 region does not already exists - if it does, the GPU needs to be
+        // reset.
+        if with_bar!(bar, |b| regs::PfbPriMmuWpr2AddrHi::read(b).hi_val())? != 0 {
+            dev_err!(
+                pdev.as_ref(),
+                "WPR2 region already exists - GPU needs to be reset to proceed\n"
+            );
+            return Err(EBUSY);
+        }
+
+        // Reset falcon, load FWSEC-FRTS, and run it.
+        gsp_falcon.reset(&bar, &timer)?;
+        gsp_falcon.dma_load(&bar, &timer, &fwsec_frts)?;
+        let (mbox0, _) = gsp_falcon.boot(&bar, &timer, Some(0), None)?;
+        if mbox0 != 0 {
+            dev_err!(pdev.as_ref(), "FWSEC firmware returned error {}\n", mbox0);
+            return Err(EINVAL);
+        }
+
+        // SCRATCH_E contains FWSEC-FRTS' error code, if any.
+        let frts_status = with_bar!(bar, |b| regs::PbusSwScratche::read(b).frts_err_code())?;
+        if frts_status != 0 {
+            dev_err!(
+                pdev.as_ref(),
+                "FWSEC-FRTS returned with error code {:#x}",
+                frts_status
+            );
+            return Err(EINVAL);
+        }
+
+        // Check the WPR2 has been created as we requested.
+        let (wpr2_lo, wpr2_hi) = with_bar!(bar, |b| {
+            (
+                (regs::PfbPriMmuWpr2AddrLo::read(b).lo_val() as u64) << 12,
+                (regs::PfbPriMmuWpr2AddrHi::read(b).hi_val() as u64) << 12,
+            )
+        })?;
+        if wpr2_hi == 0 {
+            dev_err!(
+                pdev.as_ref(),
+                "WPR2 region not created after running FWSEC-FRTS\n"
+            );
+
+            return Err(ENOTTY);
+        } else if wpr2_lo != fb_layout.frts.start {
+            dev_err!(
+                pdev.as_ref(),
+                "WPR2 region created at unexpected address {:#x} ; expected {:#x}\n",
+                wpr2_lo,
+                fb_layout.frts.start,
+            );
+            return Err(EINVAL);
+        }
+
+        dev_info!(pdev.as_ref(), "WPR2: {:#x}-{:#x}\n", wpr2_lo, wpr2_hi);
+        dev_info!(pdev.as_ref(), "GPU instance built\n");
+
         Ok(pin_init!(Self {
             spec,
             bar,
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 3954542fdd77debd8f96d111ddd231d72dbf5b5a..eae5b7c13155d2da39f47661024ae52390e04366 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -18,6 +18,13 @@
     28:20   chipset => try_into Chipset, "chipset model"
 );
 
+/* PBUS */
+
+register!(PbusSwScratche@0x00001438;
+    15:0    sb_err_code => as u16;
+    31:16   frts_err_code => as u16;
+);
+
 /* PTIMER */
 
 register!(PtimerTime0@0x00009400;
@@ -44,6 +51,14 @@
     30:30   ecc_mode_enabled => as_bit bool;
 );
 
+register!(PfbPriMmuWpr2AddrLo@0x001fa824;
+    31:4    lo_val => as u32
+);
+
+register!(PfbPriMmuWpr2AddrHi@0x001fa828;
+    31:4    hi_val => as u32
+);
+
 /* GC6 */
 
 register!(Pgc6AonSecureScratchGroup05PrivLevelMask@0x00118128;
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index 534107b708cab0eb8d0accf7daa5718edf030358..74735c083d472ce955d6d3afaabd46a8d354c792 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -1,8 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
 
-// To be removed when all code is used.
-#![allow(dead_code)]
-
 //! VBIOS extraction and parsing.
 
 use crate::driver::Bar0;

-- 
2.49.0

