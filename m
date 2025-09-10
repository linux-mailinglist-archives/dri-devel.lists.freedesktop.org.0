Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74333B51BD2
	for <lists+dri-devel@lfdr.de>; Wed, 10 Sep 2025 17:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F5BF10E94D;
	Wed, 10 Sep 2025 15:36:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="lK6diZpp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2089.outbound.protection.outlook.com [40.107.237.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C34A10E94D;
 Wed, 10 Sep 2025 15:36:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nWJQacv6BLzeCtp2RP9NENk6cP7WOdj+uwW37zaWUKc9/QIZ+3zt1Jy05okGEdWXHdL+rq/u2IHpt+mr/GQmefHoSfCHcLG5r6MOPNx2iWkgwkM1dFh6wSyKCLQor4AWU3nkQoQMFWKez8w5Ow8ifZTgs+FiRcHo3EBFy/2GImPLUoTtjn5NxTsvX9PjPb+oyeqc4xeWPwzKpkdJfL9NRQz54rZdhh/yZGneG4QXssBKEGrmz7F6jc6sgsmaSK2kk2z2XaSoEPDkayZuApQ/1jdy/j+O7Bh66Hl2bRdqn6LBIlVr8jCJ7xgxUmvOdUmR1gq1vTRCIsEziNkcvrEY7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZkGr6Zz8sbdA63GxfBUDvwy3dolF+Dz++/3GJqR1/s=;
 b=ZYP0OeR6M/yTZTj/Y8TcD9mGuEPab7R3nhysKjjGj9q2zi9XAhKroZj1wAmEjfEI1gcj3jqUVDvPpMXqy6NKsGfWlYCv1nONpT+idOri/NhA8x3J765osNcnPVooutU6XwOQQwJfNajVxqKdFSGNI/Nk/ousv95A/YFNhovR1P7mUjwSpESe8mB1RMSZbsNebQKHZ+A2Y5AK2CD1phfJZxpEN2mQqpbYq8VswwR0KhBkvjn65iARrUk7h1aw5VcQ/I4KdWy80WCuIBQe4wODqIP4TDY5xM1mAjYB1zxZhcKnVzZdPZsd6KOvcoUHHH3F5rb2klLHCmWTbLm8YE4Afw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZkGr6Zz8sbdA63GxfBUDvwy3dolF+Dz++/3GJqR1/s=;
 b=lK6diZppqOPNDcOs5YfMqhrcZUbYZThlpv4dd5a+Q8ShXM2jTFc0Nurr6A8oLLRfQI5EkrYqDevByJ20kHVWrgf2fwvRPmbz/cbNQ3sEZigmWy5Bv4kzzwoFwd5Neszctumkbxzth8tPR6ue9pd7AvNhw2xSSSEw6VaOIv/xSZs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by MN2PR12MB4304.namprd12.prod.outlook.com (2603:10b6:208:1d0::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Wed, 10 Sep
 2025 15:36:34 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%7]) with mapi id 15.20.9094.021; Wed, 10 Sep 2025
 15:36:34 +0000
Message-ID: <4fb75026-5af0-4fbb-9caf-039674543278@amd.com>
Date: Wed, 10 Sep 2025 10:36:29 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 11/12] PM: Use hibernate flows for system power off
To: Bjorn Helgaas <helgaas@kernel.org>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 "James E . J . Bottomley" <James.Bottomley@hansenpartnership.com>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 "open list:HIBERNATION (aka Software Suspend, aka swsusp)"
 <linux-pm@vger.kernel.org>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 "open list:PCI SUBSYSTEM" <linux-pci@vger.kernel.org>,
 "open list:SCSI SUBSYSTEM" <linux-scsi@vger.kernel.org>,
 "open list:USB SUBSYSTEM" <linux-usb@vger.kernel.org>,
 "open list:TRACING" <linux-trace-kernel@vger.kernel.org>,
 AceLan Kao <acelan.kao@canonical.com>, Kai-Heng Feng <kaihengf@nvidia.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 =?UTF-8?Q?Merthan_Karaka=C5=9F?= <m3rthn.k@gmail.com>,
 Eric Naim <dnaim@cachyos.org>, "Guilherme G . Piccoli"
 <gpiccoli@igalia.com>, Denis Benato <benato.denis96@gmail.com>
