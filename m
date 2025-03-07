Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DC2A56BF1
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 16:25:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ECDD10EBD8;
	Fri,  7 Mar 2025 15:25:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="E7VWu2Am";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2087.outbound.protection.outlook.com [40.107.236.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DA010EBD8;
 Fri,  7 Mar 2025 15:25:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aMNcfv39Eoym8ajki12DzFj4PieFajEnhoPkWEFKvhJPCx270Q89ZmLkYPCqxbg/FCjcj6MuiyAyXwzQwXMkhISVmNhLuR1Izfahifto7+HCT4y6QSoAlAyoqnNaMsTvgReaMdG04CJ9zhFoFMtVtFC2MCquPh2NocAKFN/SYrc0nWCIs+QmhUa8zVUeyOfLtI1EuMcNOLgISeRNST1+3tzB0LnVbpbxflqF7Kd0SONGoRQSrDQ+Fu3ujSg1zbi26DUFQCoxSesDOBobq7lMafibZptm9GKggUCO86ScnUaRs+ui7VlqJoKTBJjHnqZKkfdoAbWhMBKv/g35fFBpAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kpqw6k60RSDbgfpB13Snac9ebGF0UFBY5DJ4+cl9J4k=;
 b=HzzU83JQbKdy8i74Ol0qYxDfnJwrY7dFcCBiJOWdLm+B/EqZOqv4/zYhApNSMjmSVg+qGOf3Jiskahv2it12q4ghWEPDKqrwa+F6b7wVNEuS1BVWRSDY0tXGP9qVeOsWaPwf2xhgKy9dvZ//M7ave4a/5AaKC27cEdzLCDKrjB8IUYKYB7K20LGfaZbLFAWVv5gJfiiW5FSsnlUV+VMpMz5hW4aJas4+yROnlMUQDusrbLxG84gkZdst+T2Gt35RyZQDJLvUg9OKten8QjThkchhkHelH4GGalJIxF9+dMLnmbpi4nYJESUFogGSHM3/692tqWEhVHRe84t9BKUEHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kpqw6k60RSDbgfpB13Snac9ebGF0UFBY5DJ4+cl9J4k=;
 b=E7VWu2AmeQZCKVIAJHjH+6qYfT0I3ZE6Uw+x5G7k7e93AdIM+SR0nLtajX9Fbn29pMuJltFH4VbaKejfEEzPMH9znl+O5u1AJZZ+JxOOHufg3jLG7XUZr0mxxUMYPjRAtceuazoF6kTncSiyq5XhiY63eJi05RGA/faXidN4B5ZeEr329LKFK7ArEUxiPYDbn0lHHeYzsJqZ54HWiRCrJN6gWQil7jPH4EpAFajk2BnVc7nVajoKnGntm6qPY7dgCmZVBWM0QmkVqMFDW6NnI5qpgqdp8x0cMn2WXIsm2n6hxCL9Jid3MeTA7u1y4XtaYy/+SzyeTwQOAfXzwOWKsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW6PR12MB8663.namprd12.prod.outlook.com (2603:10b6:303:240::9)
 by CH1PPF0316D269B.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::604) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.25; Fri, 7 Mar
 2025 15:25:30 +0000
Received: from MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f]) by MW6PR12MB8663.namprd12.prod.outlook.com
 ([fe80::594:5be3:34d:77f%2]) with mapi id 15.20.8511.017; Fri, 7 Mar 2025
 15:25:30 +0000
Date: Fri, 7 Mar 2025 11:25:29 -0400
From: Jason Gunthorpe <jgg@nvidia.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>,
 Dave Airlie <airlied@gmail.com>, Gary Guo <gary@garyguo.net>,
 Joel Fernandes <joel@joelfernandes.org>,
 Boqun Feng <boqun.feng@gmail.com>, Ben Skeggs <bskeggs@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 paulmck@kernel.org
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
Message-ID: <20250307152529.GR354511@nvidia.com>
References: <20250304164201.GN133783@nvidia.com>
 <Z8f9mgD4LUJN_dWw@phenom.ffwll.local>
 <20250305151012.GW133783@nvidia.com>
 <Z8l8HgZOV7sDWqBh@phenom.ffwll.local>
 <20250306153236.GE354511@nvidia.com>
 <Z8rKVZolu8n6lB1P@phenom.ffwll.local>
 <20250307123255.GK354511@nvidia.com>
 <2025030753-celtic-quarry-1799@gregkh>
 <20250307144629.GN354511@nvidia.com>
 <2025030749-pulp-juniper-c35e@gregkh>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2025030749-pulp-juniper-c35e@gregkh>
