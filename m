Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFA4284A55
	for <lists+dri-devel@lfdr.de>; Tue,  6 Oct 2020 12:30:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12C146E111;
	Tue,  6 Oct 2020 10:30:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690061.outbound.protection.outlook.com [40.107.69.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51BD06E111
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Oct 2020 10:30:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/Cc9RUcHCpCD/SGp7bC9MqXNHo1VP+e640WIYWqQ+qBr4jrZzgdae3/9YYiSVve0tYmDc0nIjC8977QRoymcKfBaubIxXVVbwmY4ttH8gGSzBx0E29uiJoq2IDMv2kFcRpc1sqVXE4pI/eFt8ogJSR+0WmMvMaSlOq/UaYEDuKVwHBzYn9JGi1QWwvQ9e/HqnRwNnamCgttaMCGAwiLQdIWaXYYXsOASGFmedohXa7bQeVwLElIoef5wciRbRwMkDmu3owvMroBoOMoouwVtboxGqPq0OuKm2C0yVQOctbyN7fEuX7jezUZXJE469M2bXqYtguq/jX0hifANdH5Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mr9+HLUnpc3W9UEfqmIUVpBnNxVq7PQ79+0rHRBKoGM=;
 b=gVPeldaL7m/R5fbPRoVmocMFDv1ioJOHHGdBOgGe+9HmnXHZBjMC0fx61syaY4Ls2JRtet15yqzsz8TlK51bemXrvh7BtuqDIFZeYRXGytYEDdeLg+1pFBUpF9Ejs11UgG9NkRqCmb1+pSKn18cCzQFXQGn4hnZ+asaSta29Bg3MMW3T6KvMYZUDXTu/Y/RBB+SLafN9TcKvJhsZO9ptB2tvKveEffDUEZal8AeQbRvOUsDI+d8NszxRUX151h8y3000/8kBUu5pw4ABkzhaQnjgFSlwHsWbq3lAqnttSPetJfUZb+OI67RGK8C3rXNGBtr2p/5lddU4MwWNKA5q/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mr9+HLUnpc3W9UEfqmIUVpBnNxVq7PQ79+0rHRBKoGM=;
 b=WXV2/p2/sxeZOo9Vy3RFWeZEjnbLCFgm8gIfuv83XBdSz+zcgmx0W8dlEUMkynoTbnJu7/3NlrbQHNrVTW5xO5n6fYOS3Ltkdp7Lrob3QlB9nqrJEKBSV1O3kSNBn19P/+joGOzekv6Bq6F4h2ugOdmH+hkJxd1W3BtRf0Gyo8g=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4142.namprd12.prod.outlook.com (2603:10b6:208:1dd::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3433.43; Tue, 6 Oct
 2020 10:30:02 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::f8f7:7403:1c92:3a60%6]) with mapi id 15.20.3433.044; Tue, 6 Oct 2020
 10:30:02 +0000
Subject: Re: [PATCH 0/5] ttm make move callback compulsory
To: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org
References: <20201006000644.1005758-1-airlied@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <0b2e25d3-702d-100b-8b90-499950c26a12@amd.com>
Date: Tue, 6 Oct 2020 12:29:54 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20201006000644.1005758-1-airlied@gmail.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
X-ClientProxiedBy: AM0PR10CA0077.EURPRD10.PROD.OUTLOOK.COM
 (2603:10a6:208:15::30) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
 (2a02:908:1252:fb60:be8a:bd56:1f94:86e7) by
 AM0PR10CA0077.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:208:15::30) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3433.36 via Frontend Transport; Tue, 6 Oct 2020 10:30:01 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: 82545878-3569-4c24-7f3f-08d869e2c857
X-MS-TrafficTypeDiagnostic: MN2PR12MB4142:
X-Microsoft-Antispam-PRVS: <MN2PR12MB414235D9971B2CBC15A2E945830D0@MN2PR12MB4142.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: o7IafBz6PGGa8vw+n7CYgOHwiXfnGodo2iBmOKrw8ZxYRUDfMlmoBADCeeX9XECxguI5/ox6tXI1+PKs3puEQSOqgiAIRjUUW3XQ7Kr/td+8L6BrX8wxVGYDARynqPY3pwy2y6xih74d4lqVInK8zNxjlbBcnZDNY3EcferoKO+C1gixqnfZopS3Pw49QPUdY1qbKcgcxZjS5OdK3gKr0K1l3rJh72Qm8xxr4ojs/BF1YFuXU5jXWYOoDpgL/eE8Jf5gsEGyJb1Vg2X79J+axQA1YEtWl20EtTUXjEfvTRJVY8M7oAKJpX2lSt2p/j+DQQgUuPe5Lzrp5zN7KQukgDJVmR1GsfOz4Dokgr0r5TkUPcwxT6iZwXUis0+i3UdS
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(376002)(366004)(396003)(136003)(31696002)(2906002)(16526019)(52116002)(8936002)(6486002)(316002)(4744005)(4326008)(8676002)(186003)(86362001)(66556008)(478600001)(5660300002)(6666004)(31686004)(66476007)(66946007)(36756003)(2616005)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: znW5jmZ22rW5jW78kda/HZj9Le5st356iXyb8/dfmwX6DYmCrTDbZsw9Y/3z7ZI93LLeHLuAGUKoS07ErzyTMc60ILHWRPeDnIRJmPF2ergrH0R1B4gFXbDBkpohFjsGIV1PfUAU5YVHTk3s72uKBE8HDGfc0mEu6Ixf2BveurzDUOeVuB9GGLLokSDZHu4xaIiWr0p/9DQbbOLsRNeJ6Rn1wpqT63u0vBTqRtzoOcStt7vTm/Uf/zRXc4nhP4wsVJRbNCfzK2EEBdP/UpuMMV/1rMfJe2aCp4tOoGs6pVh1Af0Js56/3baKKi8BMiHib/LF5fcJZp55f+/lMb95gDtqc454Gm5CWB40D2eKJVPSbntW69HCacPA11DRVhUP09m73VviyShKGCwegiWkw6mQAEZv0TjfjwNWCMqmvODCPs2BxMaEDaItxmTS9fz3X2AD5nb81RrJ7tbvA+yyUZX20WK3DGtnmLCzHKea8cIq3W1NR3xZyVA1TZqFZwA1l8mPugMHPzlkc25kusTy3iPJanUmZe/xoO0CvaeEOhkvm52O7savKSFozbGB30nKnqZcM9Mu1aQFRmyM7rq+AnQEVD35x2uriUL7qhnj6A4TLvA56JWVafJNJeFuN36wRKsfEyxIv50mKyM7hIkaHP593evPD8n/kMXTgQfF51/7ZijZkbrnz8E28OOeVE5mk7eOAGwMz+lgwr6iF7xmng==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82545878-3569-4c24-7f3f-08d869e2c857
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2020 10:30:02.1905 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jfTAe/LMzXdaipk0Z7+9UBdv2b++Md83d80HK3xADE2TXYeYIBuBAeV6S5hap/O+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4142
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
Cc: rscheidegger.oss@gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Patches #1-#4 Acked-by: Christian K=F6nig <cristian.koenig@amd.com>

Patch #5 Reviewed-by: Christian K=F6nig <christian.koenig@amd.com>

Am 06.10.20 um 02:06 schrieb Dave Airlie:
> I've just pulled out the few bits for making the move callback compulsory
> from my previous series.
>
> The vmwgfx ones need acks/r-bs, I've booted them in vmplayer and they
> seem to work fine.
>
> Dave.
>
>

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
