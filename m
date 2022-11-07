Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9ED3061F92B
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 17:20:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39F6D10E48D;
	Mon,  7 Nov 2022 16:20:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79CD310E48B
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 16:20:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=liz2w13ZLGPcvYfJVU+jn5KRaxbhRJW2v8aI819uhQQm4kQob04HLpGe9SD13BPNKNviwWV8wS2jM0cf972aE+JIwC+Yu6aXKjnTMXCGmaxbpLu+gANLnZ2PJlaGHuUhxutNfKJHFHRiC0wHtWwivK4lnlRHdeqer8fkEPVfvnq99w4pZfdjTbonzK5bODwzUh9N2oPjveNri2+PgfJjD7mTxAKGB5CrFG301iaiWQne23a/6jjN4BX+QhVKn+daz6STT8rXCZ4VUUiumZVxh94LsIyvqSD5CQYILCITDl12lSmKflet6x9EcIRp0AaoOWF1R8fJuc8V8sBpQh1iLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qEba9tlrQrXSOPgVoctFpB0rq+nC9xAACtYhDUQxdJE=;
 b=Ux7YWDbGhYnPt0ZGb9dd9FNZpCEuL7Yi+gWkwXGGxr9uMwoOnoZx4a1A9+QHPEnYSPTFI0bMlBs1qDH8cUHLPBufl9Zs+tv3cGUTgppW0kGT2Iz4XGackgl1j0iSBk3s6MBUnyrqSbmZN0zKPdQz6ukl6RZaFINTIiYhKkvDy11EgGyNeeQdwI0bFXl4DyEB/bqxoXgDPgNlSJvxF6idhr3vfGT82ifz6Xjx7Ka8AQeIPop18ZniQqrVgbbR8c+ph6McKeMXRnXmey/2PuudKSCxig8UN9lZC3ABb8Rnkc7Y1mEv69qp3xInNQfPex6yIzsyV45pDdjLhGoW2Puujw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEba9tlrQrXSOPgVoctFpB0rq+nC9xAACtYhDUQxdJE=;
 b=fetm6j763gNuwp+1+9JsOzODpw1yhDvlTnZ1jxppm3vWdZMFZ0ozIAHg1PV3MX2hjvxsNKrpUrDkFh5Uja3bfWFQv/GQeZdH5shjDoT0kJGMrrecTSu4bykmUmmdcPZdcN/cNXV3dZerlOA/WI6m9Ax/paGTByh67Jocl1l9dguW+K2TRxBApcF6UgsR4WEOtZbeyoxRLh38+d6pRU5XUVmoLEckuHajjgAJ4G9NbSkwEuJHZIQACD9qjrDlkXhC95ezq8HdSDSvvleQGC/AISFC2OL2cJ6tc41I3hXDdHOxJLZ5NawFXtnqAd1lepcAmHfly2TGWgDmZMMoZXd6RQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV2PR12MB5869.namprd12.prod.outlook.com (2603:10b6:408:176::16)
 by SA1PR12MB6797.namprd12.prod.outlook.com (2603:10b6:806:259::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.26; Mon, 7 Nov
 2022 16:20:10 +0000
Received: from LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de]) by LV2PR12MB5869.namprd12.prod.outlook.com
 ([fe80::7a81:a4e4:bb9c:d1de%6]) with mapi id 15.20.5791.026; Mon, 7 Nov 2022
 16:20:10 +0000
