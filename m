Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FF38B36D2
	for <lists+dri-devel@lfdr.de>; Fri, 26 Apr 2024 14:01:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 804F310FAA7;
	Fri, 26 Apr 2024 12:00:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="B78Rt19V";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2080.outbound.protection.outlook.com [40.107.244.80])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C021122F2;
 Fri, 26 Apr 2024 12:00:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZHAGJcAF/3eVPae6/W7cieTnYDsCNTRfh3PCllwTfyQ5VPTrYVeqebiv6zoF+vVOyk5aX6luk5cc6u8ShUsm10FafcRtT9cXeOk3L2hPEOhsWm27pz4zWU1X6KdrdEJEiioHczLEZ8D886e6PQXHIWn1Z+khDlv3pP8pdhcwvTzKMR0s8OTWuNSfQ/EB6PoC9TKxBAICvcF5mH5Ru2tQU/UA82FMdfgkny+JofNCI1kXD8tBqgBMCrNtJK9cDevGu99Zv8GAKUc7MB6LzdLoHdwUGLPEAwBlf49iD+J7cKAxN5GF3iaSrDzjlbb5BIMb3Quz5Demf6IJKVYCmKk4yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dPBtbTSmHVmoUFYJ0pHOAxFpq+YAT9Rwmswo8zDQDk4=;
 b=BO78ayhyhifUuR8phsH+axnd4ftl1Iy0gg4KjiQl6DG6CAmBfZWKwbWqaqlMG3DF1YNJElrAcca9xFjwGP2nfRG+BLSWYVNRWhwJYEADfc9OCLZnfA5Tt2Ppqbh1QOOtwBgQZg3A4ggMbjqS8WoWJoy8cL67J6KlVRhE5oNKltXZlzQ4YUZsR7L0i8b4WtD4RSGJGgVlSO2ejOzzULQfts5QIjeSVwh4YK9GTxgw2dXVlQ0iugQoD5hxOO1fDt1EBWgxkMvng1puDjObidUBSMcoD4SqYSyeDLThfSsxr3TsV/anQ3WpcJlr/1IUFJlLz8GtJAtkwOKGoDWRd9Di6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dPBtbTSmHVmoUFYJ0pHOAxFpq+YAT9Rwmswo8zDQDk4=;
 b=B78Rt19Ve9J9/G9TOo5+tNfLEkFjfSqGLZzErsDYXkSGouIXnE+dfKz/timEh8rOtjnF6+bACbisi6Bj8URbNNWq70ycIBu7zmeS62ogmwIX3cfG2eAlcGvJKu0RwzE7tYWGeBGMZ8cqjEkAwXobJz0aVEtKwQzBdXWlu8ZbHDQGM+HgOW7mKjn+DnG4VIQvkL3DbRtfBpWrWT03xlOghd05lTrXBYncAl3p1CNM5uaDjOnNi0h4PqY/HIZif3+q7I3Vj38DLmk3SQvQLXEmmzWE4JnMNdRdnCJ7wd/s46NtGyB+vrIAtdSTQStoNe4/FgrhvJrVRpFkKWwaZ2XZBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3849.namprd12.prod.outlook.com (2603:10b6:5:1c7::26)
 by PH8PR12MB8429.namprd12.prod.outlook.com (2603:10b6:510:258::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.43; Fri, 26 Apr
 2024 12:00:50 +0000
Received: from DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e]) by DM6PR12MB3849.namprd12.prod.outlook.com
 ([fe80::c296:774b:a5fc:965e%3]) with mapi id 15.20.7519.021; Fri, 26 Apr 2024
 12:00:48 +0000
Date: Fri, 26 Apr 2024 09:00:47 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: "Zeng, Oak" <oak.zeng@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Brost, Matthew" <matthew.brost@intel.com>,
 "Welty, Brian" <brian.welty@intel.com>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "Bommu, Krishnaiah" <krishnaiah.bommu@intel.com>,
 "Vishwanathapura, Niranjana" <niranjana.vishwanathapura@intel.com>,
 Leon Romanovsky <leon@kernel.org>
Subject: Re: [PATCH 06/23] drm/xe/svm: Introduce a helper to build sg table
 from hmm range