References: <20250910151836.GA1536103@bhelgaas>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250910151836.GA1536103@bhelgaas>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DM6PR11CA0021.namprd11.prod.outlook.com
 (2603:10b6:5:190::34) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|MN2PR12MB4304:EE_
X-MS-Office365-Filtering-Correlation-Id: 1657040a-be39-4544-2bcd-08ddf07fd258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|13003099007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?N2JzR1M4VnJMQXpoVC9lZDlvRTlYd2gza1k5QWN4SUhEZ2FEOFBROWRGU3Uw?=
 =?utf-8?B?TWVDd1dRSzVkMHA1S0ZwazlhZ1F4UExhaFozczZRcFBPbzVWaUZHdVpaUjB4?=
 =?utf-8?B?WHowZ0ZkTEhPdXlHWXZKTlJlSWVnaHFVZ2Q5OENmYlJ0OUZ3eS96dWk0dklQ?=
 =?utf-8?B?OHBidFcrV1RHTENtUkMrazhRM09hNkZVa2NUVTl2b1ZMVC9xYVlKTm9yd3BE?=
 =?utf-8?B?NVhabGsrcnlQVlpCS01TS3llWjBWOEJPbDJrcWQybnIyL1RKb0d4Y2NKZFhs?=
 =?utf-8?B?eklxWUFxMGxHNDh5a005MW16MmN5V2RjZkdwWW9PZXBiZFRSZE9Kb2M4Q0RP?=
 =?utf-8?B?MjZoWVVuWEtyQjV5UTY3UU5VMGJWR3d4cDEvNUZRTW5OMDFGMU15blJVUEtz?=
 =?utf-8?B?ZFBrdkNuRDYyak56TjlRcDRaVm94M0NoYTE0YmYxK2dFb2lGZXpxV1BieXVv?=
 =?utf-8?B?THNpMjNXR2IzS0gyZ0Y2VCtGNmFHTys3L25Qa3h3cUV3TEorRGN6Tit6alFa?=
 =?utf-8?B?ZnVVQm1mS2N0V2ZCMUlzaXkzWWRhd2o4TDNnMXJ6RmFRVUp1V0I5TkV2U1dH?=
 =?utf-8?B?VkdtcVdaMU43bVZoV1BFbSs2VjBGNU1MYnZrMDFBSXJDemlwdkV2Tk9UY0RP?=
 =?utf-8?B?dGFXb1NjSVU1K1dOaXh2aEpkYUpTNmdlTHd2WFNrSG54c2R3TFZaZEhvOC94?=
 =?utf-8?B?ZkVwM3dhK01kTGcrMkRGNmF5WEFNVTZPSGZFenVMNFBZVFhCQXYzeTZ2RUF2?=
 =?utf-8?B?ajFIQ3lOMkgrTDV2bGE2SFpocCtJdlBoOU5RTS8rR0pGTFVHNVN0bTdkQ2U0?=
 =?utf-8?B?RnhzcFIvbGE4L2k1NWliLzc3aENkTittRTBXbGJwZTlaYUdwSDAzMWRVcFVh?=
 =?utf-8?B?U3oxOTlmNE5leDlOYjRCejE0VHhEWDVlMTJkT1NMV1IrVGk2ZHVzYUh4Q0s5?=
 =?utf-8?B?K0F1ZStnTWxUUTlITHJkZUZKRjVwQldNUEFRdlYrSTRqWE1PdjY0cEJ0TXgy?=
 =?utf-8?B?NDJFcVVERjR3OEJLdnZ5RGoxdUpPVG5QVWJkVk9uYTYrWEtDNFFwQ1JJWjdr?=
 =?utf-8?B?bFRlZjM3T1hOYk8xd1NFWlM0eWdSb0tSS1NHQzY1SDl0alVURldCTHpiN3dv?=
 =?utf-8?B?b1pobWoxcVBrL0VpY2lYUmdDaGJTNnhRcjNia05NblZtV0JkbERJWFhxSER4?=
 =?utf-8?B?WHlNSHhYRzNpS25TbTZlMnpaSk9EZmM2dEdKVDZiMENmSVlodzgxUUEvclNP?=
 =?utf-8?B?Szljb3lOSzdkMTNvb0JPVytYZXoyRlFxc0plSkdHbzdRd3BZWHVKc1dpZTlN?=
 =?utf-8?B?N2oxZHB4MVk1RjNmb3lwZFBtRzNRcGRTaDBnZ2hRYVdEZmRVUWNRaDZXTlo5?=
 =?utf-8?B?ZnBpcmYxaTc2NEYxMkswOTRQV0Y4dWNsVlpEeUdLb0hJMXFZUFN0TGhXSFBL?=
 =?utf-8?B?YlhnV253dW1sOC81Y1NFcko2TUNqNVZEd3E3ZmVGOXlBWFF5Z3RzZ3p2Z1pO?=
 =?utf-8?B?Z3VrL2ZPUVJHTGc3ZWpUbkNEMjcySVpnWC9GcUpWSFR0Nlk0dXFXRlFxY2cx?=
 =?utf-8?B?NFg1UkhKaVd1czVZSGxHUkZ4T2g5WGFyOC9uYitIUldmNU8wVVRYeFAxZEhi?=
 =?utf-8?B?YkxzVGJZelZDcVMvNHIwOHEycGhFMHpoOEZWTlJ4cUVpbEZUc0lVY0R5c1Z5?=
 =?utf-8?B?bmpSNS82QVZDV2tLbXB1dDFMNDAyNHVaeGNWTjFCWTdYNXBmczJoSmVxeUJ3?=
 =?utf-8?B?Ym5mSjJ4am5BaWE2K3gxYUlxZ3NtMXVPRGtCdzhEUG9zNGtPODlsQVBVQkV2?=
 =?utf-8?B?eG1Pd25nYmc3ZnE5U0p2NnNtRTBBbTNaa1VaZFpPQ3d6bDJIRFBGczBieHdI?=
 =?utf-8?Q?jQ7Ec6H/ACr19?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(13003099007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZjExK2tHUXFkNjJON1JtMkUyV0tQNmcvN3pHNFdYZU5WMHQ2TXRxZzhhaEI5?=
 =?utf-8?B?NTdqYXAzV25NZXR2NHB2N2t2enBhdzg4ZDkwb1l2SmF0VlgvNWpORm1sdkxu?=
 =?utf-8?B?Nng3dGI4RzBoZnFYSXlDankwWGs2WVB0MjIvUzY4VWhaRENXVElzdjExbzJD?=
 =?utf-8?B?Y0RCREdIdTNZbjI3ZjQrcWIxckZOb1RZb1dmdFVyQkIzd2xXc0pDcDdCMWdp?=
 =?utf-8?B?Ui9aVmEvM1hCV0Rkb0FGZStDb0FoRlo3amN0WjhwTzhxeGx2eWNnaUhxMW9I?=
 =?utf-8?B?WUxHSVBCQ3FPb0ZZZjhncyt4M0NFYVMyNkt5T09zTEZORlBScTFlUmtYbEVw?=
 =?utf-8?B?L1oyK2NBMSt5OFhRaVowZHZqRVpLNUdOOXpLVDk2SHFMeENhdzdCaTcrUUVV?=
 =?utf-8?B?MkJqdHNYMGhPV0dHalVkVGJQZ3phMGdGdUdEeENXMCt5emNwanQrTlVMcjJP?=
 =?utf-8?B?eVJvSWN6b3JGbWw2MVNtUzF3QXlQV29HLzd6L29wLy8zZHZEV2c3RFhuQ3NV?=
 =?utf-8?B?RXV2NW40aXhKZDRMSEwvWHN3NVNYNElsRGxiSEdCNDFnUEhyWHlXSHRjTUJ3?=
 =?utf-8?B?R2I2RlBBUFhkR0Z1T2VaalZPbnE3MlV3STQyQzg1RnJ5ajRlV2ZiQmNWYVla?=
 =?utf-8?B?SDJTcm1lYkt6WEJ0emlvMUNldEErR2JIMURISU96M3BKd3FLZXJ6SDlwc1Fu?=
 =?utf-8?B?ak1LZFI4bFluNzgwVE9lejZwZHU5SHpFQklVZlVBYnE3UWZ1UWZ5bXBqQ1VJ?=
 =?utf-8?B?ZEpuenp2NFg0NVk1TlFldUVETlJTazRVUEhzbVZ1SlR3Tnk2SlRwL2JYN3cv?=
 =?utf-8?B?VTYvUkM1dG9hMjBIMGhPRzhjaC9hZUQxQW5XZzNBQ1B5WG9OUzlvaGo0OTRO?=
 =?utf-8?B?Smd3N3FpWDdVR3Zia2dGS2llN0QxMWJaMDdxSkNYaTZxbC9zZFJhLzQ1ZkVW?=
 =?utf-8?B?YXBTYUV2QldWd0dXcWpKMmNmd1FwVSttTUVBUG0vdFlnWmRTN3ZmdmVvYk96?=
 =?utf-8?B?M3d3RkVHcE1tZmY0dnlTc3ludkUrbWR3QTM0ZFkrWSttLzdsUkkyRFUwYitH?=
 =?utf-8?B?T1BNei9WYWJLRTB5dFNxMCtjbW9VRmdjYlFQVnVwdlgrUTRUNWxIYmNpb0lD?=
 =?utf-8?B?c2pNUkhCUXlvSXIxS2JSSVZpYTFiTjBCUkxtSDBtZXB0QXFtRXQ1cEdYREZE?=
 =?utf-8?B?MDUvbTNPQlFqMVB5WHJ6czJIT1diSVlVWE9NK2d6RWdteVUrYlRuTFVjakhz?=
 =?utf-8?B?V01vdFJjSGdzb3RoTUt0MG1IVExINVZBaVlWV0lpc2VyZWV4TnpvbW4zYkFj?=
 =?utf-8?B?b3V6cWZlWC9YNVhjRzF3MGdZQWFhZVYxOVo2dkxTNjRzd3RJODZTZ3hYdDE2?=
 =?utf-8?B?MjVqSXR5ZUdPUEhSaXpEZzhWZmNHNXhrY2JkU2JYNmFjNVJ2OFF3Q2VEN2Iv?=
 =?utf-8?B?Q3BMWTA0NVdoUTRKUWVwemg3T1pNZnVLbXVEanM0aW9maG1VT3I4THVaVTUw?=
 =?utf-8?B?YS9ud01GVlZGRG1tUkh5VjdLT1lWdmhCbldPa0t3NFA1Zm1yVkNhQTdDZ2dZ?=
 =?utf-8?B?RjdVTExFaGxwY3pxQzZja1BnVGcwN2F2VW5PWmlpa0hYMThyanZNY1NCeVhY?=
 =?utf-8?B?eTVmM2hOOXY0RW8rQnozRnhZQ3dZTE9nZmg4RTVQcTZKamhMN1pESXFCUFZu?=
 =?utf-8?B?WFVxRTZJaWx2YU9aVlZUT0k2bEVXVUVkYmZJYXFoc1BYZElYeFdxVDljbi9B?=
 =?utf-8?B?OStMZWY1bU15WU9MdVhRMjNVbUFQZGZ4YXlvUlJCNlpkQWVhYmszNnlSbjFv?=
 =?utf-8?B?QkhnZ0JJam9sL3JqTXkvRTFRZllXcUJ2cVdncmpkSUlrOUtGMXBqSXhoQmxW?=
 =?utf-8?B?eE5UNW9INzRsY1RRRkhVSk83WWJQZDJ4aEJhek5TMGoyUDNhbWJiZG81U2oy?=
 =?utf-8?B?Zkh0NXptR1MyWnA4WitKS2JDVzcxWVFWTlBFck9FYjVTcndNVkR1aytDdjA1?=
 =?utf-8?B?b0ZpRkVGcWxXclQwWENLdDFNeEpHUnhYVmhsRVZaRzd4M3JQVFFCTS9JL3VJ?=
 =?utf-8?B?VFhTcDE1b0RyczQ3V2NNbXM5NHo5Q0svRW05Q3hQMzRibmNPWDBsSFpmbUln?=
 =?utf-8?Q?dBJN99Qh1uwfO1l7V5X03t5Dr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1657040a-be39-4544-2bcd-08ddf07fd258
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 15:36:34.2649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /tNAF8eB8DtxB/snnIZZe9vCR03VNogdnOL9/LVl4kpv9DZmde+kO5wvY2BVmMVP1ROqP6G8N7bqtekC8P8LzA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4304
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

On 9/10/25 10:18 AM, Bjorn Helgaas wrote:
> On Tue, Sep 09, 2025 at 02:16:18PM -0500, Mario Limonciello (AMD) wrote:
>> When the system is powered off the kernel will call device_shutdown()
>> which will issue callbacks into PCI core to wake up a device and call
>> it's shutdown() callback.  This will leave devices in ACPI D0 which can
>> cause some devices to misbehave with spurious wakeups and also leave some
>> devices on which will consume power needlessly.
> 
> The connection between this change and spurious wakeups seems pretty
> tenuous.  If we don't want wakeups, powering off the device seems like
> a sledgehammer approach.

It seems I'm confusing the issue the intent of the series by mentioning 
wakeups here.  The reason that they were mentioned is my series and Kai 
Heng's series merged and they fixed his issue too which AER caused a 
spurious wakeup [1].

My main focus for the series is power consumption.

Link: 
https://lore.kernel.org/linux-pci/20250506041934.1409302-1-superm1@kernel.org/ 
[1]

> 
> s/it's/its/

👍

> 
>> The issue won't happen if the device is in D3 before system shutdown, so
>> putting device to low power state before shutdown solves the issue.
>>
>> ACPI Spec 6.5, "7.4.2.5 System \_S4 State" says "Devices states are
>> compatible with the current Power Resource states. In other words, all
>> devices are in the D3 state when the system state is S4."
> 
> Re patch 05/12, also interesting that this section mentions "devices
> that are enabled to wake the system and that can do so from their
> device state in S4 can initiate a hardware event that transitions the
> system state to S0."
> 
> So it looks like wakeup from S4 should work in at least some cases.

Yes; Wake-ups do work from S4.

> 
>> The following "7.4.2.6 System \_S5 State (Soft Off)" states "The S5
>> state is similar to the S4 state except that OSPM does not save any
>> context." so it's safe to assume devices should be at D3 for S5.
>>
>> To accomplish this, use the PMSG_POWEROFF event to call all the device
>> hibernate callbacks when the kernel is compiled with hibernate support.
>> If compiled without hibernate support or hibernate fails fall back into
>> the previous shutdown flow.
>>
>> Cc: AceLan Kao <acelan.kao@canonical.com>
>> Cc: Kai-Heng Feng <kaihengf@nvidia.com>
>> Cc: Mark Pearson <mpearson-lenovo@squebb.ca>
>> Cc: Merthan Karakaş <m3rthn.k@gmail.com>
>> Tested-by: Eric Naim <dnaim@cachyos.org>
>> Tested-by: Denis Benato <benato.denis96@gmail.com>
>> Link: https://lore.kernel.org/linux-pci/20231213182656.6165-1-mario.limonciello@amd.com/
>> Link: https://lore.kernel.org/linux-pci/20250506041934.1409302-1-superm1@kernel.org/
>> Signed-off-by: Mario Limonciello (AMD) <superm1@kernel.org>
>> ---
>> v5:
>>   * split to multiple commits, re-order
>> v4:
>>   * https://lore.kernel.org/linux-pci/20250616175019.3471583-1-superm1@kernel.org/
>> v3:
>>   * Add new PMSG_POWEROFF and PM_EVENT_POWEROFF which alias to poweroff
>>     callbacks
>>   * Don't try to cleanup on dpm_suspend_start() or dpm_suspend_end() failures
>>     Jump right into normal shutdown flow instead.
>>   * https://lore.kernel.org/linux-pm/20250609024619.407257-1-superm1@kernel.org/T/#me6db0fb946e3d604a8f3d455128844ed802c82bb
>> ---
>>   kernel/reboot.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/kernel/reboot.c b/kernel/reboot.c
>> index ec087827c85cd..c8835f8e5f271 100644
>> --- a/kernel/reboot.c
>> +++ b/kernel/reboot.c
>> @@ -13,6 +13,7 @@
>>   #include <linux/kexec.h>
>>   #include <linux/kmod.h>
>>   #include <linux/kmsg_dump.h>
>> +#include <linux/pm.h>
>>   #include <linux/reboot.h>
>>   #include <linux/suspend.h>
>>   #include <linux/syscalls.h>
>> @@ -305,6 +306,11 @@ static void kernel_shutdown_prepare(enum system_states state)
>>   		(state == SYSTEM_HALT) ? SYS_HALT : SYS_POWER_OFF, NULL);
>>   	system_state = state;
>>   	usermodehelper_disable();
>> +#ifdef CONFIG_HIBERNATE_CALLBACKS
>> +	if (!dpm_suspend_start(PMSG_POWEROFF) && !dpm_suspend_end(PMSG_POWEROFF))
>> +		return;
>> +	pr_emerg("Failed to power off devices, using shutdown instead.\n");
>> +#endif
>>   	device_shutdown();
>>   }
>>   /**
>> -- 
>> 2.43.0
>>