Date: Mon, 7 Nov 2022 12:20:08 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Oded Gabbay <ogabbay@kernel.org>
Subject: Re: [RFC PATCH v3 0/3] new subsystem for compute accelerator devices
Message-ID: <Y2kwOO9GOUF9DsJj@nvidia.com>
References: <20221106210225.2065371-1-ogabbay@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221106210225.2065371-1-ogabbay@kernel.org>
X-ClientProxiedBy: BL0PR1501CA0024.namprd15.prod.outlook.com
 (2603:10b6:207:17::37) To LV2PR12MB5869.namprd12.prod.outlook.com
 (2603:10b6:408:176::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV2PR12MB5869:EE_|SA1PR12MB6797:EE_
X-MS-Office365-Filtering-Correlation-Id: cf8746a0-08f0-44d1-5bfa-08dac0dbf0e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jfKcRzQTfSBtgw1CiBPbP8iR2NLqV39hsaOzfDxk1l6vVU1mRIqpK41jGtZ63DYp4BotW7a+Zb0vPnFfUH4gXfBsDJ4SncHLsFc5JUOGerF8eRTZa5vGvZWKFCCnCxz54aokmW+TuaSpDf3MOI/nAA4P3m/N/7Hng39mTHGXlRyVY6Kl4qu0iDiTBpFhfatwazODCpqRg2ZtSZqMtpbtnJDLOI3jGI9fxojs9uCi+BpyzK7siHrsdv7O9BBSWcKOLJ+qKe9RamPN4xYzQ7aZYGrEl0U267gSxCcowV8H0dyIbDRWzGdQfAQnrkJvhvxP0vadqPY0AClSWfDki7aMeGY1jfG2uKokMYk0isBG0b3RmePr+aFOiaL9uzIQNQBVSGd8QNMDIj+FzJwxyNwN+e+efd8VeJzFz8nQpxqKK4NLHaYVsof3hcafjJ/Vnfr8jEqExuilEIrlHwFv4fyQa74QO5v936UfDyi2+tSKkP7NowrYTlo9Bbu453FjLGyb63kACzJ5e9ne47kyP7E1h/BZzJOEXtUXf7LozetNbO9d+uUywdKTS0W3eq0J+tmWw5qGy2bY9fW3CStkE3rTLFwu8w9d4hjvi9XfCZjVSOF7t9VDv672Jbp4zOQazFzaM/w+ces4QbKYbGuw6fUQ+zekDDEs886k//smgSEIJZQik1GnucYCPkBpesE4R6LNOep03cyjRJSwEgF2ttQEXg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV2PR12MB5869.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(366004)(136003)(39860400002)(346002)(451199015)(6916009)(6486002)(478600001)(2616005)(5660300002)(54906003)(66946007)(66556008)(26005)(6512007)(8676002)(41300700001)(8936002)(66476007)(7416002)(4744005)(186003)(4326008)(2906002)(36756003)(6506007)(316002)(86362001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wO+0WUjhVa53Oi31Gnqx3YnmLFXwMs3pXGBlUoXH3kd7WDVMz8Q8iwUazl2f?=
 =?us-ascii?Q?yVclDAOxiGeUqdFxIqC63qIA/YANujdH9MFlzWD3iC/2zjQBayvWcXCyrcQA?=
 =?us-ascii?Q?RkjKxAZdMIvnpTznqpNOVVyNQ1LeFOTpLGFcJRpwzm0JzTxVQbiiTfneXXMv?=
 =?us-ascii?Q?NmV2CNj9d9tqnqZwUtsTK07Ggd4jIKBffXLqCWCDcGzX4bqGGHDl6VpgGHvR?=
 =?us-ascii?Q?nWLzWN0uOc5BvjfD4eBAHeGfUgLHi516yjvidjR5zhQC3BLKHPOR+j/K2Reh?=
 =?us-ascii?Q?W8J6cir2YOzKFCnnqfyPeyIjUM0QZUMJ8eiPC2qSIt30SAAh2v8Asx6qFutm?=
 =?us-ascii?Q?qw9/mNCKD7VdoQETXRFeTd8Oy+TIq0eYWAen5bGvIuVVZ5TKsNudXViVN2E0?=
 =?us-ascii?Q?gH4PBANmcYB7Ft6RgSMLxaaFhA9VRQkcHoPnB6s0/5E/htdC3U6IfSsQ3tiN?=
 =?us-ascii?Q?yB0mTEBfxurC6yZ4axnNp7XHCns9u19aTWwK9fad1FdbXjVedz5dUYsGXI45?=
 =?us-ascii?Q?t/gjcUVfoyZWc/Yv+C3fceRGcyMJzaX+w5CacYDV2gkPS59o93h9MIXtZI0F?=
 =?us-ascii?Q?skwmLrtEswJnsosjIl/Ekv6NM4Vo1gR/F0CXzKEL7yNWThTj1Z3adEMsm+Df?=
 =?us-ascii?Q?dFkzt7Oikdjbxps6OxyqCm+WX0QH9yF5c/41iVukqn9hF+rlXQtHLaqBPF5r?=
 =?us-ascii?Q?1Z/QJtJR9jG4/UMOMARoNWqD7uzHu4YdriDjCuRO07rbLLqRGLfmghF04qjR?=
 =?us-ascii?Q?2898fTTREbVt6GYHjqnc7STtjZMF4ZRVTRan8DJMWn9dm3FabVSzafHK/wGd?=
 =?us-ascii?Q?dSyxrTwV7udkwIY6PYjCfUWIwZFZ+83NTGm+L84a2lKZXP6S3O2lIW6AXDFb?=
 =?us-ascii?Q?k+fwZQhmmuUpj83TplWu29/ikGh6bMOgswUVPl2lC9yJr1ojhTlKueQOUxTy?=
 =?us-ascii?Q?MuWm2SDD+SyPM9doOks5MbeBYJn5R+GALFWR6FUi5mG3JHX6Jse2GpqH0A9q?=
 =?us-ascii?Q?JMEDnG1vxxfspTq5MTq4ua4m5HMyOfG8Hei1+HcFqjCvVAipZh5gQHbkDRhT?=
 =?us-ascii?Q?h845kDIHkB1HX5RzLQRSd7ofIkIkcVrMhkHnk3jzbT6d/S9kSNB8SUCG8nqI?=
 =?us-ascii?Q?NDvEUOeBa8C20IeRu83tasLtGU8anQaAup1WaA4KRb7UY9iSoVLt/kA7dQqQ?=
 =?us-ascii?Q?8gGaNidrSsaSZRwDx7s/3aGDFa1dI7EcqbM8ltv6/JX3TthKDiiUQfhIb2kf?=
 =?us-ascii?Q?n+KgpO1wBfImCNwHF4aJW6ZIvGO9rC7DWNZdNk4xTM9rcOeQ5BWOjLzFt1J/?=
 =?us-ascii?Q?1s75w+wJyWg6ZdQZzpwxjj7WYoWvanj4p8/bLejk/sIW7phfJCri64Zm6hC2?=
 =?us-ascii?Q?CL8U1QYBPzo25FEO1A+rH2Bs0mpf0cwn2QiSWEcmKEKjWva2RrtfJAcFriF5?=
 =?us-ascii?Q?nXv84LXRhjz6bIptcuyKxLljBxwG5P+zAd+DH+bPZvYjyNuoMi+moX101z+G?=
 =?us-ascii?Q?W68uRcl6DZUqw9io1h5fPMTh2Utr6ZvP6x/nPQF8vO/Qro7BlL261W6XPoJC?=
 =?us-ascii?Q?fIUxim1qpMsh9tX1SSs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cf8746a0-08f0-44d1-5bfa-08dac0dbf0e2
X-MS-Exchange-CrossTenant-AuthSource: LV2PR12MB5869.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2022 16:20:09.9332 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7yrfkvwQjRArrWcl8X0aI9nUJRwBO/6dZiOaHV3COu4qDl6HmRttZE+TJHGFDSOW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6797
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
Cc: dri-devel@lists.freedesktop.org,
 Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
 Stanislaw Gruszka <stanislaw.gruszka@linux.intel.com>,
 Kevin Hilman <khilman@baylibre.com>, Christoph Hellwig <hch@infradead.org>,
 Jagan Teki <jagan@amarulasolutions.com>, John Hubbard <jhubbard@nvidia.com>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Arnd Bergmann <arnd@arndb.de>,
 Jiho Chu <jiho.chu@samsung.com>,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Nov 06, 2022 at 11:02:22PM +0200, Oded Gabbay wrote:
> Another important change is that I have reverted back to use IDR for minor
> handling instead of xarray. This is because I have found that xarray doesn't
> handle well the scenario where you allocate a NULL entry and then exchange it
> with a real pointer. It appears xarray still considers that entry a "zero"
> entry. This is unfortunate because DRM works that way (first allocates a NULL
> entry and then replaces the entry with a real pointer).

This is what XA_ZERO_ENTRY is for.

Some APIs, like xa_alloc automatically promote NULL to XA_ZERO_ENTRY,
others require it to be explicit.

If you use the usual pattern of xa_alloc(NULL), xa_store(!NULL) then
you should be fine, as far as I know. So long as the xarray was tagged
as allocating.

Jason
