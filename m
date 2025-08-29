Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBE77B3B9D0
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 13:16:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0273810E202;
	Fri, 29 Aug 2025 11:16:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VEpWj/Q6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2058.outbound.protection.outlook.com [40.107.243.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7BE210E202;
 Fri, 29 Aug 2025 11:16:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pxKg89KThZyx1JcyjuwTDylvUuxqs+pNA19yU1KA1BJs5kQYX0xaAqu/lnEcpJZ+nbd5/9UDtkes10iCBhNEMNyV4bMdcKHkV7lrR9/nFjCc8OXY4c2jySf6m0zKVIRAfHyvUe8Ia3Kw+40dIVEgbxKtil5QbFmk9aSPdtSgPYvyyRBK7pZQs6vmYvu7j/lndkFBBB6qKG++VrB1OCv82YT5IaRyE82+5be0/fJXDfoq9EOAS7HILHX5l4V32Uzr7gnN5o1XHAMQ8hdYrVL6mYfc5Lzt2y2+fD8+2X7z/zSfrynArgW22KsmKI+0CJflFeAgOpJyVAPQC8TAsil5Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UR7z4cR0C13xpfpU6EjUnmgjRSsPADd+M43lHZUp9+Y=;
 b=xqEwTow+z9c0DLmqnQTUZQCENE+poEEestuwFs4wV6Ihalom7VzNat/aGpBoQRSNpAAa67PIGdmLijueBykM9oEUIJA/vfQDlboOeRea9E+idO+8KMsaZU2+NtdN8Q7yTFOCW7XWsUgcQHKM4XIT8magqThQRIpLDW7+zZVXrK9bD5vH36LvGsFeQte4Z8PEr9j8kiANwKS5s17fePmVj+DcBFdNMO1bmIW5YFdZHA2cnPWMgu6J5idK4psGwJgixFefSc6cJwg+L0quvkEhPD4XTU5JKdDnHT3dsUvSW/zyd4u2u7sV2kkAC1v9zJvG10CXWfjaAA899Ivj1OH9iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UR7z4cR0C13xpfpU6EjUnmgjRSsPADd+M43lHZUp9+Y=;
 b=VEpWj/Q6WZ7uaRq+/pZBgP3zaiOOri2OMxYd65vI0Zf7aZAPydHC5dTyRst5+a5vdEV12bpbVzrwOOflwdViHoeS2Wlgg6KZv5+ZQr57TyBESFwc3lBZsHVH9nHT9NaPOpnQpYNeyC8366ktlmNtm3Cz7eOzXLCEz4mlqOS8ZTc9iKBKE0BsJ1hrImcX9ru9L2TAHmntKzpaGPmyHsmS8Q4eUthjAs7lAw87fCtMygq35L2n6jEXLnQwo44qxMyvAHH65ddH5rPtLGSyOCwYzCmaL0shb2tljRCYJCyxYaUEw6mL+ctCrWvgGELLLFuQjQRZa39S97nmG0l+JqraPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV3PR12MB9331.namprd12.prod.outlook.com (2603:10b6:408:219::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Fri, 29 Aug
 2025 11:16:46 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9052.019; Fri, 29 Aug 2025
 11:16:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 29 Aug 2025 20:16:41 +0900
Message-Id: <DCEVAXNB3EL9.YFTIP5RQCTUW@nvidia.com>
Subject: Re: [PATCH v2 5/8] gpu: nova-core: firmware: process and prepare
 the GSP firmware
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
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
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250826-nova_firmware-v2-0-93566252fe3a@nvidia.com>
 <20250826-nova_firmware-v2-5-93566252fe3a@nvidia.com>
 <5338bd30-f3ed-42c7-af0e-77c3ef7d675d@kernel.org>
In-Reply-To: <5338bd30-f3ed-42c7-af0e-77c3ef7d675d@kernel.org>
X-ClientProxiedBy: TY4P286CA0047.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV3PR12MB9331:EE_
X-MS-Office365-Filtering-Correlation-Id: 0088583f-02cd-4303-1a10-08dde6ed8a26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?azg1YVR3dExXMHZnakcyWSt5amxKNWNoL0pqajlqYk52MHBHa2xJODhnNFpI?=
 =?utf-8?B?akpXeTBEOUpwaElFK1ZCdWNpUEhpMWdXQmNYcHptVWhNVm1rbi91TlBuQVZ6?=
 =?utf-8?B?bWxObCtIaHd0V0VxL0FlbHlVRTRRU0J5STZGMnRDWWh2TThxS0E0YnlLR1Ro?=
 =?utf-8?B?OVBlRFE1cFo0UEZwcWVQcWF2Z1RxZFlLT2Z1QXhscXJRZWZ2QS9kOXFlM2d0?=
 =?utf-8?B?S0pZRzRZUDA1K2hSa0dCMitlekpIenc2ZVl2QUdkYy81ODFUQysxVU9pSDha?=
 =?utf-8?B?dWhtYnBTbTJsMTNpTmtQUzRwcXExbTVpWHYwLzR2TldTdWRKUVphQktVc2F6?=
 =?utf-8?B?SkZqYi9vdXA4Y1lyRFdEQXNJQXNOZGNNeFQ2K3BHWlVZY05kbmQ2VS85NFRC?=
 =?utf-8?B?K1B0YUM2VnVsS3YyVTJHclk0R085a0xVa3krb1hKYU4yTFA4UTNadldLWW1t?=
 =?utf-8?B?aVIybjBVNlFnK0JVb2k2RUdCcE91bEU1WW5EZURpcTlCWEUzb0lvS3d1RUNY?=
 =?utf-8?B?aFFTS0I0L0lGd215YmZFcjRuMk5rdTAyU0k2anNjZHRIRnYvbm9mdmx1SXg5?=
 =?utf-8?B?aklNdzVWd0tJMnA4WGRSb3BSYmdoWWtzeUdpR3BzN2ZmRGlza1hlYW9nRkEy?=
 =?utf-8?B?WlhMdlpDbmxmLy8xcVd1TnNyeDBUUWdCdnJ5SmYvU2h3ejhYYklqN0hXbTBn?=
 =?utf-8?B?VENlWm5zeWdMY1h5QTdTMGMreDdIWFFERXVUL2t3UXdpZk1zdk5LODJpNFhN?=
 =?utf-8?B?QTJQOW5jZkZHRlUwSkpoZ3N4S21ZZXBCWGtyS0NoRk1ycmduaW90a04rNHpO?=
 =?utf-8?B?L1lGNjllazd1bU5KYndESWlOaCtGaGFqRDVBSnkwM1Qybk54M2g0citreEhr?=
 =?utf-8?B?OE1GYTdqWDNqMmMzWnZXVXJXYlFJSnMvTFNyR1l6bG1FWEx4NmxEQXpwc3dE?=
 =?utf-8?B?L2ZjTzFGUDVZdTVUeDQ2c29KbjR5S2xCcGVnSVpqWDdSQVVoVklsNjhFL1M0?=
 =?utf-8?B?RGxYNlBLcklCVnExelI5YUJRUXlQWkw0OTEwcjlCVGlxbFFWZ0VYU2htK1VZ?=
 =?utf-8?B?UEd3ZkU0N3lTbllOYjZTellBTCtRVjJCZlJXVTVUNXlyVXB6UEE5ejFvNkRO?=
 =?utf-8?B?RjZqOUhsOTVQOC93U3p5Zjlxem5sSWtiQUdTdGZBTDcwaUc1Nmh0YzMxUTVl?=
 =?utf-8?B?UzRUWFo5RkxKSVByUWh1Z0pKdm9QNldXWnFPazdzREpaaGtaRU1BaldSS2Iy?=
 =?utf-8?B?NUd1MVRjbzdhb1Y5Ykt0UkQ1S0tTaWlhL2t2Rm1Kb1hDVG1ab1RuOWRDRzB3?=
 =?utf-8?B?cFNYNFloTnM3MkFvcmVhQmQyM1FzOVpuL3F2b0hmSmh6Nk9UUHBNSllXT0Np?=
 =?utf-8?B?SGIyZEpRNkUrRlFQejlKSS83c2RncXJqdGRmZlN0eWRyS29XSlpCRnFoMS8x?=
 =?utf-8?B?ZDFqQzBqN1gwdU93WUI3ZEVpNjdGdGlGbGk3WlRKM2czRnlLN0k1YzNnMU9h?=
 =?utf-8?B?QkhBYWNSWldFN1huOTdFNG5ncWhzVm4yNzMwcUxKcmswQjNqajhka0lHc0t6?=
 =?utf-8?B?K3pYVXFZQTg5a0dXQVd6dVN5eFRnOHBneFpkMWFCRkxGanZKYmpHS2Z5S0xB?=
 =?utf-8?B?MnVucGxiRUx2R0ZPZzdnR09oMXJIalZra3lWbFpwQ1h4SmVtSDJUSE56dzRQ?=
 =?utf-8?B?Z1JYZnRYUitycnV6dCswekowclNXYWl0ZitYS2VDNDZzd3phaVAzanc5b1E3?=
 =?utf-8?B?QW9xUFlEVjUvaXorTFNubzU4Rjk1MGNva01FV1Y2bkVSTlRQM255cmVnWFpx?=
 =?utf-8?B?bWRHeUdOaU9VS25CcllCZ1RpeTlWdWdOaTc0UURBbStJNlI1Ym5NOGxPSFFk?=
 =?utf-8?B?azQ4eUFNSWJLSVlXdnVhMno5V25pdThCSXZpcVB4eEtqQmdjUkg2WFlCcTFt?=
 =?utf-8?Q?6RFg7A8IRGM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZHg3bmJENTlzdXNSTkI2aCt4ZGgxMDVwL1J2L3BEMTF1THRNMWVuak9mTDVq?=
 =?utf-8?B?TkY5UFhmcXJXQVI3MnlWc3EzSHZWbWdaenJ6UUI2TVp6UTd2MXNzclRpbGtj?=
 =?utf-8?B?bmc0dHB1ZVZyM2xSLzN4QUVrem9hUEpGdEp2eXBsNWlKWUtaNDJJWlB3QkxI?=
 =?utf-8?B?RXdpMytTUlVsMWEyL0tzVkxOZVNtOG0vbjU4ZnB3NDFHblg5VXlpcS9lRDFI?=
 =?utf-8?B?TGVHdStxb0RlYUJkbVA1eG1iYlZJcXh0cDZDd0Jiamhoc3FrSzZTcVREak5r?=
 =?utf-8?B?aEJxZlgwejNjbjdvUm82VVJoTjRyZ1p4d1dkOXozanhIUjkzdnhtL2Qrck1B?=
 =?utf-8?B?RDFDeVNYaXk3Ym1xRXJJRDdMdnBmbDVsK0thMXNBM1Zid1pHcktMVSs0YWFG?=
 =?utf-8?B?aDFHQ2VYYmRkY0hlMUQ4MzlRL21GUm5LdHpSZC9sOEpUQ3diQnpmRXU2cGNS?=
 =?utf-8?B?WUZlZ2VvZG5vdVlmTEdtcENIQ1VYSlFGSjJWS1FIazhDRDI5Z0lGSThnSGk4?=
 =?utf-8?B?blVzNm15LzBkNTVubUFjQWlvMDdYYU94bXU2SUNtZHdXOXl4YzY3VDZMWW5P?=
 =?utf-8?B?Tm0vdzg2dTdZRnhPaEwrNld0VzU4UHExcU5iL2t5YnhtZUx2R3ZnTGN2ODRT?=
 =?utf-8?B?VGxQcnZwSHFraVRnUWxPencxL29ja2FKYXdpVkpOQ05lMUMzTDNkM005N2Zj?=
 =?utf-8?B?UVRTbi9QVWZ5TkdmcDZjUTFMLyt0bWtIQ21IR2I3SFlkV3Y2MmU3WGk5NXov?=
 =?utf-8?B?SHhaMDIxNEJWTWczN0FIbHJlZFpTRTdtSkhNalo0SDRqMkxNMkVsZUNGakN6?=
 =?utf-8?B?SEZQZXgxR1p6SEZEemhsVWZrdjdacWFXQll1UHlJcGNpNGt3ZlZKUUlBQTdL?=
 =?utf-8?B?Ym5UMzB4Ti92OUYwSkVLWWVVK3E4N3dURFptQW1IUnVpaEVXN3NaUFBtNkVa?=
 =?utf-8?B?Y0Q5ZXZqOHViVE1DSEFHWk1XYnpZWmg0SVFVQzJMVU9PUC9FMTMvLzlHUXBT?=
 =?utf-8?B?VDdLbXZKWlBJMC9FM0lLZnZQQzBaV1B1bHFtZ0E3dHRNUjBDZXFMcEpLRjBY?=
 =?utf-8?B?ZFNObUZ5dmpleDF2aE9jOGlTVk9pS3puM1VBbHhYT0ExZndaU3JmNithYTRj?=
 =?utf-8?B?Z3R2cjF6UDJUekdCWFBCVUF4SFVaTU1rellpbGVUODlCMUZ6c2VWWFYySExs?=
 =?utf-8?B?V0VJZlRTMHo2RmFwNjI1VnJhYzdlZjdEbld5ZWUrQXByc2RhdisvOUNUekE4?=
 =?utf-8?B?ZkJsZXMrMHdzc0xkcGZVSkZ3SWsyRlMwUDZ0a3Q4MTQ5ZHJRWUdGemNNTWJV?=
 =?utf-8?B?NTNJRzRROEd4amdvUEhOWUM5SG1ra3RVVFBYVlczU3RjK09IWFM5MVlVQ25I?=
 =?utf-8?B?SThiVE41MHR3WTlkZmhGcXVxOG9EVEtDM2U5dGRUQloxcHRqRnpVK2hpWXpR?=
 =?utf-8?B?bnZRMlNFbDJZVk9IWm9zM3lMSHhJL2RlRCtmb1poNllGcUE3dmZraEQvZkFC?=
 =?utf-8?B?aTdicEl4R3dxSHNRbDhmUTJUaHZDQzBOTGpZdXhyNWdXbHZRdGcxNEFxZjNG?=
 =?utf-8?B?TmlZMklNTmZDSnVQanZmTWNQRnVyRTJ2WmZydFE4UVFKeXRMcTRKRk5peXRz?=
 =?utf-8?B?WElzUXdkRlB6OVNkWkd3TXhMTHJsR2NwaHJmQnoyK0QzbVdvaUR6QTgrb0Vm?=
 =?utf-8?B?aFBQY0RUSXJTamRSdk1XTDNTQkt6ODBDditCZlFuZlk2N1pYcTRrSUMwcE83?=
 =?utf-8?B?TTYxa1lJMmZIQzNWd01sQzJBekRqR1RCQjlhbEJiblZ0K3VxMGZFcXdubmFZ?=
 =?utf-8?B?cEkwSHBqSEtCVFpoTnMyZHJoK1NQcXdkMnp5NW9paHlrN3dHcDYrSytVblRK?=
 =?utf-8?B?dm9FbG5LbDVZdkxpanlqcTdwdHMwT25ZditYV1hLcTJyNUZvcmRLZVYvMDdj?=
 =?utf-8?B?ai9IaHZFT1I0K2tSRmF2ZUtxUG8wUnZoK1RGdit6bU40NlM1bmxkSWNZWUhX?=
 =?utf-8?B?VVE3N0N1SUlUL09peEE5R1VYMGg5U0txM2ZGb2Uyd0V4eVpJMUEzdENFQ0xo?=
 =?utf-8?B?cm82QTlPOGtnZWUyMW9Ec2JTOHQwTzBQNW5MbnlRSm5DK2IzdDhPOUVqVTFO?=
 =?utf-8?B?bWc1VnRRMVp5bzZDaEMyR291U09rUmVBNEZONjJEWDhXQm5RNEJaSnVGODNy?=
 =?utf-8?Q?2Ahk02sBmxXJzbVqS7B6MnC4Rc+41e47sVkBUdX2P6kW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0088583f-02cd-4303-1a10-08dde6ed8a26
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 11:16:45.7791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cqUIbxYbpq7s9sbiHc/QKW+x5wh8pwwgfkdXb9FBhePsNBMNxQvKTAcBjLDMnb2kjgccqQ8zig2jQKLk4akrcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9331
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

On Thu Aug 28, 2025 at 8:27 PM JST, Danilo Krummrich wrote:
> On 8/26/25 6:07 AM, Alexandre Courbot wrote:
>>   /// Structure encapsulating the firmware blobs required for the GPU to=
 operate.
>>   #[expect(dead_code)]
>>   pub(crate) struct Firmware {
>> @@ -36,7 +123,10 @@ pub(crate) struct Firmware {
>>       booter_unloader: BooterFirmware,
>>       /// GSP bootloader, verifies the GSP firmware before loading and r=
unning it.
>>       gsp_bootloader: RiscvFirmware,
>> -    gsp: firmware::Firmware,
>> +    /// GSP firmware.
>> +    gsp: Pin<KBox<GspFirmware>>,
>
> Is there a reason why we don't just propagate it through struct Gpu, whic=
h uses=20
> pin-init already?
>
> You can make Firmware pin_data too and then everything is within the sing=
le=20
> allocation of struct Gpu.

I tried doing that at first, and hit the problem that the `impl PinInit`
returned by `GspFirmware::new` borrows a reference to the GSP firmware
binary loaded by `Firmware::new` - when `Firmware::new` returns, the
firmware gets freed, and the borrow checker complains.

We could move the GSP firmware loading code into the `pin_init!` of
`Firmware::new`, but now we hit another problem: in `Gpu::new` the
following code is executed:

    FbLayout::new(chipset, bar, &fw.gsp_bootloader, &fw.gsp)?

which requires the `Firmware` instance, which doesn't exist yet as the
`Gpu` object isn't initialized until the end of the method.

So we could move `FbLayout`, and everything else created by `Gpu::new`
to become members of the `Gpu` instance. It does make sense actually:
this `new` method is doing a lot of stuff, such as running FRTS, and
with Alistair's series it even runs Booter, the sequencer and so on.
Maybe we should move all firmware execution to a separate method that is
called by `probe` after the `Gpu` is constructed, as right now the `Gpu`
constructor looks like it does a bit more than it should.

... but even when doing that, `Firmware::new` and `FbLayout::new` still
require a reference to the `Bar`, and... you get the idea. :)

So I don't think the current design allows us to do that easily or at
all, and even if it does, it will be at a significant cost in code
clarity. There is also the fact that I am considering making the
firmware member of `Gpu` a trait object: the boot sequence is so
different between pre and post-Hopper that I don't think it makes sense
to share the same `Firmware` structure between the two. I would rather
see `Firmware` as an opaque trait object, which provides high-level
methods such as "start GSP" behind which the specifics of each GPU
family are hidden. If we go with this design, `Firmware` will become a
trait object and so cannot be pinned into `Gpu`.

This doesn't change my observation that `Gpu::new` should not IMHO do
steps like booting the GSP - it should just acquire the resources it
needs, return the pinned GPU object, and then `probe` can continue the
boot sequence. Having the GPU object pinned and constructed early
simplifies things quite a bit as the more we progress with boot, the
harder it becomes to construct everything in place (and the `PinInit`
closure also becomes more and more complex).

I'm still laying down the general design, but I'm pretty convinced that
having `Firmware` as a trait object is the right way to abstract the
differences between GPU families.
