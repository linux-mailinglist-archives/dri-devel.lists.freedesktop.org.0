Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE85BBA444C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Sep 2025 16:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FD9B10EA74;
	Fri, 26 Sep 2025 14:41:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qk+Xg7st";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN8PR05CU002.outbound.protection.outlook.com
 (mail-eastus2azon11011028.outbound.protection.outlook.com [52.101.57.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DCDC10EA73;
 Fri, 26 Sep 2025 14:41:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IHJD5vwVXH1d4DdYXiXjWsOZvwFjdbx7O1nS2966JRgBnGr7rwMAZc26S4E5SlsZo/mZOZYe7M9kDVR4H6hqzdAW6KCPQkPsLaMhWBIyCHqgQkXB0oYsqrSwPeViGRqrEnXmyeaYPNnhkbJuA9BLKq1MPAjfGgSA4CvMcoHsNAFA+knEXuG+sfcXp2B1Am5t7xXOv/otRc2EMuhuqlpBsh0EPP1ULTuv7XV3TOV/T0AHwOYpsqb0NqelcCVwBs9mIN5J02m8OBS8UHjeaK3ss6/3kjgvP+1TuGfTlFETxX0LF6MyMFwh9KA9HAvMpEffqqDE6dT9Fz4FR2Z3y/QqZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eBl0mJSRDS/gmj9JGidwdWBXF9hWDjcUwlr67UBTYvs=;
 b=kwwSNvVHSf4fbw2r4MW31xzNsD2JGT88vmV3irnszACK97H9gv/SlsO0KJUNYcu8oMigm8rLoEJwPy6BATApffDwKbkvLn9Ucx/x4zZ0KTZI9hXXdqU2BTl9AK4Bufzeeec/WQf2mZvj65cZmrudptKm77cq8KWN+eyG/pv89gyORpEm8rIWMTn3DuabHJaD5LYKCXoyzZnPjgA7j+vWhEzK4jMdG9YjVV3SNQkk0qCzAH0GxsHIiIWPBnzM2Et6yywtSML4k3BOXYSfQ/79Bg1MGUr6u43ViuSQLn4nM9FQ0LLyW8GXCG4XdTMZBDqOE6zHBbCcSssskiYCMpM3jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eBl0mJSRDS/gmj9JGidwdWBXF9hWDjcUwlr67UBTYvs=;
 b=qk+Xg7stJ5Fd+OT8wK3tkpGQwSg6ZxGTaeDcVE5gKkRaMXL7HYWUy77804yIwhvqf26gCh0XhMWbl09lmoq+lhv7EfKxXZ2AqKxOcpZDM3Is9se62mlx71GDlqtKQJMftgjIRFd7Bda+bQG+P4w0m+7KXIuZISNljx2bxVBGPLVJRUbnaNtg2rRNsd8fwCD+JalbZgbI+0DfNwF5YgFe2MWeaGFy9W1Wt2oOhvvJJqFpzUmftqaMtZd7RCrfHb7TBfK0/gug+1CjizEK3DwGK/sr8AmNGLXTWeeaYYlypwhZtcxy3T8SfZUMBi80FjThbi1Ycmq9kj8iv9gICFlVdA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB5757.namprd12.prod.outlook.com (2603:10b6:510:1d0::13)
 by CY8PR12MB8361.namprd12.prod.outlook.com (2603:10b6:930:7b::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.14; Fri, 26 Sep
 2025 14:41:31 +0000
Received: from PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632]) by PH7PR12MB5757.namprd12.prod.outlook.com
 ([fe80::f012:300c:6bf4:7632%2]) with mapi id 15.20.9160.010; Fri, 26 Sep 2025
 14:41:30 +0000
Date: Fri, 26 Sep 2025 11:41:28 -0300
From: Jason Gunthorpe <jgg@nvidia.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 intel-xe@lists.freedesktop.org, Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Kasireddy Vivek <vivek.kasireddy@intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
Subject: Re: [RFC PATCH v2 1/2] dma-buf: Add support for private interconnects
Message-ID: <20250926144128.GD2617119@nvidia.com>
References: <20250926084624.2288-1-thomas.hellstrom@linux.intel.com>
 <20250926084624.2288-2-thomas.hellstrom@linux.intel.com>
 <472f27f0-2f54-45dd-b0a6-3a26b5eec301@amd.com>
 <ef9f4fb1c55bf3e5e6423b2accdccee0607b95ef.camel@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ef9f4fb1c55bf3e5e6423b2accdccee0607b95ef.camel@linux.intel.com>
X-ClientProxiedBy: YT3PR01CA0099.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:85::19) To PH7PR12MB5757.namprd12.prod.outlook.com
 (2603:10b6:510:1d0::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5757:EE_|CY8PR12MB8361:EE_
X-MS-Office365-Filtering-Correlation-Id: fa11771e-e86f-4ce9-a124-08ddfd0ac7c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MURydGtvQldpYmoyU3NOSWszR2E0N3dDaUZva3IvZEtnN0JZNEo5SXhySWZI?=
 =?utf-8?B?TGoxdXVVMDV3VjdyY3pLWUQ2REUveGlNU21JTkZqMkRDWEY2UDRMVHVkdlk4?=
 =?utf-8?B?dUhmdzl5TlhtZ01YZDl5YldTd3hJUkt1WWpKNGtBdFVNSkd3RWhaRjdsMXhv?=
 =?utf-8?B?bEN0N1RKQzR3MmNzYlYvcG0rV2IrUEVIa3ZyVnp5bVNQS21OR3JFZmdxZWY2?=
 =?utf-8?B?WjVJZlJBYnJXem43MkpRZ3Z1MVVzVDVJZHd4NGttdVJJNjBSdkZraHNrSUxu?=
 =?utf-8?B?RCtIY0pTZ2xzSExsWUxUWFFuN0M4TVpZdEx2NHJBcUI3RDZtU3hmM0svNHRX?=
 =?utf-8?B?UDZ1YXllbHB4Rlg2SnJOZ2tuWmJmd0x0aVg1dzkxYXQ1bS9HaG9tbVhxanhD?=
 =?utf-8?B?ckpMaUlUWmtPb3Nhb0xvc3NaMTFWVTdiRS9UOVBkblJsQkRZTTlId2IyL3ZL?=
 =?utf-8?B?aWtZU0wxSGM0d1loY29qNXo1KzNkQjlGbUtac1Q4MkR4UWFZd3hkKzltQmdP?=
 =?utf-8?B?R2xRaTRjbVQrUVkxUnE2c0hKVFJLenZoUUFZVW02ZnpBQ3AySDlRTXRXcCty?=
 =?utf-8?B?QkxyQXUrOGpJUXVTMGp4N3p5KzVURXhadE1TanE4bmtiU3d6VVdidXZBREN2?=
 =?utf-8?B?RTZGVnhrZG9QU21jMjRTYjhFdXY4Z3owVmhLR3VHNDdKbUl4TkFWbzYweUZZ?=
 =?utf-8?B?d09TaVRGN3NQVzBEWE95RVlaSFJDRkNvZnNUOGpnWHBnMTBVaE9ocDAwY204?=
 =?utf-8?B?YnBhbzR2TDh3N3VJV1Q2VC9YSW5qUngvbDZzazZwSlJlVTBBbkg1ZUVJazBj?=
 =?utf-8?B?QUhUL1IxczQ2OGVFVWFjR05rQktkTmxjY0Y0N2FBRmcrM0lkQ3BWUHNZUVQ2?=
 =?utf-8?B?MlJrdWg3YWF4RU1NbnUxaGdlVW1tQmNVdWJSQ0FHdkoyNUhmeTRTVzFFbFkw?=
 =?utf-8?B?blo3THhDRnBlSmtrSXpDenlrUGdqRmRCTW9DNkdQRWtsbVhIUDBJNXp6K0g2?=
 =?utf-8?B?azhQbEZ5cW1mTGN1eWNDcUZCQks3SlJaQk1iR0lOeXAvc3V2QStzYjJJVi9D?=
 =?utf-8?B?R2NDdEpOUDF3dkVEMGFJcXVycUJ2WjJpcUhCdXJuZTJsZkZrTjhIUnR5Y2da?=
 =?utf-8?B?SzdNeWFCQVJqeDM5dncxbnhNbFQ3djJkWnp5OHZ6cnB1WkRhdmNFSUh3VnV1?=
 =?utf-8?B?RFBlOTJNUGVyeWhwRXlYMnB4cnhVaTQ5Q1pjNWpwZjh3d004Yi9xOCtibEFK?=
 =?utf-8?B?K2R3bmJmQnJ5UkttZkNpK3VSdmROdnVacnhKNmhGTGpZMC9LaXh4WG5pUEY1?=
 =?utf-8?B?SVNPWHZaYmVGYnlCcmFEczBRNUR0bVQ4VGFHb1poMkxHOWxjQ0k1TXl4MGpW?=
 =?utf-8?B?VkxTaTBqaDBRTGQzdjlSRWxkL2I3dThQSnllRU1FUEFYcEx0QjNVVERRL2tm?=
 =?utf-8?B?OTJUTnR1WjByZno3WWp1dlloZ2lLUEZMb2xtSzVMaGE2MlVRVGJNZXBzdUdY?=
 =?utf-8?B?c1ZaZldMUVM3NGJ5cEtXRCtrcTVTd3BGa1pYaGphMUJheEhTdENHODdZRGJX?=
 =?utf-8?B?aStJc2NQKzVSekdxMnF6RlFvS254UGd0Q2djNlZkait6Ull4TVJZSkQ0NWIr?=
 =?utf-8?B?ZXBxWnRFSGgvM0VnQXlOdnB0ajFwY1h6c2I1eklTM1dCQUV6UFRBNGZyNkdL?=
 =?utf-8?B?TmU3UktjZ2dIK0Q5MUlRdzM5Mk1GNDJYeTYzWCtDQ3hHTDBxT1Zham1VV0R4?=
 =?utf-8?B?Zk9sejRzb0UwSlRRWlVGcXpDTjhhTWZlSWpaMkpCRmtqanRWMnRRc2QzdFZk?=
 =?utf-8?B?cTZ2K1dQWnUzMTRwSXdaSTBiRnNVS000bVd5UWxBZ3VDdjFOUEtDb2hjVUFI?=
 =?utf-8?B?WnB0S050bENYK3Y5d0dpOHBmNnpjNFVhMkVvM2NldjBnWnovYkN2VDQ2VG91?=
 =?utf-8?Q?aPKzI9lPkxo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5757.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UEtPTUJsYUYyUXIyOEFacHRyY2prTlhEZDFuUWdsTDlIOXJIWk1YaWROd1BI?=
 =?utf-8?B?NTQ0cVZnM3c5NHVZMzZERnIrVW11NlF4OFAzOE02RXdEVmdmK20vRS90VTFm?=
 =?utf-8?B?VEVjMC8vSFcxc2VZd3FheVJMMStlM3RWcDRrdStTcTlESFpHZlVRTysydC9E?=
 =?utf-8?B?dXRtNHFMUE5ndk5xQTczYlBORUFJdndaR3p1Z25vMTZaMXNpSkRzUSs4bVRT?=
 =?utf-8?B?U0ZLQ3hzeStSYVl5eWNJYzF4dE9reTI1MlVGMTBPcUxPQ00zNzJlVjhnVmp1?=
 =?utf-8?B?aWJoMDFicm0vNk1aZFBnWWJ4SjNsNUFwQWJ0Y0ZJcVJjQm5qUmYwWU5zM0Rz?=
 =?utf-8?B?eWVnUlBHeVpBbXRvSEY5TWdVcmUrZXZ1d29LaGVRTWFuZW9jQnFtZFZOVHdH?=
 =?utf-8?B?aXgyck9ZYStTdERaOGkrVExGeW5hZmtmbjN6SGNoZzNxT1pEVlRkUE5Ua21u?=
 =?utf-8?B?NDVzVEJ1aVlodWRlQy9oV1lFMkN2d2VMWEc4YnV0akRWUFlZMlFDWTltVFow?=
 =?utf-8?B?WUg5aEFsQ29wWjYrOW5HR291bk1OYlkzVStJSXRhTjJBWG1lNnphaFFvNHgy?=
 =?utf-8?B?K09PYXhPc0NQeHlWT2VHTTE3QUxFSENyMHliM1VBZy8ra1BDYWhMWUxPOW01?=
 =?utf-8?B?ODJMaGZFVmkxOWdUdEVQR0lNWXVJMmFmMnZBQk5DWmdTd04rN1hxNytPdTZS?=
 =?utf-8?B?KyszdkZyaFF6TGFJZTE1VzZxTit4Z2V0S0J0ak0weFBIRG9iR05BVytaV0ZE?=
 =?utf-8?B?YWJFbmZOYlk2NlFPUk9oZHFJY0o4Wm95bWFxazltZzhuWmI4amlvZ1VUaEo5?=
 =?utf-8?B?MU5rTFZjSHZMbS9Bc0UvMUJscUVkVXlKZlRsdzlHdWNwejF3cGRrNy9Cc3Fa?=
 =?utf-8?B?cU9lVnFMQXpEdm04WVZXYTdRNDFDMHFSWHJsTnBvZ0xzaFI2anFEQ2FwUFVm?=
 =?utf-8?B?OWp5eXpmbEdLdHNhT1c0cXZWOGR3QXhUdy9oVzluS1dHWmgra3cyNmJVN3hw?=
 =?utf-8?B?b08xdkErb2NCYUlRSktEcFhFRWFJanBFSXFPY1RPeEVGQTlra0dJY2JndVdU?=
 =?utf-8?B?SEk0UXJKOFpWVEcrVkJyWFFXSWNLSy9aVVhGaEw1WlowZGd4eDlKMkdsdTdn?=
 =?utf-8?B?SHZxbktPTGpTWjFqSVpJdGVBUjU1SXhmQSt6ejlQSFZZY0w5M0Z6Zi8rTVAw?=
 =?utf-8?B?UGV0ZVpORjVKVFE0eW1yT2hvdlpPME9MTVUraVZoZG9qUkZNakgxZS80VjRF?=
 =?utf-8?B?Y2Z6VnVRdFN5OUNVN2xlVnJxYi84SjR3WDRSaUp1LytNU29uQzZMN01tekMz?=
 =?utf-8?B?VkRIeHRjTThSbXF6SDRWbW44bU1sNGZUU2FwdmNwZWVJSUljbGJTQVRIR2lq?=
 =?utf-8?B?OXFLWERNK2tqTHBpSWpiaGoyc2p0OEtVNElTYkJ4aGRrT1pURkk2eW5NcXMz?=
 =?utf-8?B?YU9qN2MxdUdTaHIwTkdRS240TUVXd0lqdVJPdnFIUENQSWVsMENNNWlpM01s?=
 =?utf-8?B?Vk53NHM3dDJVQzAyYzgzRE1mSnVIank0aHZIRzN0dGl6VFpVY0FnMnl5bEtQ?=
 =?utf-8?B?R09laTZDRDl6N09EOUpnd2JNamtZNWViRDQwSVJ1Wkt5RktlSHVNSnpyZWxh?=
 =?utf-8?B?NlNMdWxDQTJzaVFrYnUzbmlaS1dXbDBjQnRhcFpVcHRpTFBpUWFHQ01WbnN4?=
 =?utf-8?B?NmFaMHp0cFBXeUVyZW93YnV5NEkxZDFPMjNTNU1VbUxsazVMWmF2enRmdkpI?=
 =?utf-8?B?bFkyVjE0bTBsVGNIZm9lSENuWFk1bC9SVUJmRVN1cWxMenYyZVRnVDlwcnMy?=
 =?utf-8?B?ejJUa2U2SExHVHlMNVA0SDdkWU1ud253Yi82dVRPeENTTmVZZ243dHB0elVI?=
 =?utf-8?B?WGdlZkh2YmlZUDJBMTFVU0d2QkpTV3VDTVJydENCcjRDUUowVGFKS0kvUGg1?=
 =?utf-8?B?MzJtaExNMFBGK2p4bXFjeEQzcW03UUZoQmlzampDNThlSEhUbE9iS2tCZUhQ?=
 =?utf-8?B?WnFqNStkZWwydkwrQzZBTE5EMXdMZjlidVFZRnphZzYyQ0FMNnlNaGhaY3lm?=
 =?utf-8?B?WGdXU3c3TnViZXlGYUl4RGZZYWxlRXFWb1NHMWNGblp3OWpSV0JqUGpqTWN6?=
 =?utf-8?Q?K34I=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa11771e-e86f-4ce9-a124-08ddfd0ac7c4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5757.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 14:41:30.1051 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QriFEXlEOqwtL60zYQgBMYuyCV1D4rcsjI4bHg4WDCI7+vRIHXQU5R3oF9FbQbw0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8361
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

On Fri, Sep 26, 2025 at 03:51:21PM +0200, Thomas Hellström wrote:

> Well both exporter and exporter has specific information WRT this. The
> ultimate decision is done in the exporter attach() callback, just like
> pcie_p2p. And the exporter acknowledges that by setting the
> dma_buf_attachment::interconnect_attach field. In analogy with the
> dma_buf_attachment::peer2peer member.

Having a single option seems too limited to me..

I think it would be nice if the importer could supply a list of
'interconnects' it can accept, eg:

 - VRAM offset within this specific VRAM memory
 - dma_addr_t for this struct device
 - "IOVA" for this initiator on a private interconnect
 - PCI bar slice
 - phys_addr_t (used between vfio, kvm, iommufd)

The exporter has a function to run down the list and return the first
compatible. Maybe something like

    struct dma_buf_interconnect_negotiation {
    	   struct dma_buf_interconnect *interconnect,
	   void *interconnect_args,
    };

    struct dma_buf_interconnect_negotiation importer_offer[2] = { // On stack
        [0] = {.interconnect = myself->xe_vram},
        [1] = {.interconnect = &dmabuf_generic_dma_addr_t, .interconnects_args = dev},
    };
    idx = dma_buf_negotiate(dmabuf, importer_offer, ARRAY_SIZE(importer_offer));
    if (idx < 0)
        return -EOPNOTSUPP;

Then you'd 'interconnect attach' with that compatible item and get
back an attach. Using container_of to get the specific ops which then
has a function to get the address list.

   attach = dma_buf_attach_interconnect(dmabuf, importer_offer[idx],  &dma_buf_attach_ops);

   if (idx == 0) {
          xe_vram_ops = container_of(attach->ops, ..);
          struct device_private_address *addrs = xe_vram_ops->map(attach);
	  [..]
	  xe_vram_ops->unmap(attach);
   }
   dma_buf_detach_interconnect(attach);

I can imagine some scheme where if the exporter does not support
interconnect then the core code will automatically look for
dmabuf_generic_dma_addr_t, select it, and supply some ops that call
existing dma_buf_dynamic_attach()/dma_buf_map_attachment()
transparently.

> So the above function mimics the dma_buf_attach_ops::allow_peer2peer
> bool, except it's not a single interconnect so we'd either use a set of
> bools, one for each potential interconnect, or a function like this.
> A function has the benefit that it can also provide any additional
> attach ops the interconnect might need.

allow_peer2peer seems to indicate if sg_page() can be used on the
sgt? It doesn't have any meaning for an importer only using
dma_addr_t?

In the above language it would be an interconnect exchanging 'struct
page *'.. I'm a little confused by this I thought touching the struct
page was forbidden?

> Is this to not overload the map_attachment() and unmap_attachment()
> functions that otherwise could be used? Is it because they return an
> sg_table?

It would be good to avoid going through APIs that use sg_table in the
design..

Jason