Message-ID: <20240426120047.GX941030@nvidia.com>
References: <20240405123725.GD5383@nvidia.com>
 <SA1PR11MB699170C0F6FFFA231985718092032@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240405180212.GG5383@nvidia.com>
 <SA1PR11MB6991A4BD0EDDDF051A9A2C5C92072@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240409172418.GA5383@nvidia.com>
 <SA1PR11MB6991EDB4351D99B4E76EBC2992112@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240424134840.GJ941030@nvidia.com>
 <SA1PR11MB699102978E72F21E6C803D6392102@SA1PR11MB6991.namprd11.prod.outlook.com>
 <20240425010520.GW941030@nvidia.com>
 <65cb3984309d377d6e7d57cb6567473c8a83ed78.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <65cb3984309d377d6e7d57cb6567473c8a83ed78.camel@linux.intel.com>
X-ClientProxiedBy: MN2PR15CA0035.namprd15.prod.outlook.com
 (2603:10b6:208:1b4::48) To DM6PR12MB3849.namprd12.prod.outlook.com
 (2603:10b6:5:1c7::26)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3849:EE_|PH8PR12MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: 8bcfcd81-2d38-4162-7150-08dc65e88310
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dktEemlPQ1BTOGVpZ3FkSnFQZzkySlY2VlUrV2hpQjBreFhmbGdrQ3dFS3dr?=
 =?utf-8?B?bTlZTkpFSGdNTTBEMjRteWZMQU1pWm8xdkx1cWpJeFVPMEJWK1gvbmZTNktj?=
 =?utf-8?B?c3ovQWIzRURUZzV2NjhwU2lvdHErZWNmbVc5RE5IZHNYdTlZQXpzZTFzaHpl?=
 =?utf-8?B?SnYrWnVXVmF4N0swVno0T1ZCVVZOaHYyOW14cG1saU5Nd0wwM2FkRk9JNU9a?=
 =?utf-8?B?cWdEYm1JL2NNeEoya3ZqRjVmUFlET1d0dG5aRVp2aG1BUU43SmF4eDlFRGEr?=
 =?utf-8?B?TzZLdDRDeTRIYUVVTVkvNFZNd1oyeHpRZmI2VXdIZU5MYkJGSWg2NHpleVpY?=
 =?utf-8?B?MnpIS3Z6Skp0MlUyWG55NWhTa1FmUlg5OUJueEJaREhycld1QXduUHY5YTVo?=
 =?utf-8?B?ays1S0tRTkV4QW1EYnlmb0YrTDdjaUlTdGZ1UVJvT240V2doZnhoKzU2cXk0?=
 =?utf-8?B?ZG9qTmtESEgvR1JsaE0reWMyNVk0RC93VUNMNTI0Z09VTmJoZk9uWDN0dmd0?=
 =?utf-8?B?ckNIV1NIY0h3NnpKQ3BzUmRPb1BySUc5U0RVUlpxMlkyeTdoWUtTRFBWVnFz?=
 =?utf-8?B?blpENDU0M3BHcXNodU5QWUptdlZIY0lUZXBzWjVMaVFsQ3pmVnJXdHlvSVJk?=
 =?utf-8?B?a2JtMEhJNkJmYUpDSCtrdFNFSDFzcmRtLzVPOXo1TUd6TEs3Y1BEdEhYdFZG?=
 =?utf-8?B?VFpmY2VuWWZRTTBTNkJuY0NBenc1cElhM2xIY0xpQlhDbVhQd3IwMXlNbmF6?=
 =?utf-8?B?QStISVFTR2hVbTlKMHpnT2dEVi9SajlGNnlYbmxmTkRtM2IrUHkyMWFzbDNS?=
 =?utf-8?B?MlFla0NySURGWitIZ2NRS1AzVXdOd3lnOTZMTDl5ekdUb0QrbVFuYXNDY01z?=
 =?utf-8?B?dlVyR29uQmlqQzM2ZEc0QVhwbUQ1eEZINFg3TEtZdmhxQ09QMnp6V3IyRzBl?=
 =?utf-8?B?UmFLVmR2MnFqUEJFcVMwK2FyT3h0SVdERTAvVWlQNjNqdHJ0Q0xWajNaV20w?=
 =?utf-8?B?L3BXZlYwcTk3M3pxV3BnWGcwQ0pFUFBhTVFMcW0wTmNESHUwemVUQlQyZW9x?=
 =?utf-8?B?MmluWlNseU41eHJ6dy94NzVUSVZQUnc2ZXRNcnQwK2greVkyU0VWUVV1cjlk?=
 =?utf-8?B?YU1WNC92R0Z2Tzk5Q09BVzNvbjNyMzVOSS8xeElOS0R6dHdVSk5RMjNtQ0lq?=
 =?utf-8?B?SHdQS1h1aVVLUWovRmR3REcvb3JVUzJhbmdPOHZEbThjakxOOEtHVGFiZHNB?=
 =?utf-8?B?QjNZYjZNQlhXaUN5TGM3T2RzQWFXY1BKZ3hEN0o5aG5rK0VXdG5FdkhvT1hB?=
 =?utf-8?B?YVJZc0psM2NpMm5rd3UxVUNkU2RUSzlTNVZaMk1aSkx0TllLeVlxb3Zsc0Vx?=
 =?utf-8?B?RGRhK0t0aW45RGFId3VYTWExV3VOaUYvbnFhdENzcTdkR0dMS2FsNEp2cXRj?=
 =?utf-8?B?WWxsbHlCWm8zaXlsb3ROSG9PdEpCcGhiL1laOGtzNElTN213dEcvVXZqVGJV?=
 =?utf-8?B?dFFFb3V0MUM1QWw5djc2K2cyYnZ5YzJOZHFJaU04NmFaTERNY3EwUlBUQVcy?=
 =?utf-8?B?OVRJS3dER25xbnBzZ1RHNFJmM0N4NWJRSEN0NUxicnVlMXY1TUxDbWdUblJQ?=
 =?utf-8?B?UUw0QTlBRW1rTVkxWWJKdlF6dXEzL0Fnb3BaaWJ5V002Vk5vZlRpUjZIQWEz?=
 =?utf-8?B?TW5QV1EyaVdhQk1wNXMybitwM2laMTFGNGF6eWt6Tzh2K0hYTHllc3hRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3849.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(7416005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UHp5T0RCNDNpeU1PR3VNMk9HYW44VmIwYXF5U28veWo5VUxYaGR6VlF1ekdx?=
 =?utf-8?B?Q0VhYklhdXJML2FITlhDL05sSWc5SEgzcWZOUDk5ZTRjTDR6WW1hTE5nSHVD?=
 =?utf-8?B?Ty9NUmF1RUxCWnE1cWxXbGhUbzQyQk1VOGhlTUI2R3c3V292cE5OY0laUzE2?=
 =?utf-8?B?OGtuVU5mbjVCNkpTdmpSaFVYYkZOOWhlZnZJdHRoZmIwZFU4K3VVbDFrdlRO?=
 =?utf-8?B?ZDY5ejE1MHJWYWdUKzA0SCtrWU0yRldsOWhCeWwyOW0wTnYxVUFLSGtXZ0Jw?=
 =?utf-8?B?UU5yN1k2SkNxang4c0o4ZW1iSFN1MzdrcHZUVzI1Wk9CYVcyYWpKd0hVUmJz?=
 =?utf-8?B?UHBBQlN2TkN5QkRZYVNCTmFSMDlkVmUvZVpzTVNWSGpRNkxvSjlmbnptS1JW?=
 =?utf-8?B?dlIzMjVIeTV0VkdmTjIvdWxINGxOamZCbmZ3dU04akthSmw4UkNtMy9mMHdY?=
 =?utf-8?B?N3c2SkRaMnhFOTVQTDhHZ1dCc29tSmp4b3NhaXJyWDlrUng3Tnk4RGhJbzJp?=
 =?utf-8?B?THEzV2pKYkVObEdlK3ViMmYyUUNsUnlab2syZ2NHclRyWk5mWHFzMkxiaG8v?=
 =?utf-8?B?NzJIRDJXdk1wMGJWdDRzcS91bUlkS2FxMjZRc243UEY0NDVzcXp6aTdaMGpl?=
 =?utf-8?B?dEk5VE5xQVFpZVhUWnFydGV2NURockUxSlhnZlcrSlF3NTNLc1F1UVhiQXoy?=
 =?utf-8?B?ZngzcHQyUC9Id1A4ZTRnei9Jb0NtS3V0WjhZZ1lmSU9PRzlpQ1ZJVjdxa29a?=
 =?utf-8?B?KzErUHJSMHBCOWplVHYwVHRFaWxqQ0d2MkVQSUY2ZnJ0a3pNMkF3VmxVTWtC?=
 =?utf-8?B?YjdTYXM5TWlOcnExUDNMMUhjRTI5akdrT0pWcWoycUFPeUMyYWhGbFFrdVUx?=
 =?utf-8?B?czZHSml1ZnVGZG9CZjdDSkRVZjF2TUtjTi9qOHZKdGZqT3hoMDJHVjkrQTMr?=
 =?utf-8?B?UUd0RHZuYzNSbmZ5UzJEamlKWTdxMyt3QjR0dUtCOGlZWmVTNGN3WGpiYkxh?=
 =?utf-8?B?WVBSV2w4WmFOLzgxYWw1eGFPTE4yOWFJek1DdU5mTlY5VXdMai9JdzBRV3RN?=
 =?utf-8?B?RmxVWk9RdUE1NUhpa2hOR2FsOVo0YXJMNnRvK0Q5aXpXWTZ5clJRaDNSZVVj?=
 =?utf-8?B?TitaZnBBakZNbkJvQnFSUTEyeVJhd2IvUTJIc1FXOHoyUTJsYU9TNUNaSURI?=
 =?utf-8?B?c00xSDh0VDNDOWJXc3ZtTy9OdlFOajdRT2lPV284dDVKdzZUVjFjTlRVMGpT?=
 =?utf-8?B?WmF6M3k4NC9VRkJ0elpMOVFwSnNkY0xSS0gwTDNiQnlORGRVN3lidlFPQitX?=
 =?utf-8?B?UGU0N3VQR3k3eGcra1JGTFhlTzdtN1V5bVFza0tsMU9zSnh0ekpQZEVIMXFE?=
 =?utf-8?B?VlJWKzZUUTRnUGR6T0dmdXM5c2UvVFZvVENGRG9LQklHaEplQ09NVTFxK2d3?=
 =?utf-8?B?SzFON1ZNOVlrVEwyYXA1WFBQQVZncFVOS1c3YmxhK3dtVDhyZ0RxaWo5c0t4?=
 =?utf-8?B?VnZTSmtoRU9RUEM5Y3FvQTAyQS9OWG1obFZIQ2NxR1JKajNUY1laT1hNUllY?=
 =?utf-8?B?azFWTlAzdG5jL0U1VG5yV1MrUWk2cVhOQ2tHZWJ6WE1OZ3lUV0tYVTZhL0ZG?=
 =?utf-8?B?RGlkdWhCZHlWZ2U3RjhNRHJBVnpXRTNsV3A4aFRyeXB5UkszMHI1OFgrUitF?=
 =?utf-8?B?c3BDd2dRalhLQnUvbks1Q0xJdUpwOHBNTkZxdGUxVFo4RFZ2S1QzQi9yQUNO?=
 =?utf-8?B?NHRxRFFwUmlUM3hUakVrSFhQUTViTlVDUkc2d1dqVEFCdXVZaXNDMVJmQkg4?=
 =?utf-8?B?MzVPd0FCaG1MZDJoZUpLRHBVZE9UMi90aDdKcTZZZTBGTHY1NzZhWm5LNnNK?=
 =?utf-8?B?Z2M5dFBlcFNFcTJZRzVrNzdhYmVNQ1dKa1B6dUNsb2VKNmpwZ01mVUhrSXB5?=
 =?utf-8?B?djNYVDIweWpzUTJISkRqQXVIeTh1VnVWT3QwMCtWZUpwc21jSytsajNzSW4y?=
 =?utf-8?B?SGxlMzFHNlhwNWtpbFM4U3UyUlE2ak5HbWpuOFJObURFVzJHSEgvdmVoU2dL?=
 =?utf-8?B?a2FrR1ZBRFlMK1IzS281akQvakJSODYrZDVlRWtpSFdhTWhnRGQ0Uk41VGlz?=
 =?utf-8?Q?2Mkc=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8bcfcd81-2d38-4162-7150-08dc65e88310
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3849.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Apr 2024 12:00:48.6785 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Wm4dU6myx7fbwSLjV9luW8vy7Jueb7cxwPTrq32EDRqMXHK1XCoobKGnnERoDER
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8429
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

On Fri, Apr 26, 2024 at 11:55:05AM +0200, Thomas Hellström wrote:
> First, the gpu_vma structure is something that partitions the gpu_vm
> that holds gpu-related range metadata, like what to mirror, desired gpu
> caching policies etc. These are managed (created, removed and split)
> mainly from user-space. These are stored and looked up from an rb-tree.

Except we are talking about SVA here, so all of this should not be
exposed to userspace.

> Now, when we hit a fault, we want to use hmm_range_fault() to re-
> populate the faulting PTE, but also to pre-fault a range. Using a range
> here (let's call this a prefault range for clarity) rather than to
> insert a single PTE is for multiple reasons:

I've never said to do a single range, everyone using hmm_range_fault()
has some kind of prefetch populate around algorithm.

> This is why we've been using dma_map_sg() for these ranges, since it is
> assumed the benefits gained from 

This doesn't logically follow. You need to use dma_map_page page by
page and batch that into your update mechanism.

If you use dma_map_sg you get into the world of wrongness where you
have to track ranges and invalidation has to wipe an entire range -
because you cannot do a dma unmap of a single page from a dma_map_sg
mapping. This is all the wrong way to use hmm_range_fault.

hmm_range_fault() is page table mirroring, it fundamentally must be
page-by-page. The target page table structure must have similar
properties to the MM page table - especially page by page
validate/invalidate. Meaning you cannot use dma_map_sg().

> Second, when pre-faulting a range like this, the mmu interval notifier
> seqno comes into play, until the gpu ptes for the prefault range are
> safely in place. Now if an invalidation happens in a completely
> separate part of the mirror range, it will bump the seqno and force us
> to rerun the fault processing unnecessarily. 

This is how hmm_range_fault() works. Drivers should not do hacky
things to try to "improve" this. SVA granuals should be large, maybe
not the entire MM, but still quite large. 2M is far to small.

There is a tradeoff here of slowing down the entire MM vs risking an
iteration during fault processing. We want to err toward making fault
processing slowing because fault procesing is already really slow.

> Hence, for this purpose we
> ideally just want to get a seqno bump covering the prefault range.

Ideally, but this is not something we can get for free.

> That's why finer-granularity mmu_interval notifiers might be beneficial
> (and then cached for future re-use of the same prefault range). This
> leads me to the next question:

It is not the design, please don't invent crazy special Intel things
on top of hmm_range_fault.

> You mention that mmu_notifiers are expensive to register. From looking
> at the code it seems *mmu_interval* notifiers are cheap unless there
> are ongoing invalidations in which case using a gpu_vma-wide notifier
> would block anyway? Could you clarify a bit more the cost involved
> here?

The rb tree insertions become expensive the larger the tree is. If you
have only a couple of notifiers it is reasonable.

> If we don't register these smaller-range interval notifiers, do
> you think the seqno bumps from unrelated subranges would be a real
> problem?

I don't think it is, you'd need to have a workload which was
agressively manipulating the CPU mm (which is also pretty slow). If
the workload is doing that then it also really won't like being slowed
down by the giant rb tree. 

You can't win with an argument that collisions are likely due to an
app pattern that makes alot of stress on the MM so the right response
is to make the MM slower.

> Finally the size of the pre-faulting range is something we need to
> tune. 

Correct.

> Currently it is cpu vma - wide. I understand you strongly suggest
> this should be avoided. Could you elaborate a bit on why this is such a
> bad choice?

Why would a prefetch have anything to do with a VMA? Ie your app calls
malloc() and gets a little allocation out of a giant mmap() arena -
you want to prefault the entire arena? Does that really make any
sense?

Mirroring is a huge PITA, IMHO it should be discouraged in favour of
SVA. Sadly too many CPUs still canot implement SVA.

With mirroring there is no good way for the system to predict what the
access pattern is. The only way to make this actually performant is
for userspace to explicitly manage the mirroring with some kind of
prefetching scheme to avoid faulting its accesses except in
extrodinary cases.

VMA is emphatically not a hint about what to prefetch. You should
balance your prefetching based on HW performance and related. If it is
tidy for HW to fault around a 2M granual then just do that.

Jason
