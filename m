Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10406588C47
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 14:38:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A81D10EDBC;
	Wed,  3 Aug 2022 12:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-DBA-obe.outbound.protection.outlook.com
 (mail-dbaeur03on2054.outbound.protection.outlook.com [40.107.104.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0296A10F5FD
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Aug 2022 12:38:03 +0000 (UTC)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=NCe09TgVhwKVuwB/j2HmPoTcH0ZLhDYUPgeT3caanO10vW1mlrUKMS+N4+i1p/qj7BPEozSYXen0eNNzbKoRkTtAUu4WpT6PW8lQ21TrgTWU9D36zKvVVfFQ5FFB2OPubbOxuH8jGwFrgbPoAjMamOlSZozWpYMs0u+xJ6aQKbQzF8djxOKrqlW7E7RNZQ7e4Vz+dmxaE9qKnzxCNOgKPhU0VcCk89UmtaUyFRSKQlt8ogxcODO6IuRCHMwO/pfp1a6TNAxAaqEwOd2S50cCZ7LVII7e83RyD+N3FCuy28l8HagUn+Ns1xDzFgGb0p3Ib5auxW7ixsh+KfE3NkD7/Q==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcBjmzVE6HDvyhZqqY5/JwK+mE2b8pOqMqTp8hTUsVY=;
 b=iXupdhNTsMmM3DCk3eZpzKcmiP9mUWZvbcHeW9H74MTd0HsHgy+w4FSCk9sUkTl74DR1+S832eD5nbZG+fUQYINLU6up+sIrugQ2c64OAyqDZu/Wihn+z1bjVthrUawyA0ylpn3IiqwZ7dY7gUJdy1HWhHgGDe+D65dh5lHRiuWUhWIvHGpNlTsLDv0nkG9osX+nrHBtf77dBj5beLgzCWAUGjl5MLQozQgyxHciDDOv1Wozacz0XbIQF+jDBAQDvb6rSeiqKX9nr115YYRacvrz1G4yMMGLLZq+LeZza5rgJCHf8JJNHfWyFeZ9BTgvk5ceILzC7eXxX1nT9ZCMeA==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=lists.freedesktop.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcBjmzVE6HDvyhZqqY5/JwK+mE2b8pOqMqTp8hTUsVY=;
 b=wBlttEHyoXQto594r89J5qW5tAFQKGs8u3fLCyUa1oi96WoOayrVWdZw7n+94Cp4sqsUJmKgxACM7oC91PyjBEKtdfOO7ULtINWBuakcjaqzWZRms51GDVwjO0Mz1gHyWH+d4F6H1fyxl5HEAqYrEfOnsFUlcm1C1b1APYKemPU=
Received: from AS9P251CA0014.EURP251.PROD.OUTLOOK.COM (2603:10a6:20b:50f::18)
 by VI1PR08MB4094.eurprd08.prod.outlook.com (2603:10a6:803:e7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 12:37:59 +0000
Received: from VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:50f:cafe::8e) by AS9P251CA0014.outlook.office365.com
 (2603:10a6:20b:50f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14 via Frontend
 Transport; Wed, 3 Aug 2022 12:37:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 VE1EUR03FT048.mail.protection.outlook.com (10.152.19.8) with
 Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5482.12 via Frontend Transport; Wed, 3 Aug 2022 12:37:58 +0000
Received: ("Tessian outbound 63c09d5d38ac:v123");
 Wed, 03 Aug 2022 12:37:58 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 5034b587eb3adb80
X-CR-MTA-TID: 64aa7808
Received: from 9496db128e22.1
 by 64aa7808-outbound-1.mta.getcheckrecipient.com id
 E90BD2E8-77A0-4158-B8F2-AFBAB86BE029.1; 
 Wed, 03 Aug 2022 12:37:51 +0000
Received: from EUR03-VE1-obe.outbound.protection.outlook.com
 by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 9496db128e22.1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
 Wed, 03 Aug 2022 12:37:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eV7vfCrGUEAKG1MMZhqwlbRQPrsSqfU8Xd6BkoQp5Gzq9Av8GG4X1tmt1p61qPvwJ1MxAetOe1zf/Fx5wMl6B2St1RhZ6MVBzhpzcPngXpMDPDQ2+HDGyhmrMVM+ivccXbLUsEKkeMgrGDJSBE2LN0bCkODfZwClv/F5UkuLjGTgx+cakbdwKhv+iwmm25rJtAbqoCp8WJiyFzCuSR2/SMY5jyE9KoE5Yyyl6hOCwFzUruiSelcOkLZFXSYuumh98gwNg8omVZmozPnLxGgz+LJPdumLT8I6Uooz5s6MBhbbRWEIqy9UpNWpxg2hEakwZWVYyVSqzw/ZmByZSRq6DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lcBjmzVE6HDvyhZqqY5/JwK+mE2b8pOqMqTp8hTUsVY=;
 b=g1avhy/O6iXh0KFAU98hqjED/FMgQbnQW26SfCwxryRSvlxqBNLtZcojiRw4SxkQOKD5tdZvWsdwyyKEmy2fILI9lQHBGuSAQ2cgAPMMUZTVBsK1CMymGLYEXHR5ayJz6un6Vaim9G4tprxVrzsWlmAn97uLk8PwWzVC9/P67QqOvj5cF2wJIDT8HaXJIJjL8Y7oEOly178AkKbynBscUjUdzH5o/4DPfGcrdhGf0SNHYXcOdro6Mk+3UGB6GUMNZdlUNjTOyI14Mxkxe0CD5sKUNOS0zg165ptBcmRh9d7dRSeh0nyvNvIIFsQrqhautpulZkZxegz4ZFWqzpyKqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com; 
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lcBjmzVE6HDvyhZqqY5/JwK+mE2b8pOqMqTp8hTUsVY=;
 b=wBlttEHyoXQto594r89J5qW5tAFQKGs8u3fLCyUa1oi96WoOayrVWdZw7n+94Cp4sqsUJmKgxACM7oC91PyjBEKtdfOO7ULtINWBuakcjaqzWZRms51GDVwjO0Mz1gHyWH+d4F6H1fyxl5HEAqYrEfOnsFUlcm1C1b1APYKemPU=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from AM9PR08MB6803.eurprd08.prod.outlook.com (2603:10a6:20b:301::12)
 by VI1PR08MB3821.eurprd08.prod.outlook.com (2603:10a6:803:b7::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5504.14; Wed, 3 Aug
 2022 12:37:47 +0000
Received: from AM9PR08MB6803.eurprd08.prod.outlook.com
 ([fe80::4cad:8ea2:a247:6bce]) by AM9PR08MB6803.eurprd08.prod.outlook.com
 ([fe80::4cad:8ea2:a247:6bce%8]) with mapi id 15.20.5482.016; Wed, 3 Aug 2022
 12:37:46 +0000
Date: Wed, 3 Aug 2022 13:37:32 +0100
From: Brian Starkey <brian.starkey@arm.com>
To: Olivier Masse <olivier.masse@nxp.com>
Subject: Re: [EXT] Re: [PATCH 3/5] dma-buf: heaps: add Linaro secure dmabuf
 heap support
Message-ID: <20220803123732.ohsy2j2y33zsrhlh@000377403353>
References: <20220802095843.14614-1-olivier.masse@nxp.com>
 <20220802095843.14614-4-olivier.masse@nxp.com>
 <20220802143908.24vemxeon537cad2@000377403353>
 <d11cd7921859c9b24db304107caa0fc2deb780e3.camel@nxp.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d11cd7921859c9b24db304107caa0fc2deb780e3.camel@nxp.com>
X-ClientProxiedBy: SN7PR04CA0222.namprd04.prod.outlook.com
 (2603:10b6:806:127::17) To AM9PR08MB6803.eurprd08.prod.outlook.com
 (2603:10a6:20b:301::12)
MIME-Version: 1.0
X-MS-Office365-Filtering-Correlation-Id: 453d65bf-191f-4b38-c65e-08da754cff50
X-MS-TrafficTypeDiagnostic: VI1PR08MB3821:EE_|VE1EUR03FT048:EE_|VI1PR08MB4094:EE_
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: orMCJrPYe4YOPisWertJA2HXYB+zYjd5P9HCTpP9OEDJb/X47C262LGRwy5bbO/hnJjya2nJ0/ZdSV4KsqvHUPaQb4bw6BmQSL8S5Rs3ZstKQ6lIf9GyqoGU9qEv3P4rASc7W1CogAWQ7ViWL9UvcQ6L0nLj8dUENPShxJTUhu56mcGl9AXUByot1lwrSmvn71oJ3F+jyF0vpTreqMFJqcTFZrSJ7TpqlS2mwe7he73fXJ9vOUdwkRBLoJaFpjpI/ZzW9R5FWKxqzcIgLApxpjzTUEudmqmkdfPxOF0n3j8GbdJdj1r0uun4Ab5VgYG1io+jzO0mJTWxTRWns4R2Uyv/SK/Yg0JWuB/GNJEtFfgPa48lNqi0YlOU8rhNbQL2sjzZKY1OeK3gXQXR4FjRczfF0QCxy79zb4w4XQJJaM59nVyyGqjMmaItc28E5unVO19CQC3VKIk1sJOPw+r2Um6ZXes6tUicQrl27Qhx8VcGAytYZ980E8Z6E8W5DUeuQE0+QG7oh3oi7H5ElctyRwji5AOMIbMRB3e3kx1hPe5oi5exsPVDL9khU5XoSVCCuUx/lD5f3qtDKBxenp229dJ8hVNSHungjsRf+YMHFoixAyhCcGh4nThFRytGpYnbfitEVskk2Q7CD04Sb77jwLCxyVBkrP3mTjpsKjjYbBoClJvDeGYok5h6zqUF1PCj
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:AM9PR08MB6803.eurprd08.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230016)(7916004)(4636009)(366004)(376002)(396003)(136003)(346002)(39860400002)(186003)(6512007)(9686003)(30864003)(26005)(478600001)(5660300002)(966005)(6486002)(4326008)(66556008)(66476007)(44832011)(8676002)(66946007)(8936002)(83380400001)(38100700002)(6506007)(41300700001)(54906003)(6916009)(1076003)(6666004)(2906002)(86362001)(45080400002)(316002)(33716001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB3821
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: b4fc7e92-58e5-4a0a-5578-08da754cf7f2
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z+KlL1MqPg9rHhd/R3j5p655eHszyoz3ZIEK1fpGSI/vLRMiiMIVeFF3OraY2Rr5bDYqBqvfOuJjQF3arEU6JIoefdzv6fttgwcyeyo4oI5fivkmyykO3zAh6mciC5rtwYrjl4qBz5y0Lt4Ss8GZ0no9ig+/sUnA2420a5v7KKeNOnuF53bv6bjevqM3T8ZtO0yNUXCCp5PSXNTEsz1wtxEyauPuBqRZ7ht+NVllr/Pfc5OeKBsqLPt5zG+mI2AfUCSQYoiHAN/MFbyR9wYOTzg9Cy9l2Ci6+8ZcWbYXtUik2TVlCsqsl4/e6ICtKBZJRB07GNkE0hP/l/+kpfI+DtMevA5FXBOKpfJz7SKxu7syrGYCPPahrM5DT/dyuSLbZUFZHg80jvjrFBQwRCMW7wcQ/BJBjo8+9IBRks2aok0DdCy6/rYPkHKDPLZHI6dxfzHslm9xeK7PAXKGgosv4HaTd6c4NaB59rWS0apQ6qY1Z/ZKttUYpD16aWtQsCeoLNtGJF9oxL2cZ640c35q91MqOm6ZMz3YfTjKlBZt/PWofA1MmGyyYJxMN9kzxIdTOnRhZRErHaCGe09ujbxpfqU89EXU/NczK4b0xLjVPpyb5clVRvxnqsafKPu3pOystVnFta5yXvisRR4kX3arOg/c2CCUJ0e+AIpubcHgKxgXecaFdOffrhWt5ZfpRlRI6mLnSCne1ouiA4jKX6YMlVNzsWyxo+j6UCGiriPHpVnZMpncZBsn+0SVUgk7/n41
X-Forefront-Antispam-Report: CIP:63.35.35.123; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:64aa7808-outbound-1.mta.getcheckrecipient.com;
 PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com; CAT:NONE;
 SFS:(13230016)(7916004)(4636009)(346002)(136003)(39860400002)(376002)(396003)(46966006)(36840700001)(40470700004)(41300700001)(2906002)(186003)(336012)(6666004)(40460700003)(47076005)(26005)(9686003)(6506007)(1076003)(107886003)(82740400003)(6512007)(86362001)(81166007)(356005)(40480700001)(83380400001)(82310400005)(33716001)(5660300002)(36860700001)(966005)(6486002)(478600001)(8676002)(4326008)(70206006)(70586007)(6862004)(8936002)(45080400002)(44832011)(316002)(30864003)(54906003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2022 12:37:58.6242 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 453d65bf-191f-4b38-c65e-08da754cff50
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d; Ip=[63.35.35.123];
 Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: VE1EUR03FT048.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR08MB4094
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
Cc: =?utf-8?Q?Cl=C3=A9ment?= Faure <clement.faure@nxp.com>,
 "benjamin.gaignard@collabora.com" <benjamin.gaignard@collabora.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "linaro-mm-sig@lists.linaro.org" <linaro-mm-sig@lists.linaro.org>,
 "nd@arm.com" <nd@arm.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Aug 03, 2022 at 11:07:54AM +0000, Olivier Masse wrote:
> Hi Brian,
> 
> Thanks for your comments, please find my reply below.
> 
> On mar., 2022-08-02 at 15:39 +0100, Brian Starkey wrote:
> > Caution: EXT Email
> > 
> > Hi Olivier,
> > 
> > Some comments below as I mentioned off-list.
> > 
> > One additional point: some devices need to know if a buffer is
> > protected, so that they can configure registers appropriately to make
> > use of that protected buffer. There was previously a discussion about
> > adding a flag to a dma_buf to indicate that it is allocated from
> > protected memory[1].
> > 
> > [1] 
> > https://eur01.safelinks.protection.outlook.com/?url=https%3A%2F%2Flists.freedesktop.org%2Farchives%2Fdri-devel%2F2019-September%2F238059.html&amp;data=05%7C01%7Colivier.masse%40nxp.com%7C64e0ce1952ac4e926a8208da7494d0bb%7C686ea1d3bc2b4c6fa92cd99c5c301635%7C0%7C0%7C637950479760002497%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=bmlw9uLeGtn%2F7JliZ07nSm6XDEzEqdwn4mBQHIVnma0%3D&amp;reserved=0
> > 
> > 
> 
> Interesting, could we introduce is_protected 1-bit flag into struct
> dma_buf ?

That was the earlier proposal, yeah.

> struct dma_buf_ops.map_dma_buf and struct dma_buf_ops.unmap_dma_buf
> could become optional for such buffer ?
> 

map_dma_buf and unmap_dma_buf are needed to give devices access to the
dma-buf, I don't think they should become optional.

Mapping to the CPU maybe should be optional/disallowed for protected
buffers.

> > On Tue, Aug 02, 2022 at 11:58:41AM +0200, Olivier Masse wrote:
> > > add Linaro secure heap bindings: linaro,secure-heap
> > > use genalloc to allocate/free buffer from buffer pool.
> > > buffer pool info is from dts.
> > > use sg_table instore the allocated memory info, the length of
> > > sg_table is 1.
> > > implement secure_heap_buf_ops to implement buffer share in
> > > difference device:
> > > 1. Userspace passes this fd to all drivers it wants this buffer
> > > to share with: First the filedescriptor is converted to a &dma_buf
> > > using
> > > dma_buf_get(). Then the buffer is attached to the device using
> > > dma_buf_attach().
> > > 2. Once the buffer is attached to all devices userspace can
> > > initiate DMA
> > > access to the shared buffer. In the kernel this is done by calling
> > > dma_buf_map_attachment()
> > > 3. get sg_table with dma_buf_map_attachment in difference device.
> > > 
> > > Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
> > > ---
> > >  drivers/dma-buf/heaps/Kconfig       |  21 +-
> > >  drivers/dma-buf/heaps/Makefile      |   1 +
> > >  drivers/dma-buf/heaps/secure_heap.c | 588
> > > ++++++++++++++++++++++++++++
> > >  3 files changed, 606 insertions(+), 4 deletions(-)
> > >  create mode 100644 drivers/dma-buf/heaps/secure_heap.c
> > > 
> > > diff --git a/drivers/dma-buf/heaps/Kconfig b/drivers/dma-
> > > buf/heaps/Kconfig
> > > index 6a33193a7b3e..b2406932192e 100644
> > > --- a/drivers/dma-buf/heaps/Kconfig
> > > +++ b/drivers/dma-buf/heaps/Kconfig
> > > @@ -1,8 +1,12 @@
> > > -config DMABUF_HEAPS_DEFERRED_FREE
> > > -     tristate
> > > +menuconfig DMABUF_HEAPS_DEFERRED_FREE
> > > +     bool "DMA-BUF heaps deferred-free library"
> > > +     help
> > > +       Choose this option to enable the DMA-BUF heaps deferred-
> > > free library.
> > > 
> > > -config DMABUF_HEAPS_PAGE_POOL
> > > -     tristate
> > > +menuconfig DMABUF_HEAPS_PAGE_POOL
> > > +     bool "DMA-BUF heaps page-pool library"
> > > +     help
> > > +       Choose this option to enable the DMA-BUF heaps page-pool
> > > library.
> > > 
> > >  config DMABUF_HEAPS_SYSTEM
> > >       bool "DMA-BUF System Heap"
> > > @@ -26,3 +30,12 @@ config DMABUF_HEAPS_DSP
> > >            Choose this option to enable the dsp dmabuf heap. The
> > > dsp heap
> > >            is allocated by gen allocater. it's allocated according
> > > the dts.
> > >            If in doubt, say Y.
> > > +
> > > +config DMABUF_HEAPS_SECURE
> > > +     tristate "DMA-BUF Secure Heap"
> > > +     depends on DMABUF_HEAPS && DMABUF_HEAPS_DEFERRED_FREE
> > > +     help
> > > +       Choose this option to enable the secure dmabuf heap. The
> > > secure heap
> > > +       pools are defined according to the DT. Heaps are allocated
> > > +       in the pools using gen allocater.
> > > +       If in doubt, say Y.
> > > diff --git a/drivers/dma-buf/heaps/Makefile b/drivers/dma-
> > > buf/heaps/Makefile
> > > index e70722ea615e..08f6aa5919d1 100644
> > > --- a/drivers/dma-buf/heaps/Makefile
> > > +++ b/drivers/dma-buf/heaps/Makefile
> > > @@ -4,3 +4,4 @@ obj-$(CONFIG_DMABUF_HEAPS_PAGE_POOL)  +=
> > > page_pool.o
> > >  obj-$(CONFIG_DMABUF_HEAPS_SYSTEM)    += system_heap.o
> > >  obj-$(CONFIG_DMABUF_HEAPS_CMA)               += cma_heap.o
> > >  obj-$(CONFIG_DMABUF_HEAPS_DSP)          += dsp_heap.o
> > > +obj-$(CONFIG_DMABUF_HEAPS_SECURE)    += secure_heap.o
> > > diff --git a/drivers/dma-buf/heaps/secure_heap.c b/drivers/dma-
> > > buf/heaps/secure_heap.c
> > > new file mode 100644
> > > index 000000000000..31aac5d050b4
> > > --- /dev/null
> > > +++ b/drivers/dma-buf/heaps/secure_heap.c
> > > @@ -0,0 +1,588 @@
> > > +// SPDX-License-Identifier: GPL-2.0
> > > +/*
> > > + * DMABUF secure heap exporter
> > > + *
> > > + * Copyright 2021 NXP.
> > > + */
> > > +
> > > +#include <linux/dma-buf.h>
> > > +#include <linux/dma-heap.h>
> > > +#include <linux/dma-mapping.h>
> > > +#include <linux/err.h>
> > > +#include <linux/genalloc.h>
> > > +#include <linux/highmem.h>
> > > +#include <linux/mm.h>
> > > +#include <linux/module.h>
> > > +#include <linux/of.h>
> > > +#include <linux/of_fdt.h>
> > > +#include <linux/of_reserved_mem.h>
> > > +#include <linux/scatterlist.h>
> > > +#include <linux/slab.h>
> > > +#include <linux/vmalloc.h>
> > > +
> > > +#include "deferred-free-helper.h"
> > > +#include "page_pool.h"
> > > +
> > > +#define MAX_SECURE_HEAP 2
> > > +#define MAX_HEAP_NAME_LEN 32
> > > +
> > > +struct secure_heap_buffer {
> > > +     struct dma_heap *heap;
> > > +     struct list_head attachments;
> > > +     struct mutex lock;
> > > +     unsigned long len;
> > > +     struct sg_table sg_table;
> > > +     int vmap_cnt;
> > > +     struct deferred_freelist_item deferred_free;
> > > +     void *vaddr;
> > > +     bool uncached;
> > > +};
> > > +
> > > +struct dma_heap_attachment {
> > > +     struct device *dev;
> > > +     struct sg_table *table;
> > > +     struct list_head list;
> > > +     bool no_map;
> > > +     bool mapped;
> > > +     bool uncached;
> > > +};
> > 
> > I think dma_heap_attachment should have a more specific name,
> > otherwise it looks like some generic part of the dma_heap framework.
> 
> ok, how about secure_heap_attachment which sound more logical ?
> 

Yes that sounds better.

> > 
> > > +
> > > +struct secure_heap_info {
> > > +     struct gen_pool *pool;
> > > +
> > > +     bool no_map;
> > > +};
> > > +
> > > +struct rmem_secure {
> > > +     phys_addr_t base;
> > > +     phys_addr_t size;
> > > +
> > > +     char name[MAX_HEAP_NAME_LEN];
> > > +
> > > +     bool no_map;
> > > +};
> > > +
> > > +static struct rmem_secure secure_data[MAX_SECURE_HEAP] = {0};
> > > +static unsigned int secure_data_count;
> > > +
> > > +static struct sg_table *dup_sg_table(struct sg_table *table)
> > > +{
> > > +     struct sg_table *new_table;
> > > +     int ret, i;
> > > +     struct scatterlist *sg, *new_sg;
> > > +
> > > +     new_table = kzalloc(sizeof(*new_table), GFP_KERNEL);
> > > +     if (!new_table)
> > > +             return ERR_PTR(-ENOMEM);
> > > +
> > > +     ret = sg_alloc_table(new_table, table->orig_nents,
> > > GFP_KERNEL);
> > > +     if (ret) {
> > > +             kfree(new_table);
> > > +             return ERR_PTR(-ENOMEM);
> > > +     }
> > > +
> > > +     new_sg = new_table->sgl;
> > > +     for_each_sgtable_sg(table, sg, i) {
> > > +             sg_set_page(new_sg, sg_page(sg), sg->length, sg-
> > > >offset);
> > > +             new_sg->dma_address = sg->dma_address;
> > > +#ifdef CONFIG_NEED_SG_DMA_LENGTH
> > > +             new_sg->dma_length = sg->dma_length;
> > > +#endif
> > > +             new_sg = sg_next(new_sg);
> > > +     }
> > > +
> > > +     return new_table;
> > > +}
> > > +
> > > +static int secure_heap_attach(struct dma_buf *dmabuf,
> > > +                           struct dma_buf_attachment *attachment)
> > > +{
> > > +     struct secure_heap_buffer *buffer = dmabuf->priv;
> > > +     struct secure_heap_info *info = dma_heap_get_drvdata(buffer-
> > > >heap);
> > > +     struct dma_heap_attachment *a;
> > > +     struct sg_table *table;
> > > +
> > > +     a = kzalloc(sizeof(*a), GFP_KERNEL);
> > > +     if (!a)
> > > +             return -ENOMEM;
> > > +
> > > +     table = dup_sg_table(&buffer->sg_table);
> > > +     if (IS_ERR(table)) {
> > > +             kfree(a);
> > > +             return -ENOMEM;
> > > +     }
> > > +
> > > +     a->table = table;
> > > +     a->dev = attachment->dev;
> > > +     INIT_LIST_HEAD(&a->list);
> > > +     a->no_map = info->no_map;
> > > +     a->mapped = false;
> > > +     a->uncached = buffer->uncached;
> > > +     attachment->priv = a;
> > > +
> > > +     mutex_lock(&buffer->lock);
> > > +     list_add(&a->list, &buffer->attachments);
> > > +     mutex_unlock(&buffer->lock);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void secure_heap_detach(struct dma_buf *dmabuf,
> > > +                            struct dma_buf_attachment *attachment)
> > > +{
> > > +     struct secure_heap_buffer *buffer = dmabuf->priv;
> > > +     struct dma_heap_attachment *a = attachment->priv;
> > > +
> > > +     mutex_lock(&buffer->lock);
> > > +     list_del(&a->list);
> > > +     mutex_unlock(&buffer->lock);
> > > +
> > > +     sg_free_table(a->table);
> > > +     kfree(a->table);
> > > +     kfree(a);
> > > +}
> > > +
> > > +static struct sg_table *secure_heap_map_dma_buf(struct
> > > dma_buf_attachment *attachment,
> > > +                                             enum
> > > dma_data_direction direction)
> > > +{
> > > +     struct dma_heap_attachment *a = attachment->priv;
> > > +     struct sg_table *table = a->table;
> > > +     int attr = 0;
> > > +     int ret;
> > > +
> > > +     if (!a->no_map) {
> > 
> > This looks strange - you're expecting this driver to be used on
> > regions with no-map set, but if no-map _is_ set, you don't allow the
> > dma_buf to get mapped to any devices. Doesn't that mean that these
> > buffers can never actually be used?
> 
> if no-map is not set, map_dma_buf is mapping the buffer.
> 

no-map prevents the memory region from being added to the kernel's
linear mapping. Irrespective of no-map, map_dma_buf is needed to map
a buffer to a device, this should be orthogonal to no-map, and is
definitely required for devices to be able to use these buffers.

> > 
> > > +             if (a->uncached)
> > > +                     attr = DMA_ATTR_SKIP_CPU_SYNC;
> > > +
> > 
> > If the CPU can never touch these buffers, is cached vs uncached
> > meaningful?
> 
> indeed, but as dma_buf_ops.map_dma_buf is mandatory, this flag as well
> as no-map were introduce to manage uncached mapped buffer.
> 

Uncached mapping where? I think we're agreed that these buffers can
never be mapped for (non-trusted) CPU access, therefore (non-trusted)
CPU cache maintenance doesn't apply. Devices may still have cached
mappings, but it's up to device drivers to manage that.

> to simplify everything, secure-heap could get rid of no-map and
> uncached flags and set an is_protected flag in dma_buf ?
> 

I think that sounds better, yeah.

> 
> > If the TEE touches the buffers from the CPU then perhaps the TEE
> > would
> > need to do cache maintenance, but I'd expect that to be managed in
> > the
> > TEE.
> 
> yes, if needed cache maintenance should be done in TA.
> 
> > 
> > > +             ret = dma_map_sgtable(attachment->dev, table,
> > > direction, attr);
> > > +             if (ret)
> > > +                     return ERR_PTR(ret);
> > > +
> > > +             a->mapped = true;
> > > +     }
> > > +
> > > +     return table;
> > > +}
> > > +
> > > +static void secure_heap_unmap_dma_buf(struct dma_buf_attachment
> > > *attachment,
> > > +                                   struct sg_table *table,
> > > +                                   enum dma_data_direction
> > > direction)
> > > +{
> > > +     struct dma_heap_attachment *a = attachment->priv;
> > > +     int attr = 0;
> > > +
> > > +     if (!a->no_map) {
> > > +             if (a->uncached)
> > > +                     attr = DMA_ATTR_SKIP_CPU_SYNC;
> > > +
> > > +             a->mapped = false;
> > > +             dma_unmap_sgtable(attachment->dev, table, direction,
> > > attr);
> > > +     }
> > > +}
> > > +
> > > +static int secure_heap_dma_buf_begin_cpu_access(struct dma_buf
> > > *dmabuf,
> > > +                                             enum
> > > dma_data_direction direction)
> > 
> > If the firewall is preventing CPU accesses, then shouldn't
> > begin_cpu_access and end_cpu_access either fail or be a no-op?
> 
> true, both of them are optional and could be removed.
> 
> > 
> > > +{
> > > +     struct secure_heap_buffer *buffer = dmabuf->priv;
> > > +     struct dma_heap_attachment *a;
> > > +
> > > +     mutex_lock(&buffer->lock);
> > > +
> > > +     if (buffer->vmap_cnt)
> > > +             invalidate_kernel_vmap_range(buffer->vaddr, buffer-
> > > >len);
> > > +
> > > +     if (!buffer->uncached) {
> > > +             list_for_each_entry(a, &buffer->attachments, list) {
> > > +                     if (!a->mapped)
> > > +                             continue;
> > > +                     dma_sync_sgtable_for_cpu(a->dev, a->table,
> > > direction);
> > > +             }
> > > +     }
> > > +     mutex_unlock(&buffer->lock);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int secure_heap_dma_buf_end_cpu_access(struct dma_buf
> > > *dmabuf,
> > > +                                           enum dma_data_direction
> > > direction)
> > > +{
> > > +     struct secure_heap_buffer *buffer = dmabuf->priv;
> > > +     struct dma_heap_attachment *a;
> > > +
> > > +     mutex_lock(&buffer->lock);
> > > +
> > > +     if (buffer->vmap_cnt)
> > > +             flush_kernel_vmap_range(buffer->vaddr, buffer->len);
> > > +
> > > +     if (!buffer->uncached) {
> > > +             list_for_each_entry(a, &buffer->attachments, list) {
> > > +                     if (!a->mapped)
> > > +                             continue;
> > > +                     dma_sync_sgtable_for_device(a->dev, a->table, 
> > > direction);
> > > +             }
> > > +     }
> > > +     mutex_unlock(&buffer->lock);
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int secure_heap_mmap(struct dma_buf *dmabuf, struct
> > > vm_area_struct *vma)
> > > +{
> > > +     struct secure_heap_buffer *buffer = dmabuf->priv;
> > > +     struct sg_table *table = &buffer->sg_table;
> > > +     unsigned long addr = vma->vm_start;
> > > +     struct sg_page_iter piter;
> > > +     int ret;
> > > +
> > > +     if (buffer->uncached)
> > > +             vma->vm_page_prot = pgprot_writecombine(vma-
> > > >vm_page_prot);
> > > +
> > > +     for_each_sgtable_page(table, &piter, vma->vm_pgoff) {
> > > +             struct page *page = sg_page_iter_page(&piter);
> > > +
> > > +             ret = remap_pfn_range(vma, addr, page_to_pfn(page),
> > > PAGE_SIZE,
> > > +                                   vma->vm_page_prot);
> > 
> > If the CPU can't touch these buffers, what would they be mapped to
> > userspace for?
> 
> again, let's remove this optional ops.
> 
> > 
> > > +             if (ret)
> > > +                     return ret;
> > > +             addr += PAGE_SIZE;
> > > +     }
> > > +     return 0;
> > > +}
> > > +
> > > +static void *secure_heap_do_vmap(struct secure_heap_buffer
> > > *buffer)
> > > +{
> > > +     struct sg_table *table = &buffer->sg_table;
> > > +     int npages = PAGE_ALIGN(buffer->len) / PAGE_SIZE;
> > > +     struct page **pages = vmalloc(sizeof(struct page *) *
> > > npages);
> > > +     struct page **tmp = pages;
> > > +     struct sg_page_iter piter;
> > > +     pgprot_t pgprot = PAGE_KERNEL;
> > > +     void *vaddr;
> > > +
> > > +     if (!pages)
> > > +             return ERR_PTR(-ENOMEM);
> > > +
> > > +     if (buffer->uncached)
> > > +             pgprot = pgprot_writecombine(PAGE_KERNEL);
> > > +
> > > +     for_each_sgtable_page(table, &piter, 0) {
> > > +             WARN_ON(tmp - pages >= npages);
> > > +             *tmp++ = sg_page_iter_page(&piter);
> > > +     }
> > > +
> > > +     vaddr = vmap(pages, npages, VM_MAP, pgprot);
> > > +     vfree(pages);
> > 
> > Similar to above, if the CPU can't touch these buffers, what would be
> > the point of mapping them to the kernel?
> 
> indeed, useless code.
> 
> > 
> > > +
> > > +     if (!vaddr)
> > > +             return ERR_PTR(-ENOMEM);
> > > +
> > > +     return vaddr;
> > > +}
> > > +
> > > +static int secure_heap_vmap(struct dma_buf *dmabuf, struct
> > > dma_buf_map *map)
> > > +{
> > > +     struct secure_heap_buffer *buffer = dmabuf->priv;
> > > +     void *vaddr;
> > > +     int ret = 0;
> > > +
> > > +     mutex_lock(&buffer->lock);
> > > +     if (buffer->vmap_cnt) {
> > > +             buffer->vmap_cnt++;
> > > +             goto out;
> > > +     }
> > > +
> > > +     vaddr = secure_heap_do_vmap(buffer);
> > > +     if (IS_ERR(vaddr)) {
> > > +             ret = PTR_ERR(vaddr);
> > > +             goto out;
> > > +     }
> > > +
> > > +     buffer->vaddr = vaddr;
> > > +     buffer->vmap_cnt++;
> > > +     dma_buf_map_set_vaddr(map, buffer->vaddr);
> > > +out:
> > > +     mutex_unlock(&buffer->lock);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static void secure_heap_vunmap(struct dma_buf *dmabuf, struct
> > > dma_buf_map *map)
> > > +{
> > > +     struct secure_heap_buffer *buffer = dmabuf->priv;
> > > +
> > > +     mutex_lock(&buffer->lock);
> > > +     if (!--buffer->vmap_cnt) {
> > > +             vunmap(buffer->vaddr);
> > > +             buffer->vaddr = NULL;
> > > +     }
> > > +     mutex_unlock(&buffer->lock);
> > > +     dma_buf_map_clear(map);
> > > +}
> > > +
> > > +static void secure_heap_zero_buffer(struct secure_heap_buffer
> > > *buffer)
> > > +{
> > > +     struct sg_table *sgt = &buffer->sg_table;
> > > +     struct sg_page_iter piter;
> > > +     struct page *p;
> > > +     void *vaddr;
> > > +
> > > +     for_each_sgtable_page(sgt, &piter, 0) {
> > > +             p = sg_page_iter_page(&piter);
> > > +             vaddr = kmap_atomic(p);
> > > +             memset(vaddr, 0, PAGE_SIZE);
> > 
> > How can you do memset on the buffer if the firewall is preventing CPU
> > accesses?
> > 
> 
> yes, useless if we set a secure flag to prevent driver from mapping
> allocated buffer.
> 

Wouldn't you still want the buffers to be zeroed? I think you need
a way to ask the TEE to zero them.

This also makes me wonder about the deferred free mechanism. If you
aren't zeroing then there's no need for the deferred free, and if
allocations are coming from a reserved-memory region then the shrinker
mechanism doesn't make sense because freeing up the deferred buffers
won't help relieve memory pressure.

I wonder if it would be better to have a more specialised deferred
free mechanism as part of this heap (if necessary), rather than
library-ise it as you have in patch 1.

> > > +             kunmap_atomic(vaddr);
> > > +     }
> > > +}
> > > +
> > > +static void secure_heap_buf_free(struct deferred_freelist_item
> > > *item,
> > > +                              enum df_reason reason)
> > > +{
> > > +     struct secure_heap_buffer *buffer;
> > > +     struct secure_heap_info *info;
> > > +     struct sg_table *table;
> > > +     struct scatterlist *sg;
> > > +     int i;
> > > +
> > > +     buffer = container_of(item, struct secure_heap_buffer,
> > > deferred_free);
> > > +     info = dma_heap_get_drvdata(buffer->heap);
> > > +
> > > +     if (!info->no_map) {
> > > +             // Zero the buffer pages before adding back to the
> > > pool
> > > +             if (reason == DF_NORMAL)
> > > +                     secure_heap_zero_buffer(buffer);
> > > +     }
> > > +
> > > +     table = &buffer->sg_table;
> > > +     for_each_sg(table->sgl, sg, table->nents, i)
> > > +             gen_pool_free(info->pool, sg_dma_address(sg),
> > > sg_dma_len(sg));
> > > +
> > > +     sg_free_table(table);
> > > +     kfree(buffer);
> > > +}
> > > +
> > > +static void secure_heap_dma_buf_release(struct dma_buf *dmabuf)
> > > +{
> > > +     struct secure_heap_buffer *buffer = dmabuf->priv;
> > > +     int npages = PAGE_ALIGN(buffer->len) / PAGE_SIZE;
> > > +
> > > +     deferred_free(&buffer->deferred_free, secure_heap_buf_free,
> > > npages);
> > > +}
> > > +
> > > +static const struct dma_buf_ops secure_heap_buf_ops = {
> > > +     .attach = secure_heap_attach,
> > > +     .detach = secure_heap_detach,
> > > +     .map_dma_buf = secure_heap_map_dma_buf,
> > > +     .unmap_dma_buf = secure_heap_unmap_dma_buf,
> > > +     .begin_cpu_access = secure_heap_dma_buf_begin_cpu_access,
> > > +     .end_cpu_access = secure_heap_dma_buf_end_cpu_access,
> > > +     .mmap = secure_heap_mmap,
> > > +     .vmap = secure_heap_vmap,
> > > +     .vunmap = secure_heap_vunmap,
> > > +     .release = secure_heap_dma_buf_release,
> > > +};
> > > +
> > > +static struct dma_buf *secure_heap_do_allocate(struct dma_heap
> > > *heap,
> > > +                                            unsigned long len,
> > > +                                            unsigned long
> > > fd_flags,
> > > +                                            unsigned long
> > > heap_flags,
> > > +                                            bool uncached)
> > > +{
> > > +     struct secure_heap_buffer *buffer;
> > > +     struct secure_heap_info *info = dma_heap_get_drvdata(heap);
> > > +     DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
> > > +     unsigned long size = roundup(len, PAGE_SIZE);
> > > +     struct dma_buf *dmabuf;
> > > +     struct sg_table *table;
> > > +     int ret = -ENOMEM;
> > > +     unsigned long phy_addr;
> > > +
> > > +     buffer = kzalloc(sizeof(*buffer), GFP_KERNEL);
> > > +     if (!buffer)
> > > +             return ERR_PTR(-ENOMEM);
> > > +
> > > +     INIT_LIST_HEAD(&buffer->attachments);
> > > +     mutex_init(&buffer->lock);
> > > +     buffer->heap = heap;
> > > +     buffer->len = size;
> > > +     buffer->uncached = uncached;
> > > +
> > > +     phy_addr = gen_pool_alloc(info->pool, size);
> > > +     if (!phy_addr)
> > > +             goto free_buffer;
> > > +
> > > +     table = &buffer->sg_table;
> > > +     if (sg_alloc_table(table, 1, GFP_KERNEL))
> > > +             goto free_pool;
> > > +
> > > +     sg_set_page(table->sgl, phys_to_page(phy_addr), size, 0);
> > > +     sg_dma_address(table->sgl) = phy_addr;
> > > +     sg_dma_len(table->sgl) = size;
> > > +
> > > +     /* create the dmabuf */
> > > +     exp_info.exp_name = dma_heap_get_name(heap);
> > > +     exp_info.ops = &secure_heap_buf_ops;
> > > +     exp_info.size = buffer->len;
> > > +     exp_info.flags = fd_flags;
> > > +     exp_info.priv = buffer;
> > > +     dmabuf = dma_buf_export(&exp_info);
> > > +     if (IS_ERR(dmabuf)) {
> > > +             ret = PTR_ERR(dmabuf);
> > > +             goto free_pages;
> > > +     }
> > > +
> > > +     return dmabuf;
> > > +
> > > +free_pages:
> > > +     sg_free_table(table);
> > > +
> > > +free_pool:
> > > +     gen_pool_free(info->pool, phy_addr, size);
> > > +
> > > +free_buffer:
> > > +     mutex_destroy(&buffer->lock);
> > > +     kfree(buffer);
> > > +
> > > +     return ERR_PTR(ret);
> > > +}
> > > +
> > > +static struct dma_buf *secure_heap_allocate(struct dma_heap *heap,
> > > +                                         unsigned long len,
> > > +                                         unsigned long fd_flags,
> > > +                                         unsigned long heap_flags)
> > > +{
> > > +     // use uncache buffer here by default
> > > +     return secure_heap_do_allocate(heap, len, fd_flags,
> > > heap_flags, true);
> > > +     // use cache buffer
> > > +     // return secure_heap_do_allocate(heap, len, fd_flags,
> > > heap_flags, false);
> > > +}
> > > +
> > > +static const struct dma_heap_ops secure_heap_ops = {
> > > +     .allocate = secure_heap_allocate,
> > > +};
> > > +
> > > +static int secure_heap_add(struct rmem_secure *rmem)
> > > +{
> > > +     struct dma_heap *secure_heap;
> > > +     struct dma_heap_export_info exp_info;
> > > +     struct secure_heap_info *info = NULL;
> > > +     struct gen_pool *pool = NULL;
> > > +     int ret = -EINVAL;
> > > +
> > > +     if (rmem->base == 0 || rmem->size == 0) {
> > > +             pr_err("secure_data base or size is not correct\n");
> > > +             goto error;
> > > +     }
> > > +
> > > +     info = kzalloc(sizeof(*info), GFP_KERNEL);
> > > +     if (!info) {
> > > +             pr_err("dmabuf info allocation failed\n");
> > > +             ret = -ENOMEM;
> > > +             goto error;
> > > +     }
> > > +
> > > +     pool = gen_pool_create(PAGE_SHIFT, -1);
> > > +     if (!pool) {
> > > +             pr_err("can't create gen pool\n");
> > > +             ret = -ENOMEM;
> > > +             goto error;
> > > +     }
> > > +
> > > +     if (gen_pool_add(pool, rmem->base, rmem->size, -1) < 0) {
> > > +             pr_err("failed to add memory into pool\n");
> > > +             ret = -ENOMEM;
> > > +             goto error;
> > > +     }
> > > +
> > > +     info->pool = pool;
> > > +     info->no_map = rmem->no_map;
> > 
> > This kind of heap probably can't work if the region doesn't have
> > no-map, so I think it would make sense to enforce that no_map is set
> > (or ignore regions without no-map in DT).
> 
> if no-map is not set, secure-heap could be used as a heap with
> dynamically protected buffer from the TEE.

That would need a whole bunch more code to call in to the TEE to apply
the protection. So hypothetically yes, that's true, but not without
more code than what you have here.

> but I agree that this is adding too much complexity and could be
> simplify a lot without this mapping consideration.
> 
> then no-map is probably not the perfect term to describe this heap.
> is_s
> ecure or is_protected would be better ?

You mean in device-tree? no-map has a well-defined meaning; and if
this memory region shouldn't be added to the kernel's linear map
then it should be tagged with no-map.

Whether there should also be some DT property indicating that the
region is protected and can't be accessed normally: I don't have
much of an opinion on that.

Thanks,
-Brian

> 
> > 
> > Cheers,
> > -Brian
> > 
> > > +
> > > +     exp_info.name = rmem->name;
> > > +     exp_info.ops = &secure_heap_ops;
> > > +     exp_info.priv = info;
> > > +
> > > +     secure_heap = dma_heap_add(&exp_info);
> > > +     if (IS_ERR(secure_heap)) {
> > > +             pr_err("dmabuf secure heap allocation failed\n");
> > > +             ret = PTR_ERR(secure_heap);
> > > +             goto error;
> > > +     }
> > > +
> > > +     return 0;
> > > +
> > > +error:
> > > +     kfree(info);
> > > +     if (pool)
> > > +             gen_pool_destroy(pool);
> > > +
> > > +     return ret;
> > > +}
> > > +
> > > +static int secure_heap_create(void)
> > > +{
> > > +     unsigned int i;
> > > +     int ret;
> > > +
> > > +     for (i = 0; i < secure_data_count; i++) {
> > > +             ret = secure_heap_add(&secure_data[i]);
> > > +             if (ret)
> > > +                     return ret;
> > > +     }
> > > +     return 0;
> > > +}
> > > +
> > > +static int rmem_secure_heap_device_init(struct reserved_mem *rmem,
> > > +                                      struct device *dev)
> > > +{
> > > +     dev_set_drvdata(dev, rmem);
> > > +     return 0;
> > > +}
> > > +
> > > +static void rmem_secure_heap_device_release(struct reserved_mem
> > > *rmem,
> > > +                                      struct device *dev)
> > > +{
> > > +     dev_set_drvdata(dev, NULL);
> > > +}
> > > +
> > > +static const struct reserved_mem_ops rmem_dma_ops = {
> > > +     .device_init    = rmem_secure_heap_device_init,
> > > +     .device_release = rmem_secure_heap_device_release,
> > > +};
> > > +
> > > +static int __init rmem_secure_heap_setup(struct reserved_mem
> > > *rmem)
> > > +{
> > > +     if (secure_data_count < MAX_SECURE_HEAP) {
> > > +             int name_len = 0;
> > > +             char *s = rmem->name;
> > > +
> > > +             secure_data[secure_data_count].base = rmem->base;
> > > +             secure_data[secure_data_count].size = rmem->size;
> > > +             secure_data[secure_data_count].no_map =
> > > +                     (of_get_flat_dt_prop(rmem->fdt_node, "no-
> > > map", NULL) != NULL);
> > > +
> > > +             while (name_len < MAX_HEAP_NAME_LEN) {
> > > +                     if ((*s == '@') || (*s == '\0'))
> > > +                             break;
> > > +                     name_len++;
> > > +                     s++;
> > > +             }
> > > +             if (name_len == MAX_HEAP_NAME_LEN)
> > > +                     name_len--;
> > > +
> > > +             strncpy(secure_data[secure_data_count].name, rmem-
> > > >name, name_len);
> > > +
> > > +             rmem->ops = &rmem_dma_ops;
> > > +             pr_info("Reserved memory: DMA buf secure pool %s at
> > > %pa, size %ld MiB\n",
> > > +                     secure_data[secure_data_count].name,
> > > +                     &rmem->base, (unsigned long)rmem->size /
> > > SZ_1M);
> > > +
> > > +             secure_data_count++;
> > > +             return 0;
> > > +     }
> > > +     WARN_ONCE(1, "Cannot handle more than %u secure heaps\n",
> > > MAX_SECURE_HEAP);
> > > +     return -EINVAL;
> > > +}
> > > +
> > > +RESERVEDMEM_OF_DECLARE(secure_heap, "linaro,secure-heap",
> > > rmem_secure_heap_setup);
> > > +
> > > +module_init(secure_heap_create);
> > > +MODULE_LICENSE("GPL v2");
> > > --
> > > 2.25.0
> > > 
