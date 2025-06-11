Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CA6AD4847
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 03:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51D4F10E071;
	Wed, 11 Jun 2025 01:56:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YW9F7Zon";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2061.outbound.protection.outlook.com [40.107.93.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA86310E071
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Jun 2025 01:56:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k00/fFMIJ8S6690rXXd6Ei3BKiJiPkzhS7YyNtQJAueBXH8YPRsrkCV1wR9WLTCwJWUbNIFYtn2UF7rE5y82BCeGI4a0jl2ZXbj/ECF2YnGYckzD7cp5lqEh0E795AK6qbG0CN/0xpIJPItV7YzAr0nd67ZpqsBTpJg0YTjP7hIJKb9yBmKj7QiWv4jBQl1vqJZP+9T7GCdAGhocNeuBmEUxxi+ZZN7fX8azOQGYOb1TFa9UebG9v3jA8BNZGgdPxGKtXgsHsEy8dJBCQ+03ad6dg03xGXmm17F4Ovvo6XtaY9thObcV6QfxxvfIDY7jiwl98MQD7IwdpIwjaUyEiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kg/UojDZeIWBtpTiBBhp2CZHqxPSH2RZpr1n2jLIjcg=;
 b=xVA1gdrehXorISPYA7V/CnIbhtd8Puzy7gOxqh7XOqRIKCdCXe9O72297F4BWrXwSVM2r43HP/6EwXyw5S2zknwlzF5WWn7VnAjZX3BRkolSFigcP4tHAoFF8wuRvlRV5WmJK3HEI42gJ0d4xpE2kBJizJ2JP++y69W2LaPcrifaReK6GLZdhikY5fc15q58U1J2uikLpwNcWJvVKVsyKP70B7EefEZnrBw4U8ILeFXB2UWrMim80LqinZf2At39PNRdY2r6WHtgeijhY8DSGTxbuKviPqPKbr5dyFc+vzuc1hLNU/yTlDBdsSYHvU58E54DLiN0I0qut/rPbdzXZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kg/UojDZeIWBtpTiBBhp2CZHqxPSH2RZpr1n2jLIjcg=;
 b=YW9F7Zonetavh44FavB87Gz/5VQxcmkQz0hVfWj684v6rPEdYQvWRwv3xXYtRFPLTRTjguv1+psX6Ni1/BrJ3grkazHQfas08hwHFR10KWFh5AtJ6BH6ZkTiiYHc0qkRITmvNlhTFYIq7iB0kAwFrIz8gFowXBunqRB4M/8A+6o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH3PR12MB9194.namprd12.prod.outlook.com (2603:10b6:610:19f::7)
 by MW6PR12MB7072.namprd12.prod.outlook.com (2603:10b6:303:238::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.19; Wed, 11 Jun
 2025 01:55:55 +0000
Received: from CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f]) by CH3PR12MB9194.namprd12.prod.outlook.com
 ([fe80::53fb:bf76:727f:d00f%5]) with mapi id 15.20.8792.038; Wed, 11 Jun 2025
 01:55:54 +0000
Message-ID: <e886855f-25cc-4274-9f11-fe0e5b025284@amd.com>
Date: Wed, 11 Jun 2025 11:55:44 +1000
User-Agent: Mozilla Thunderbird Beta
Subject: Re: [RFC PATCH 00/30] Host side (KVM/VFIO/IOMMUFD) support for TDISP
 using TSM
To: Xu Yilun <yilun.xu@linux.intel.com>, kvm@vger.kernel.org,
 sumit.semwal@linaro.org, christian.koenig@amd.com, pbonzini@redhat.com,
 seanjc@google.com, alex.williamson@redhat.com, jgg@nvidia.com,
 dan.j.williams@intel.com, linux-coco@lists.linux.dev
Cc: dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, vivek.kasireddy@intel.com,
 yilun.xu@intel.com, linux-kernel@vger.kernel.org, lukas@wunner.de,
 yan.y.zhao@intel.com, daniel.vetter@ffwll.ch, leon@kernel.org,
 baolu.lu@linux.intel.com, zhenzhong.duan@intel.com, tao1.su@intel.com,
 linux-pci@vger.kernel.org, zhiw@nvidia.com, simona.vetter@ffwll.ch,
 shameerali.kolothum.thodi@huawei.com, aneesh.kumar@kernel.org,
 iommu@lists.linux.dev, kevin.tian@intel.com
