Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8347AD0160E
	for <lists+dri-devel@lfdr.de>; Thu, 08 Jan 2026 08:20:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5D0710E69B;
	Thu,  8 Jan 2026 07:20:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from cstnet.cn (smtp84.cstnet.cn [159.226.251.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13E510E69B;
 Thu,  8 Jan 2026 07:20:10 +0000 (UTC)
Received: from localhost.localdomain (unknown [36.112.3.223])
 by APP-05 (Coremail) with SMTP id zQCowAA3yQyoWl9p8pn3Aw--.46387S2;
 Thu, 08 Jan 2026 15:20:08 +0800 (CST)
From: Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
To: oak.zeng@amd.com
Cc: Alexander.Deucher@amd.com, Christian.Koenig@amd.com,
 Felix.Kuehling@amd.com, airlied@gmail.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, lihaoxiang@isrc.iscas.ac.cn,
 linux-kernel@vger.kernel.org, simona@ffwll.ch, stable@vger.kernel.org
Subject: Re: [PATCH v2] drm/amdkfd: fix a memory leak in
 device_queue_manager_init()
Date: Thu,  8 Jan 2026 15:20:07 +0800
Message-Id: <20260108072007.299229-1-lihaoxiang@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <BYAPR12MB3176BA15327312EC21B8ED228085A@BYAPR12MB3176.namprd12.prod.outlook.com>
References: <BYAPR12MB3176BA15327312EC21B8ED228085A@BYAPR12MB3176.namprd12.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: zQCowAA3yQyoWl9p8pn3Aw--.46387S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
 VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYB7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E
 6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
 kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUJVWUCwA2z4x0Y4vE2Ix0cI8I
 cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26r1j6r4UM28EF7xvwVC2z280aV
 CY1x0267AKxVW8JVW8Jr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE
 5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeV
 CFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1l
 FIxGxcIEc7CjxVA2Y2ka0xkIwI1l42xK82IYc2Ij64vIr41l4c8EcI0Ec7CjxVAaw2AFwI
 0_Jw0_GFyl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s02
 6x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
 kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUF9a9DUUUU
X-Originating-IP: [36.112.3.223]
X-CM-SenderInfo: 5olkt0x0ld0ww6lv2u4olvutnvoduhdfq/1tbiBgoBE2lfTzYmIQAAsW
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

On Thu, 8 Jan 2026 02:15:12 +0000, Zeng wrote:
> } in last line should be in a new line.

Hi, Zeng! I rechecked my patch and found that this issue does not
appear in the version I submitted. I’m not sure why this discrepancy
occurred, but I’ve sent a v3 revision anyway and hope it now shows
up correctly.

> Other than that, patch lgtm. Reviewed-by: Oak.Zeng@amd.com

Thanks for review!

Thanks,
Haoxiang Li  