X-ClientProxiedBy: BN9P222CA0030.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:408:10c::35) To MW6PR12MB8663.namprd12.prod.outlook.com
 (2603:10b6:303:240::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8663:EE_|CH1PPF0316D269B:EE_
X-MS-Office365-Filtering-Correlation-Id: ea13f8ad-b844-46fc-4d20-08dd5d8c4bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4lD9MA3m7uwHQtQKz3p6zepr0DjUwoJ9sKHLWGqIaPz/JbNE2VNMIPaQBCu/?=
 =?us-ascii?Q?qfn2fOSRdWv86/EJPkfpZxwdy/vHiSy4IPgncZVksu97SJ68qR3hcP02wG+o?=
 =?us-ascii?Q?6lYJ2/6dNxuSoOm/EgAlWwudNJuGBzAGy1pceFgeSn8a9I0tCO3/UiVXSLOh?=
 =?us-ascii?Q?YudxO1zYv67dtXuW99HMvS2zlNUvvj2BN0nm1D5DpPR38P6AFeIIDfzfMmiU?=
 =?us-ascii?Q?11PzNUruoYDxK1gpF3N4VhlCxy01QiuiRFPAQ8x4TF7UjPFMZTz9FKCevq2/?=
 =?us-ascii?Q?sTXjwCv5SpBelQaJGbT4U/ATn0oFZo4I5fWPE3KIerDntcaGe3yjqRny1Don?=
 =?us-ascii?Q?qmOOmHhU3RtYgkAIPRfiRmAD2IPFL3OWgUp1sH/yNShGdPKNtYlNFJdHm4Vk?=
 =?us-ascii?Q?zacKBQWVX3HfaIo700Yhv94z52YBFWTMXFRkXk/X8F5+5gAo2qwNjVOa3XgY?=
 =?us-ascii?Q?DeXOYoSWNJG01KhnJN4Qi7UU/zYoJuCDAs0kta2iXbh/JMnBUrmejX1LNxwV?=
 =?us-ascii?Q?ql0kIe+sUOBTZrlfMf2eTbFd3GoMuZPfEL76mVkLUJBAzRtm0wCslxJQG6HW?=
 =?us-ascii?Q?IiLCKstE/LwHfMOjhr/jIA3jhYFS5K3LGs894KJVwLv2p0c99VUubEKPzkg9?=
 =?us-ascii?Q?O7G0vstiwh1zzrAUVv96vEqWv32UZoKQyqj7KWoZdL4XurUkv8TIFsj+7UUC?=
 =?us-ascii?Q?1fmFe8oL2p5GGIRdWZ1rUza4q2YaX9q6neQXs1rcmBqLnKiZngoR2Mc76gT6?=
 =?us-ascii?Q?BZQK71hB+p6IcZuk8LPCBOARDRtKod2k/s0/oFJQ9pNf5CoMrBrJErbo7MJD?=
 =?us-ascii?Q?SyIU9PpBpq4ZzSZvCTCGVR3ZnxurMfDAiP2Z5QRy+gNyerEe5iVzNzvPhBe6?=
 =?us-ascii?Q?BdgH7ie1V5uHWt1eHy4RJYfc4LUK7zt0C5zWtvBgs9gFwC9ds4Kz83M2Xr+2?=
 =?us-ascii?Q?l12JG2dXWi3qHn95YitQmnBZ37nEsQDeyd6CKDT8e5+iwcp7m15Iyz6TPROL?=
 =?us-ascii?Q?EsR0mJup4ErqBOfNCpWBX5SU9jGvgvAULDbFnWgnyhKq6KWzbgi6GIeBFN5N?=
 =?us-ascii?Q?xvL6dGB4d6FMIhPz+aDDjDpEJYX5+7EMXjD+NtKrZUcSSp8AV6YUuCm/mp1V?=
 =?us-ascii?Q?+G1jXKcfh5JIE/Fsk1+FYuae75c9El7lLIdHJp3CahCREX8nFCXMGfUgKPQ9?=
 =?us-ascii?Q?f/ygSV80aIA6Qc4gJ6mCUoNqQ/2lJ2BDS5l1qE3HzYUlZpCyjuWhtIOLXnYf?=
 =?us-ascii?Q?+cVDAnAOgotrihGV0oews0ynNLU+pRGjYUe1CLZFVqKkziJyT8oxec4AMJ5I?=
 =?us-ascii?Q?xamlLzYcS0FjNzEBrESCOB67hKmTdkdca28VTWdCdKRRZRyt7XVbLZzyaE6a?=
 =?us-ascii?Q?FGuJ7IEaKzkDFceeE+fK93yxDsux?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8663.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Urql6DXOcSZ2ugTjHnOoB9ZgcqSjKDrwOiXdSKX00UC7OxhtmIG85HMU5Kit?=
 =?us-ascii?Q?bX3RUfIzRR6MjArbCjChFIBOWYExU0YeTdCNOoNydEvFhBZt26YUFSKiPTis?=
 =?us-ascii?Q?+G+UVhKRVIlVbkOZc3ZHZ6faXOqgDXmo0VVvljbkSucr8pE6v/PBHuwhnhMg?=
 =?us-ascii?Q?PngYNH3HpfLtCcUrEllsLYlZdvAUCRCTOCsM8ao9UJD2cAwsazTMpLcHh+hh?=
 =?us-ascii?Q?5oZjynRWTp67n2kQahFB5UthPMCk0iVIbA6ezbbl72EVKc/TrlJW67QnZu96?=
 =?us-ascii?Q?Dn6XOogaOF2BWwsv5jcmcGcR4sxxqxM/qsUTH2W1CDbaQCtHIqxqMAexsl1g?=
 =?us-ascii?Q?2E5GIxJmmOhpf6RwBzHEO86dEL2bVfnoVToDy0xA6AMbJm6lKvv8Xuz3MrNs?=
 =?us-ascii?Q?I4b9wBsYoBrM1CrX6T6CeLP4huxy8etYE58/82QHSNQ1ql5BF7fHl8G1M1wn?=
 =?us-ascii?Q?h45f0XITzBi3Pr8llcE0QwaZ3hF5eF7qxf91OCHp1M/bhMPgWs4V9AekVfx8?=
 =?us-ascii?Q?nGlVawNSyIAS4+D7EHzpCummLqyV8elxWi8CZXsXxGK/MJtTvGqBCe1Y//rQ?=
 =?us-ascii?Q?C1eQdwW+oXek1iKmPVs1lCFM84s6Us6YiCERdwgfp2+lJSMusQriVIlgfvrc?=
 =?us-ascii?Q?fB4vaPfQ4zDPAU3ZK+Vk7CIz4llQvGrqYGl33IKwmlqO5e8QADhYSdGaxM4i?=
 =?us-ascii?Q?u8QDsHaZaKnRJWBEY/fxAct7yUk6So85FDI/20x9X02ux0myxTAYk13yeHl5?=
 =?us-ascii?Q?hnM/4d+ALkZNT8vCg9XrhnRAUvQbkQC9wSnG5YjbIXGWx0F+glrZ/i39Y3ut?=
 =?us-ascii?Q?SEVU3mK5TqfICNU2IwGc0sb1evMqbCGvEvxyZcGlCScwvoI8y+0GZfHIKxCU?=
 =?us-ascii?Q?6wPbrfXlrGJ5orP9bid+//R0xmkO9BTrNFwPV6PGlGcSeEItvRu9zIgdNsar?=
 =?us-ascii?Q?kEYCjcIYnAxqS4wwiRVv8XfQyxeWssjsA8f6KffdYLPVOI2deSYMdj3jL8Km?=
 =?us-ascii?Q?AYr2mE6rDbRU52xDztx3ndxTAf9I010VR2pkY0ja+gm631NA9lHF/BMBveqj?=
 =?us-ascii?Q?AuhsekA7VSQ9hjZ8qBxZl+PAPDwu1eby7twW/G0REJQlUri7DKQIqHQUuR/d?=
 =?us-ascii?Q?nRACaud144AYmnlgD4urzjv0m+b12Tvk3xTy/H/fad9nGHWDOHYiTInW4ktL?=
 =?us-ascii?Q?vYJJHJjYMLSlOMZLWliggWznPsXpB2ZSSd0IVuwHlNCFPFM/L1TN8DshP/vZ?=
 =?us-ascii?Q?k6/YPGx6oHnYQG5bCMFwu2KS+BnhCul453fzFdFNqdfvPIuLKBnEjSPvqvdv?=
 =?us-ascii?Q?V411a3Vgv03Ukk4wEfaFURCSgiqqfV9R+LMRUkkPF6UZ0+5p2W4FszQtw+9S?=
 =?us-ascii?Q?Tr2CYBPV36lvA7BtSFeo2dbWKsGUpakyZtZBhpMxCG+kfx4fxlBD4gwLCkxM?=
 =?us-ascii?Q?iAeRQXTTqThrPGYgV+lyA9CSzBsSSwUIwzSw7y0OwDMYFMrCEmkQ0SxaLrNf?=
 =?us-ascii?Q?ML4dNdBdwi5Wu7DwGlfcEGc4oLc4ec07xlrwh9pbu1tBc4TBRFz19BZHA4EI?=
 =?us-ascii?Q?75v0QL94zWk0FY1qsZsBQD8OfV6Tvb93vcwqTA2K?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea13f8ad-b844-46fc-4d20-08dd5d8c4bc8
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8663.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2025 15:25:30.6188 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rKv8JTolGsMw89U5FCkD2Zz5d2q0XckGKMTa6Vs0Q17SJD5ryDPC+Jgrv5BEp4N/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF0316D269B
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

On Fri, Mar 07, 2025 at 04:19:30PM +0100, Greg KH wrote:

> Just like other busses, if PCI can't handle this at the core hotplug
> layer (i.e. by giving up new resources to new devices) then the bus core
> for it should handle this type of locking scheme as really, that feels
> wrong.  A new device is a new device, should have nothing to do with any
> old previous one ever plugged in.

I think it would break the iommu assumptions to have two struct
devices with the same PCI BDF co-exist in the system at once.

There is only one HW IOMMU table routing BDFs..

Most likely the new device would have it's iommu setup blown up as the
old device completes its shutdown and tries to tear down its iommu
setup that is now actually owned by the new device...

Jason