References: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
Content-Language: en-US
From: Alexey Kardashevskiy <aik@amd.com>
In-Reply-To: <20250529053513.1592088-1-yilun.xu@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SY5PR01CA0011.ausprd01.prod.outlook.com
 (2603:10c6:10:1fa::17) To CH3PR12MB9194.namprd12.prod.outlook.com
 (2603:10b6:610:19f::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB9194:EE_|MW6PR12MB7072:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f409da2-9ec3-46c3-d2db-08dda88b197a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R1J0czRCM0gyZzNrRWh2V3FrWm8ySDFJMFp6d1RFV2t5WGpxNExnZmxCZWVv?=
 =?utf-8?B?SThYT3hkYUpjaTRrd1Jva3RKRVU1OXNKRlFTRUY0RnZraHpQUHBUUXJzN010?=
 =?utf-8?B?c0NKdXMzNHQ3YlF3aXVVS2diZWh4dzZXMnhzOFFnb3Q1Ymp5SU1COUpYVS94?=
 =?utf-8?B?MzJVWnZ3QU9JenhCZk1kdmY4OW03TlR0YWtuclQxZGppVmgrb0ZjUVVHTEhK?=
 =?utf-8?B?Ty9KS1RnbVY4cW14SndGVFdVWityamlkVnFNWVNka2pHQTc4QS9Ic0sxSkg2?=
 =?utf-8?B?WEpWVUJ4aTlkelloWS9nTWdEeWhoUzYySWpYejZBWVBuc0RNOUsrTUNuKzdW?=
 =?utf-8?B?cyttWnNHSHRYbmpDT09MVUo3R3NuTG9NdFF1bFVtTFZxRnlta3hwelA3Z0Fx?=
 =?utf-8?B?K0svMEVGdTl6UXVyOThYMzFVNUt3K3NqaWxLK0cwa1FNWG5lbTJXbno0QVJo?=
 =?utf-8?B?SVR4R0hUNEtPS2NSUEhIeFRiZmxjMGlFNnRlN3BOM1U0b3pkcERaeGo0OFFF?=
 =?utf-8?B?ZTVQZDZwMi9jemFZNkl6UWpHUTlPeFNmNGRuTkY3cm9hTWl3K1g5aUU5Z1Yv?=
 =?utf-8?B?NUpzUkYxSHRCUm1xMldNdVUzT2l6clMvQzB2K00vS2QwWW1RMnlQVHMyZ2ZO?=
 =?utf-8?B?R284ZE1SeWxXMlpjZEpUUloxVGx4ci9OSkUrcUFxM2liaVVkTGdNVndkZndR?=
 =?utf-8?B?bFFQc25PVno5OFZ5SGpVQThuVG9nSjNoK3I4Y2wwQ0VqZm9rZXVuWEw4NTZE?=
 =?utf-8?B?eU9neU8xQ0pNV29zMUhxOTd2TjA5QWdLb2JjSEYxd25OdWtOZTg4Qmx3bW1h?=
 =?utf-8?B?VE9CNm5yeTVwN0Z5b0NMWjZwSGFjYk92YVZJUDUzck9FSEREcEhkaDJjcUlZ?=
 =?utf-8?B?aUg4RHg5TGwyRWZVM3NFdHZ2SE9pMG5zRHcxSlRwZ2RuOVpSRHBGVVlPNzZq?=
 =?utf-8?B?eEVSMkhIZVR1SVArdGpvekV6YlVlczJxNzVPaVZtRFYzR21hOGtpV2p6UDhj?=
 =?utf-8?B?MVlTcC9vWTRObjROdmJ1YzBiT1FQalVsWlBIZmFHZUJUSStCQU1BbUdGdXlQ?=
 =?utf-8?B?dFJYQ2xqL0JqSm81bGZPWUJVRzlBQ0k5NHk3M1I2c3hBTS96WXFOY0EwT2c0?=
 =?utf-8?B?dlF4MXdUcXlSdUFOdG5FUlMwK3J1ejFHYUk3a1BWY1lXcklwMlFPZGVOYzY3?=
 =?utf-8?B?M3YvTWRJcFRVMGhNNUlra0c2b0FrNjBxbkgrcVhjVEh2TjMwMFgxYWFLS2gv?=
 =?utf-8?B?NjE4a3poMkthb2J1QWJWd2tMWmlnY3pSRTZXMjVIVXFnQURSdkpOUENQNFlm?=
 =?utf-8?B?c0pvUFpubE96cDdKajBPdVVLUUZHTDU0b0ZFdE8wVllFd2UySXEvRURWc0o5?=
 =?utf-8?B?M3VVZ3hNVnhHNVErOGZuREttTnBtQ1hSM2hoQUpQaFZkeVJvcFNwQi8wVVhW?=
 =?utf-8?B?SHVaL3A3ZXh3T3BXQnJDaDJhY0tiUkhuVHJVOXBBZE5GQis1TGdOSXJkTC9Q?=
 =?utf-8?B?YU1sWExtLzhZcXJxbWliT2ZJMnMrNjFNMFNBSFNINVhqVlZzOW55Y2RoLyti?=
 =?utf-8?B?ZFhpY3h6RU4rL2h4Z1UrSGhDMTNCVkFpNURKTjRDTDhOUjNEQ1RKNitEUlpY?=
 =?utf-8?B?WTZqL0ZsMURDWGFhN1hLZERWb2VwejFFUlQrVnRiQTZYcHByVVlzSFE5dlBY?=
 =?utf-8?B?R2tocFh3U2lUWXlobFF2UEtTQUMyMnVGMUlTNFlKN3E5ejU5S2FaYmVXOGN3?=
 =?utf-8?B?M3BuT1FxOGJ5VEdUKzduYkdmSmZpQVVZTkRSSXZVVmhNRFlpSGF2WEVucGI5?=
 =?utf-8?B?SkpMZlpSby9Zalk1alhtQkJGcWJYTGROWkg4a20yYWFkUFo0MlJiNHJ2aWJp?=
 =?utf-8?B?L1Z6VktCWDVrTkNDdlF5OGdmOTZpdE1Xd1phMDBoNWdHV2xnYjFPaWFrK3Fu?=
 =?utf-8?B?emN5RnQ0bk5oalFaT1hJOGFSQ0IzRDNYQlB6dTlHNnc1dlE2WWdTVjVoWHVy?=
 =?utf-8?Q?wMtTW9rCDb6U2njm2DJhU5p0ZbDN1o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB9194.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S3JWc0tnUTZyWGNPNTNMcWZTL1BKd1FBbEd1bDVaUTIzc3I5TFJWNGVlL2dR?=
 =?utf-8?B?OFY5K1pRc1dOeGU0NVlBTzZjTWlFRlBsSGNJVGRzLzMrSVliTytLaWJ2RHh1?=
 =?utf-8?B?T3JjVE5kWDUrQnM5YUJ0VHFRd2RpcWplc3UxRi9uWXBlZjFxNS9xaTdsdDBy?=
 =?utf-8?B?VS9sWlp6b2twUC9BQ0dHbHlDR0dkVllYZGcxR3F4TGdDNGpNeGlXSW1FN1BM?=
 =?utf-8?B?aFVRL2c2dDhSZ25CTnlnZDFITk82Y2U2V0lYMCt0VWRrcHNsMi9mYmdzQVRH?=
 =?utf-8?B?LzJyTnNwaFBkMUtDQ3IybFhGUmdlNHV3bThhdGFPTmlaZ0krU3ZJTUlFVzhL?=
 =?utf-8?B?Y3d6SVBrWFhzSFBPRkhhcXgwY0VoRXpwWnFVa3AyZ01SVFZUME1LSG1KRHk1?=
 =?utf-8?B?cGVySWVUWjdEbXEzcm85bk5USmxxUWNSU1FsazgyQXAydmdIM2h5cUdiUk9i?=
 =?utf-8?B?YTVsc1dvOW5GVkl0Y0l2ZnZUNmp2d05xck1HYWJDL0kyUjljTEFoTk1mR2N1?=
 =?utf-8?B?dHZDZ3RnQVlrQWUwZHVFSXU1ekZBclBGb2RHaExVc3BYYkpPV251d2NVZStB?=
 =?utf-8?B?dWpRNzF5bWlZb1l4aGx4Nlc4Z1dUM2lRV2c5QkQwUmV5Nm9ZZkJ0M3hXdW5i?=
 =?utf-8?B?MlRMaFI0UloxY1RiT3JacFJnNnZua2NJOXYyUEJGWFoyaWtXMGxvN25qTTM2?=
 =?utf-8?B?aGhvSXZVK2pxeHJ1czdVS2lpNUlhYWdyUjFRNm1MQ1RnOEptNGNMRUgvdWlT?=
 =?utf-8?B?OFFRODJSSXBYTnFPTFNHQTNnWFdWRlIvYXdYMm5zSGNMYnpaeUExRWh1MXZq?=
 =?utf-8?B?SlBqUXhJZVJxZUZhMzRKWW1kdTB5Z1I3ejZpRXl6YWZmblNOampWYTBsdnkr?=
 =?utf-8?B?TjdEVGlvcDZsdTlPbjgvNDdNT0tMaDhmK3BMNzMvRmt0MC82YlJjcjQyWFE0?=
 =?utf-8?B?dzI4MHI5dXhvQ2wwbnpPTm5Eazg1K3J3cHZ5Y29zbEg5Ylo3L3FtZ1ZWTUxO?=
 =?utf-8?B?THFQNEZBeEEwNGZGSmNsRmh4TkY1cy9UTHdzcDB2YWNCUTdaQmRMVHlYRWdi?=
 =?utf-8?B?dEdYcUtFcHl0SGZLY0k5cjVIUW9KcFNqYU5Fcmw0d0lGRUdhdTgxNFJzMUZh?=
 =?utf-8?B?V20xbHVHY3JJZmNQc3pVMG1XaTVlT1ZXK0F0MjJhRXBKRDdYYVlRSXB2bHN1?=
 =?utf-8?B?dVlVR2R1WWVNRXUwSy9rTnZDN2U1SDFqSUNHM0hhTEdiMVFxUDJld1ZPM1Qr?=
 =?utf-8?B?enk1blRqNG1kd3U1SzRSN3U3NmsyMnkzNHlUT0ptQ0hOZGMxL2R6K2pVa3FE?=
 =?utf-8?B?M1RoWFk4cmRvUnAwZ3FRN2FSaG5lRVNLcUtMbzNKbk9JRFVrT1pjRGo3eHRQ?=
 =?utf-8?B?cEFjMElQRkU0RXUxUHRiQ29uMm8zZTFaL1RoYmtuaWRPNDFkREU2cjFtWUkr?=
 =?utf-8?B?K2M5d1AwejRYbGE2Q3AvQzRVMXo4eGtOV2ovYmVuSGRNZzRSTUNZTXQ2QU1V?=
 =?utf-8?B?b2JSTSt3MjVBOUdOcU1ocW0wYVlNQ2pBdGtwRW1tb1gyZlFkSjFkelJFYzlC?=
 =?utf-8?B?WFh0cVErU2xRQUNaclRrZytlUzZySWhlM0xTekZxdzdFd092cm5HQTF5WmJr?=
 =?utf-8?B?WWptcWducjRjN2JHK2tybXYwQXNWWXVjSnY0UVpUNlFVVVJraDV6WVhaQ2Uz?=
 =?utf-8?B?b1RqaXJDK3JTMlhZK09hekdlNFVYdDliV0ZaNC9kVlQzSjE0TjZ3T2E2c1pN?=
 =?utf-8?B?MWdKUlhPK1Z5b0pJRGd0SmVDRERxcTRzWnJCWEMwQXVjSDQ5aFhFTThjNzkw?=
 =?utf-8?B?clhPcGlxNHBGUHRJOUFZRitySUsxWUx3NWF0SWNoVEF3VFVNY1Fha0VveUwx?=
 =?utf-8?B?aVN1bGNsZlYrY0h2SXJ3bFBQRDhhV2x5ZzVpZkVzMDR1OXp6L1NiaVRZV2lh?=
 =?utf-8?B?em1uTGZ5c1h2VzdUbzZuNUJCTlRpUUxXWEZ4NDN3Syt2dlJmK2RsMVUzNVVG?=
 =?utf-8?B?OWxHVzdjdnkySEtZREJsU05pTzNvUkxNNVZZdFBpSmNuNXZxS2NsdjdJQWtl?=
 =?utf-8?B?MjE2d1RBdkQyd0V0NzFBZC81S3FnUHdYNjhEbHdHYXl6YmZ4QWFqSldmVU1F?=
 =?utf-8?Q?6iC7RxE4g8fIN0e1s+Z2kqtiQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f409da2-9ec3-46c3-d2db-08dda88b197a
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB9194.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 01:55:54.5319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: b0Hz61nuQzU92/92WQpbSTSUNOruvF140qwHAw9q05C1zOCMN30XVi6rh9cfjEk+DPnnG9k34vZ59RycndeOfw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB7072
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

Hi,

Is there a QEMU tree using this somewhere?
Also it would be nice to have this tree pushed somewhere, saves time. Thanks,



On 29/5/25 15:34, Xu Yilun wrote:
> This series is the generic host side (KVM/VFIO/IOMMUFD) support for the
> whole life cycle of private device assignment. It follows the
> previously discussed flow chart [1], aim to better illustrate the
> overall flow of private device assignment, find out and narrow down the
> gaps of different vendors, and reach some common directions.
> 
> This series is based on Dan's Core TSM infrastructure series [2].  To
> give a clear overview of what components are needed, it also includes
> some existing WIP patchsets in community.
> 
> This series has 3 sections:
> 
> Patch 1 - 11 deal with the private MMIO mapping in KVM MMU via DMABUF.
> Leverage Jason & Vivek's latest VFIO dmabuf series [3], see Patch 2 - 4.
> The concern for get_pfn() kAPI [4] is not addressed so are marked as
> HACK, will investigate later.
> 
> Patch 12 - 22 is about TSM Bind/Unbind/Guest request management in VFIO
> & IOMMUFD. Picks some of Shameer's patch in [5], see Patch 12 & 14.
> 
> Patch 23 - 30 is a solution to meet the TDX specific sequence
> enforcement on various device Unbind cases, including converting device
> back to shared, hot unplug, TD destroy. Start with a tdx_tsm driver
> prototype and finally implement the Unbind enforcement inside the
> driver. To be honest it is still awkward to me, but I need help.
> 
> This series don't include the VMEXIT handle for GHCI/GHCB calls for
> Bind/Unbind/Guest request, cause it involves vendor specific code. The
> general idea is KVM should just pass these calls to QEMU, QEMU parses
> out the command and call the newly introduced VFIO/IOMMUFD IOCTLs.
> 
> With additional TDX Connect specific patches (not published), passed
> engineering test for trusted DMA in TD.
> 
> [1]: https://lore.kernel.org/all/aCYsNSFQJZzHVOFI@yilunxu-OptiPlex-7050/
> [2]: https://lore.kernel.org/all/20250516054732.2055093-1-dan.j.williams@intel.com/
> [3]: https://lore.kernel.org/kvm/20250307052248.405803-1-vivek.kasireddy@intel.com/
> [4]: https://lore.kernel.org/all/20250107142719.179636-1-yilun.xu@linux.intel.com/
> [5]: https://lore.kernel.org/all/20250319173202.78988-3-shameerali.kolothum.thodi@huawei.com/
> > 
> Alexey Kardashevskiy (1):
>    iommufd/vdevice: Add TSM Guest request uAPI
> 
> Dan Williams (2):
>    coco/tdx_tsm: Introduce a "tdx" subsystem and "tsm" device
>    coco/tdx_tsm: TEE Security Manager driver for TDX
> 
> Shameer Kolothum (2):
>    iommufd/device: Associate a kvm pointer to iommufd_device
>    iommu/arm-smmu-v3-iommufd: Pass in kvm pointer to viommu_alloc
> 
> Vivek Kasireddy (3):
>    vfio: Export vfio device get and put registration helpers
>    vfio/pci: Share the core device pointer while invoking feature
>      functions
>    vfio/pci: Allow MMIO regions to be exported through dma-buf
> 
> Wu Hao (1):
>    coco/tdx_tsm: Add connect()/disconnect() handlers prototype
> 
> Xu Yilun (21):
>    HACK: dma-buf: Introduce dma_buf_get_pfn_unlocked() kAPI
>    fixup! vfio/pci: fix dma-buf revoke typo on reset
>    HACK: vfio/pci: Support get_pfn() callback for dma-buf
>    KVM: Support vfio_dmabuf backed MMIO region
>    KVM: x86/mmu: Handle page fault for vfio_dmabuf backed MMIO
>    KVM: x86/mmu: Handle page fault for private MMIO
>    vfio/pci: Export vfio dma-buf specific info for importers
>    KVM: vfio_dmabuf: Fetch VFIO specific dma-buf data for sanity check
>    fixup! iommufd/selftest: Sync iommufd_device_bind() change to selftest
>    fixup: iommu/selftest: Sync .viommu_alloc() change to selftest
>    iommufd/viommu: track the kvm pointer & its refcount in viommu core
>    iommufd/device: Add TSM Bind/Unbind for TIO support
>    iommufd/viommu: Add trusted IOMMU configuration handlers for vdev
>    vfio/pci: Add TSM TDI bind/unbind IOCTLs for TEE-IO support
>    vfio/pci: Do TSM Unbind before zapping bars
>    fixup! PCI/TSM: Change the guest request type definition
>    coco/tdx_tsm: Add bind()/unbind()/guest_req() handlers prototype
>    PCI/TSM: Add PCI driver callbacks to handle TSM requirements
>    vfio/pci: Implement TSM handlers for MMIO
>    iommufd/vdevice: Implement TSM handlers for trusted DMA
>    coco/tdx_tsm: Manage TDX Module enforced operation sequences for
>      Unbind
> 
>   Documentation/virt/kvm/api.rst                |   7 +
>   arch/x86/Kconfig                              |   1 +
>   arch/x86/kvm/mmu/mmu.c                        |  25 +-
>   drivers/dma-buf/dma-buf.c                     |  87 +++-
>   .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     |   1 +
>   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |   1 +
>   drivers/iommu/iommufd/device.c                |  89 +++-
>   drivers/iommu/iommufd/iommufd_private.h       |  10 +
>   drivers/iommu/iommufd/main.c                  |   3 +
>   drivers/iommu/iommufd/selftest.c              |   3 +-
>   drivers/iommu/iommufd/viommu.c                | 202 ++++++++-
>   drivers/vfio/iommufd.c                        |  24 +-
>   drivers/vfio/pci/Makefile                     |   1 +
>   drivers/vfio/pci/vfio_pci.c                   |   1 +
>   drivers/vfio/pci/vfio_pci_config.c            |  26 +-
>   drivers/vfio/pci/vfio_pci_core.c              | 161 ++++++-
>   drivers/vfio/pci/vfio_pci_dmabuf.c            | 411 ++++++++++++++++++
>   drivers/vfio/pci/vfio_pci_priv.h              |  26 ++
>   drivers/vfio/vfio_main.c                      |   2 +
>   drivers/virt/coco/host/Kconfig                |  10 +
>   drivers/virt/coco/host/Makefile               |   3 +
>   drivers/virt/coco/host/tdx_tsm.c              | 328 ++++++++++++++
>   drivers/virt/coco/host/tdx_tsm_bus.c          |  70 +++
>   include/linux/dma-buf.h                       |  13 +
>   include/linux/iommu.h                         |   4 +-
>   include/linux/iommufd.h                       |  12 +-
>   include/linux/kvm_host.h                      |  25 +-
>   include/linux/pci-tsm.h                       |  19 +-
>   include/linux/pci.h                           |   3 +
>   include/linux/tdx_tsm_bus.h                   |  17 +
>   include/linux/vfio.h                          |  27 ++
>   include/linux/vfio_pci_core.h                 |   3 +
>   include/uapi/linux/iommufd.h                  |  36 ++
>   include/uapi/linux/kvm.h                      |   1 +
>   include/uapi/linux/vfio.h                     |  67 +++
>   virt/kvm/Kconfig                              |   6 +
>   virt/kvm/Makefile.kvm                         |   1 +
>   virt/kvm/kvm_main.c                           |  32 +-
>   virt/kvm/kvm_mm.h                             |  19 +
>   virt/kvm/vfio_dmabuf.c                        | 151 +++++++
>   40 files changed, 1868 insertions(+), 60 deletions(-)
>   create mode 100644 drivers/vfio/pci/vfio_pci_dmabuf.c
>   create mode 100644 drivers/virt/coco/host/tdx_tsm.c
>   create mode 100644 drivers/virt/coco/host/tdx_tsm_bus.c
>   create mode 100644 include/linux/tdx_tsm_bus.h
>   create mode 100644 virt/kvm/vfio_dmabuf.c
> 
> 
> base-commit: 88c473f04098a0f5ac6fbaceaad2daa842006b6a

-- 
Alexey

